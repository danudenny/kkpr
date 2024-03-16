import json
import time
from typing import Optional
import zipfile
import os
from fastapi import APIRouter, File, HTTPException, Depends, UploadFile
from sqlalchemy import text
from config.database import SessionLocal
from sqlalchemy.orm import Session
import geopandas as gpd
from shapely import wkt
from loguru import logger
import pyproj
import urllib


def db_connect():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


a_router = APIRouter(
    prefix="/analytics",
    tags=["analytics"],
)


@a_router.post("/clip-shapefiles-from-geojson")
def clip_shapefiles(input: dict = None, db: Session = Depends(db_connect)):
    try:
        start_time = time.time()
        input = input.get("input")
        input_gdf = gpd.GeoDataFrame.from_features(input["features"]).set_crs(
            "EPSG:4326"
        )

        sql = text(
            """
                SELECT 
                    gid,
                    ST_Transform(ST_Force2D(ST_SetSRID(geom, 32748)), 4326) AS geometry,
                    orde1,
                    orde2,
                    jnsspr,
                    namobj
                FROM polaruang_rtrwbanyuasin
            """
        )
        shapefile = gpd.GeoDataFrame.from_postgis(sql, db.bind, geom_col="geometry")

        shapefile = shapefile.set_index("gid")

        clipped_gdf = gpd.clip(shapefile, input_gdf)
        clipped_geojson = clipped_gdf.to_json(default=str)

        clipped_percentage = gpd.overlay(shapefile, input_gdf, how="intersection")
        clipped_percentage = (
            clipped_percentage.groupby("namobj").size().reset_index(name="count")
        )
        clipped_percentage = clipped_percentage.to_json()

        clipped_geojson = {
            "clipped_geojson": json.loads(clipped_geojson),
            "clipped_percentage": json.loads(clipped_percentage),
        }

        end_time = time.time()

        logger.info(f"Time taken to clip shapefiles: {end_time - start_time} seconds")

        return clipped_geojson

    except Exception as e:
        logger.error(e)
        raise HTTPException(status_code=500, detail="Internal Server Error")


@a_router.post("/clip-shapefiles-from-shp")
def clip_shapefiles_from_file(
    file: UploadFile = File(...), db: Session = Depends(db_connect)
):
    try:
        start_time = time.time()

        if file.filename.split(".")[-1] != "zip":
            raise HTTPException(status_code=400, detail="Invalid file type")

        upload_path = os.path.join("../public/uploads/shapefile", file.filename)

        if not os.path.exists("../public/uploads/shapefile"):
            os.makedirs("../public/uploads/shapefile")

        with open(upload_path, "wb") as buffer:
            buffer.write(file.file.read())

        with zipfile.ZipFile(upload_path, "r") as zip_ref:
            zip_ref.extractall("temp")

        shapefile = gpd.read_file("temp")
        shapefile = shapefile.set_crs("EPSG:4326")

        shapefile["area"] = CalculateHa(shapefile["geometry"])

        input = {
            "type": "FeatureCollection",
            "features": [
                {
                    "type": "Feature",
                    "properties": {},
                    "geometry": shapefile.unary_union.__geo_interface__,
                }
            ],
        }

        sql = text(
            """
                    SELECT 
                        gid,
                        ST_Transform(ST_Force2D(ST_SetSRID(geom, 32748)), 4326) AS geometry,
                        orde1,
                        orde2,
                        jnsspr,
                        namobj,
                        luas
                    FROM polaruang_rtrwbanyuasin
                """
        )
        query_result = gpd.GeoDataFrame.from_postgis(sql, db.bind, geom_col="geometry")
        query_result = query_result.set_index("gid")

        input_gdf = gpd.GeoDataFrame.from_features(input["features"]).set_crs(
            "EPSG:4326"
        )
        clipped_gdf = gpd.clip(query_result, input_gdf)
        clipped_geojson = clipped_gdf.to_json(default=str)
        clipped_percentage = gpd.overlay(query_result, input_gdf, how="intersection")

        clipped_percentage = clipped_percentage.set_crs("EPSG:4326")
        clipped_percentage["area"] = CalculateHa(clipped_percentage["geometry"])

        clipped_percentage = (
            clipped_percentage.groupby("namobj")["area"]
            .sum()
            .reset_index(name="clipped_area")
        )

        clipped_percentage["original_area"] = shapefile["area"].sum()

        clipped_percentage["clipped_percentage"] = (
            clipped_percentage["clipped_area"] / clipped_percentage["original_area"]
        ) * 100

        clipped_percentage["clipped_percentage"] = clipped_percentage[
            "clipped_percentage"
        ].apply(lambda x: round(x, 5))

        clipped_percentage = clipped_percentage.to_json()
        clipped_percentage = json.loads(clipped_percentage)

        combined_data = []

        for index, namobj in clipped_percentage["namobj"].items():
            combined_data.append(
                {
                    "namobj": namobj,
                    "clipped_area": clipped_percentage["clipped_area"][index],
                    "original_area": clipped_percentage["original_area"][index],
                    "clipped_percentage": clipped_percentage["clipped_percentage"][
                        index
                    ],
                }
            )

        clipped_geojson = {
            "clipped_geojson": json.loads(clipped_geojson),
            "clipped_percentage": combined_data,
        }

        end_time = time.time()
        logger.info(f"Time taken to clip shapefiles: {end_time - start_time} seconds")

        return clipped_geojson

    except Exception as e:
        logger.error(e)
        raise HTTPException(status_code=500, detail="Internal Server Error")


@a_router.get("/filter-geojson")
def filter_geojson(lat=None, long=None, db: Session = Depends(db_connect)):
    try:
        x, y = convert_4326_to_32748(lat, long)
        sql = text(
            f"""
                SELECT 
                    gid,
                    ST_Transform ( ST_Force2D ( ST_SetSRID ( geom, 32748 ) ), 4326 ) AS geometry,
                    orde1,
                    orde2,
                    jnsspr,
                    namobj,
                    wadmkk,
                    wadmkc,
                    luas
                FROM polaruang_rtrwbanyuasin
                WHERE ST_Contains(geom, ST_SetSRID(ST_MakePoint({x}, {y}), 4326))
            """
        )
        result = gpd.GeoDataFrame.from_postgis(sql, db.bind, geom_col="geometry")
        result = result.to_json(default=str)

        return json.loads(result)

    except Exception as e:
        logger.error(e)
        raise HTTPException(status_code=500, detail="Internal Server Error")


def convert_4326_to_32748(lat, long):
    proj = pyproj.Transformer.from_proj(
        pyproj.Proj(init="epsg:4326"), pyproj.Proj(init="epsg:32748"), always_xy=True
    )
    return proj.transform(long, lat)


def CalculateHa(area):
    wgs84 = pyproj.CRS("EPSG:4326")
    utm = pyproj.CRS("EPSG:3857")

    pyproj.Transformer.from_crs(wgs84, utm, always_xy=True).transform
    area = area.to_crs(utm)

    return area.area / 10**4
