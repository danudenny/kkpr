<template>
    <div>
        <div>
            <Sidebar
                @toogleBaseMapSelector="toogleBaseMapSelector"
                @toogleTableSelector="toggleTableSelector"
                @toogleToolbarSelector="toggleToolbarSelector"
            />
        </div>
        <div
            class="absolute right-0 z-30 flex sm:w-4/5 w-full h-[calc(100vh-73px)] bg-neutral-50 top-[73px] map-wrapper"
        >
            <div id="map" class="w-full h-full"></div>
        </div>
        <div>
            <MapToolbar
                @drawPolygon="drawPolygon"
                @drawMarker="drawMarker"
                @clearDrawnItems="clearDrawnItems"
                :class="`transition-all duration-300 ease-in-out' ${
                    !showToolbarSelector
                        ? 'translate-y-0'
                        : 'translate-x-[180%]'
                }`"
            />
        </div>
        <div>
            <BasemapSelector
                @baseMapSelected="selectbaseMap"
                :class="`overflow-auto w-[300px] h-[calc(100%-73px)] fixed right-0 top-[73px] bg-white shadow-md z-30 bottom-0' ${
                    showBaseMapSelector ? 'translate-x-0' : 'translate-x-full'
                }`"
            />
        </div>
        <div>
            <Table
                :class="`fixed right-0 bg-white shadow-md z-30 bottom-0 transition-all duration-300 ease-in-out' ${
                    showTableSelector ? 'translate-y-0' : 'translate-y-full'
                }`"
            />
        </div>
    </div>
</template>

<script>
import "leaflet/dist/leaflet.css";
import L from "leaflet";
import "leaflet-draw/dist/leaflet.draw.css";
import "leaflet-draw/dist/leaflet.draw";
import BasemapSelector from "../components/BasemapSelector.vue";
import Sidebar from "../layouts/shared/Sidebar.vue";
import Table from "../components/Table.vue";
import MapToolbar from "../components/MapToolbar.vue";

export default {
    name: "Home",
    components: {
        BasemapSelector,
        Sidebar,
        Table,
        MapToolbar,
    },
    data() {
        return {
            map: null,
            wmsLayer: null,
            centerLat: -2.3986904,
            centerLng: 104.8166695,
            defaultZoom: 9,
            defaultBaseMapUrl:
                "https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",
            showBaseMapSelector: false,
            showTableSelector: false,
            showToolbarSelector: false,
        };
    },
    mounted() {
        this.initMap();
    },
    methods: {
        initMap() {
            this.map = L.map("map").setView(
                [this.centerLat, this.centerLng],
                this.defaultZoom
            );
            this.selectbaseMap(this.defaultBaseMapUrl);
            this.loadWmsLayer();
        },
        loadWmsLayer() {
            this.wmsLayer = L.tileLayer.wms(
                "http://localhost:8081/geoserver/banyuasin/wms",
                {
                    layers: "banyuasin:polaruang_rtrwbanyuasin",
                    format: "image/png",
                    transparent: true,
                    attribution: "Kabupaten Banyuasin",
                    zIndex: 4,
                }
            );
            this.wmsLayer.addTo(this.map);

            this.map.on("click", (e) => {
                const target = this.map.latLngToContainerPoint(
                    e.latlng,
                    this.map.getZoom()
                );

                const size = this.map.getSize();

                const sw = this.map.getBounds().getSouthWest();
                const ne = this.map.getBounds().getNorthEast();

                const params = {
                    SERVICE: "WMS",
                    VERSION: "1.1.1",
                    REQUEST: "GetFeatureInfo",
                    FORMAT: "application/json",
                    TRANSPARENT: true,
                    QUERY_LAYERS: "banyuasin:polaruang_rtrwbanyuasin",
                    LAYERS: "banyuasin:polaruang_rtrwbanyuasin",
                    exceptions: "application/vnd.ogc.se_inimage",
                    INFO_FORMAT: "application/json",
                    FEATURE_COUNT: 50,
                    X: target.x,
                    Y: target.y,
                    SRS: "EPSG:4326",
                    STYLES: "",
                    WIDTH: size.x,
                    HEIGHT: size.y,
                    bbox: `${sw.lng},${sw.lat},${ne.lng},${ne.lat}`,
                };

                const extendParams = L.Util.extend(params);
                const paramString = L.Util.getParamString(extendParams);

                const url = `http://localhost:8081/geoserver/banyuasin/wms${paramString}`;

                fetch(url)
                    .then((res) => {
                        res.json().then((json) => {
                            L.popup()
                                .setLatLng(e.latlng)
                                .setContent(this.popupContent(json.features))
                                .openOn(this.map);
                        });
                    })
                    .catch((err) => {
                        console.log(err);
                    });
            });
        },
        popupContent(features) {
            let content = "<div>";
            features.forEach((feature, index) => {
                content += `
                    <div>
                        <h4>Feature ${index + 1}</h4>
                        <ul>
                            <li>Name: ${feature.properties.namobj}</li>
                            <li>Orde 1: ${feature.properties.orde1}</li>
                        </ul>
                    </div>
                `;
            });
            content += "</div>";
            return content;
        },
        toogleBaseMapSelector() {
            this.showBaseMapSelector = !this.showBaseMapSelector;
        },
        toggleTableSelector() {
            this.showTableSelector = !this.showTableSelector;
        },
        toggleToolbarSelector() {
            this.showToolbarSelector = !this.showToolbarSelector;
        },
        selectbaseMap(url, attribution) {
            this.map.eachLayer((layer) => {
                if (!layer.options.layers) {
                    this.map.removeLayer(layer);
                }
            });
            L.tileLayer(url, {
                maxZoom: 19,
                zIndex: 1,
                attribution:
                    attribution ||
                    "Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community",
            }).addTo(this.map);

            if (this.wmsLayer) {
                this.wmsLayer.bringToFront();
            }
        },
        drawPolygon() {
            // const polygon = new L.Draw.Polygon(this.map);
            // polygon.enable();
            // this.map.on("draw:created", (e) => {
            //     const layer = e.layer;
            //     this.map.addLayer(layer);
            // });
            // this.map.on("draw:drawstart", () => {
            //     this.map.eachLayer((layer) => {
            //         if (layer instanceof L.Polygon) {
            //             this.map.removeLayer(layer);
            //         }
            //     });
            // });
            // this.map.on("draw:drawstop", () => {
            //     polygon.disable();
            // });
            // this.map.on("draw:deleted", () => {
            //     this.map.eachLayer((layer) => {
            //         if (layer instanceof L.Polygon) {
            //             this.map.removeLayer(layer);
            //         }
            //     });
            // });
        },
        drawMarker() {
            // const marker = new L.Draw.Marker(this.map);
            // marker.enable();
            // this.map.on("draw:created", (e) => {
            //     const layer = e.layer;
            //     this.map.addLayer(layer);
            // });
            // this.map.on("draw:drawstart", () => {
            //     this.map.eachLayer((layer) => {
            //         if (layer instanceof L.Marker) {
            //             this.map.removeLayer(layer);
            //         }
            //     });
            // });
            // this.map.on("draw:deleted", () => {
            //     this.map.eachLayer((layer) => {
            //         if (layer instanceof L.Marker) {
            //             this.map.removeLayer(layer);
            //         }
            //     });
            // });
        },
        clearDrawnItems() {
            this.map.eachLayer((layer) => {
                if (layer instanceof L.Polygon || layer instanceof L.Marker) {
                    this.map.removeLayer(layer);
                }
            });
        },
    },
};
</script>
