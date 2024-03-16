<template>
    <div>
        <div
            v-if="isLoading"
            class="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-50"
        >
            <div
                class="flex items-center gap-4 p-4 bg-white rounded-lg shadow-lg"
            >
                <VIcon name="la-spinner-solid" animation="spin" speed="slow" />
                <span class="text-lg font-semibold text-green-500"
                    >Please Wait</span
                >
            </div>
        </div>
        <div>
            <Sidebar
                @toogleBaseMapSelector="toogleBaseMapSelector"
                @toogleTableSelector="toggleTableSelector"
                @toogleToolbarSelector="toggleToolbarSelector"
                @uploadShapefile="uploadShapefile"
                @toggleLayer="toggleLayer"
                v-model="transparent"
                @update:transparent="handleUpdate"
                :colors="colors"
            />
        </div>
        <div
            class="absolute right-0 z-30 flex sm:w-4/5 w-full h-[calc(100vh-73px)] bg-neutral-50 top-[73px] map-wrapper"
        >
            <div id="map" class="w-full h-full"></div>
        </div>
        <div>
            <button
                class="fixed z-30 p-2 text-white bg-red-500 rounded-md top-[80px] right-4 hover:bg-red-400 border-b-4 border-b-red-600 text-xs uppercase tracking-widest font-bold flex items-center gap-2"
                @click="resetDataPolaRuang"
            >
                <VIcon name="ri-restart-fill" />
                <span> Reset Map </span>
            </button>
        </div>
        <div>
            <ChartInformation
                v-if="chartData"
                :class="`overflow-auto w-[350px] h-[calc(100%-73px)] fixed right-0 top-[73px] bg-white shadow-md z-40 bottom-0 transition-all duration-300 ease-in-out' ${
                    chartData ? 'translate-x-0' : 'translate-x-full'
                }`"
                :chartData="chartData"
                :colors="colors"
            />
        </div>
        <div>
            <RightInformation
                :class="`overflow-auto w-[300px] h-[calc(100%-73px)] fixed right-0 top-[73px] bg-white shadow-md z-40 bottom-0 transition-all duration-300 ease-in-out' ${
                    shwoInformation ? 'translate-x-0' : 'translate-x-full'
                }`"
            >
                <div>
                    <div class="flex items-center justify-between px-4">
                        <h1
                            class="text-lg font-semibold tracking-widest text-center text-green-500 uppercase"
                        >
                            Information
                        </h1>
                        <button
                            @click="shwoInformation = false"
                            class="text-2xl text-red-500 hover:text-red-600"
                        >
                            &times;
                        </button>
                    </div>
                    <hr class="border-t-2 border-green-500" />
                    <div class="p-2">
                        <table class="w-full text-xs tracking-wide uppercase">
                            <tr>
                                <td class="font-semibold">Nama</td>
                                <td>:</td>
                                <td>{{ information.namobj }}</td>
                            </tr>
                            <tr>
                                <td class="font-semibold">Kabupaten</td>
                                <td>:</td>
                                <td>{{ information.wadmkk }}</td>
                            </tr>
                            <tr>
                                <td class="font-semibold">Kecamatan</td>
                                <td>:</td>
                                <td>{{ information.wadmkc }}</td>
                            </tr>
                            <tr>
                                <td class="font-semibold">Orde 1</td>
                                <td>:</td>
                                <td>{{ information.orde1 }}</td>
                            </tr>
                            <tr>
                                <td class="font-semibold">Orde 2</td>
                                <td>:</td>
                                <td>{{ information.orde2 }}</td>
                            </tr>
                            <tr>
                                <td class="font-semibold">Jenis</td>
                                <td>:</td>
                                <td>{{ information.jnsspr }}</td>
                            </tr>
                            <tr>
                                <td class="font-semibold">Luas</td>
                                <td>:</td>
                                <td>{{ information.luas }}</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </RightInformation>
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
                @toggleTableSelector="toggleTableSelector"
                @showOnMap="showOnMap"
                @resetDataPolaRuang="resetDataPolaRuang"
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
import RightInformation from "../components/RightInformation.vue";
import ChartInformation from "../components/ChartInformation.vue";
import Sidebar from "../layouts/shared/Sidebar.vue";
import Table from "../components/Table.vue";
import axios from "axios";
import WMSCapabilities from "wms-capabilities";
import layerItems from "../data/layers.js";

import { addIcons } from "oh-vue-icons";
import { LaSpinnerSolid, RiRestartFill } from "oh-vue-icons/icons";

addIcons(LaSpinnerSolid, RiRestartFill);

export default {
    name: "Home",
    components: {
        BasemapSelector,
        Sidebar,
        Table,
        RightInformation,
        ChartInformation,
    },
    data() {
        return {
            map: null,
            wmsLayer: null,
            adminLayer: null,
            filteredWmsLayer: null,
            centerLat: -2.3986904,
            centerLng: 104.8166695,
            defaultZoom: 9,
            defaultBaseMapUrl:
                "https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",
            showBaseMapSelector: false,
            showTableSelector: false,
            showToolbarSelector: false,
            shwoInformation: false,
            drawControl: null,
            isLoading: false,
            layers: [],
            information: {},
            colors: {
                fill: [],
                title: [],
            },
            transparent: 1,
            chartData: null,
            isUploading: false,
            isChecked: true,
        };
    },
    mounted() {
        this.initMap();
    },
    methods: {
        handleUpdate(newValue) {
            this.transparent = newValue;
        },
        initMap() {
            this.map = L.map("map").setView(
                [this.centerLat, this.centerLng],
                this.defaultZoom
            );
            this.selectbaseMap(this.defaultBaseMapUrl);
            this.loadWmsLayer();
            this.legendLoader();
        },
        loadWmsLayer() {
            const wmsUrl =
                "http://103.127.133.120:8080/geoserver/banyuasin/wms";

            this.wmsLayer = L.tileLayer.wms(wmsUrl, {
                layers: "banyuasin:polaruang_rtrwbanyuasin",
                format: "image/png",
                transparent: true,
                attribution: "Kabupaten Banyuasin",
                zIndex: 4,
            });

            this.adminLayer = L.tileLayer
                .wms(wmsUrl, {
                    layers: "banyuasin:administrasikecamatan_ar_50k",
                    format: "image/png",
                    transparent: true,
                    attribution: "Kabupaten Banyuasin",
                    zIndex: 5,
                })
                .addTo(this.map);

            this.$watch("transparent", (newValue) => {
                this.wmsLayer.options.opacity = newValue;
                this.wmsLayer.redraw();

                if (this.filteredWmsLayer) {
                    this.filteredWmsLayer.options.opacity = newValue;
                    this.filteredWmsLayer.redraw();
                }

                this.map.eachLayer((layer) => {
                    if (layer instanceof L.TileLayer.WMS) {
                        layer.options.opacity = newValue;
                        layer.redraw();
                    }
                });

                this.map.eachLayer((layer) => {
                    if (layer instanceof L.GeoJSON) {
                        layer.setStyle({ fillOpacity: newValue });
                    }
                });
            });

            this.wmsLayer.addTo(this.map);

            this.layers.push(this.wmsLayer, this.adminLayer);

            this.map.on("click", (e) => {
                const lat = e.latlng.lat;
                const long = e.latlng.lng;
                axios
                    .get(
                        `http://103.127.133.120:8082/api/analytics/filter-geojson?lat=${lat}&long=${long}`
                    )
                    .then((response) => {
                        const features = response.data.features;

                        if (features.length === 0) {
                            this.shwoInformation = false;
                            return;
                        }

                        this.information = features[0].properties;
                        const geojsonLayer = L.geoJSON(features, {
                            style: {
                                fillColor: "transparent",
                                color: "yellow",
                            },
                        });

                        if (this.information) {
                            this.isLoading = true;
                            this.shwoInformation = true;
                        }

                        geojsonLayer.addTo(this.map);

                        this.map.fitBounds(geojsonLayer.getBounds());
                        this.map.on("click", (e) => {
                            this.map.eachLayer((layer) => {
                                if (layer instanceof L.GeoJSON) {
                                    this.map.removeLayer(layer);
                                }
                            });
                        });

                        this.isLoading = false;
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
            if (this.showToolbarSelector) {
                const drawnItems = new L.FeatureGroup();
                this.map.addLayer(drawnItems);
                this.drawControl = new L.Control.Draw({
                    edit: {
                        featureGroup: drawnItems,
                    },
                });
                this.map.addControl(this.drawControl);
            } else {
                this.map.removeControl(this.drawControl);
            }
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
        uploadShapefile(file, isUploading) {
            this.isUploading = isUploading;

            this.isLoading = true;
            const formData = new FormData();
            formData.append("file", file);
            fetch(
                "http://103.127.133.120:8082/api/analytics/clip-shapefiles-from-shp",
                {
                    method: "POST",
                    body: formData,
                }
            )
                .then((response) => response.json())
                .then((data) => {
                    this.isUploading = false;
                    const features = data.clipped_geojson.features;
                    const geojsonLayer = L.geoJSON(features, {
                        onEachFeature: (feature, layer) => {
                            layer.bindPopup(this.popupContent(features), {
                                maxWidth: 800,
                            });
                        },
                    });
                    geojsonLayer.addTo(this.map);

                    this.map.fitBounds(geojsonLayer.getBounds());

                    if (features && features.length > 0) {
                        this.chartData = data.clipped_percentage;
                    }

                    this.isLoading = false;
                })
                .catch((error) => {
                    console.error("Error:", error);
                });
        },
        toggleLayer(name, isChecked) {
            this.isChecked = isChecked;
            this.layers.forEach((layer) => {
                if (layer.options.layers === name) {
                    if (this.map.hasLayer(layer)) {
                        this.map.removeLayer(layer);
                    } else {
                        layer.addTo(this.map);
                    }
                }
            });
        },
        toggleTableSelector() {
            this.showTableSelector = !this.showTableSelector;
        },
        showOnMap(data) {
            this.isLoading = true;
            const wmsUrl =
                "http://103.127.133.120:8080/geoserver/banyuasin/wms";

            const { nameObj, jenisSarana, kecamatan } = data;

            const cql_namobj = nameObj ? `namobj='${nameObj}'` : "";
            const cql_jnsspr = jenisSarana ? `jnsspr='${jenisSarana}'` : "";

            const cql_wadmkc = kecamatan ? `wadmkc='${kecamatan}'` : "";

            const cql = [cql_namobj, cql_jnsspr, cql_wadmkc].filter(
                (cql) => cql
            );

            const layer_params = {
                layers: "banyuasin:polaruang_rtrwbanyuasin",
                format: "image/png",
                transparent: true,
                attribution: "Kabupaten Banyuasin",
                zIndex: 4,
                cql_filter: cql.join(" AND "),
            };

            this.filteredWmsLayer = L.tileLayer.wms(wmsUrl, layer_params);

            this.map.eachLayer((layer) => {
                if (layer instanceof L.TileLayer.WMS) {
                    this.map.removeLayer(layer);
                }
            });

            this.filteredWmsLayer.addTo(this.map);

            this.isLoading = false;
        },
        resetDataPolaRuang() {
            this.map.eachLayer((layer) => {
                if (layer instanceof L.TileLayer.WMS) {
                    this.map.removeLayer(layer);
                }
            });

            if (this.filteredWmsLayer) {
                this.map.removeLayer(this.filteredWmsLayer);
            }

            this.map.eachLayer((layer) => {
                if (layer instanceof L.GeoJSON) {
                    this.map.removeLayer(layer);
                }
            });

            this.wmsLayer.addTo(this.map);
            this.map.setView(
                [this.centerLat, this.centerLng],
                this.defaultZoom
            );
        },
        legendLoader() {
            const apiUrl =
                "http://103.127.133.120:8080/geoserver/rest/workspaces/banyuasin/styles/rtrwba.sld";
            axios
                .get(apiUrl, {
                    auth: {
                        username: "admin",
                        password: "geoserver",
                    },
                })
                .then((response) => {
                    const parser = new DOMParser();
                    const xmlDoc = parser.parseFromString(
                        response.data,
                        "text/xml"
                    );

                    const colorElements = xmlDoc.getElementsByName("fill");
                    const titleElements =
                        xmlDoc.getElementsByTagName("ogc:Literal");

                    const colors = [];

                    for (let i = 0; i < colorElements.length; i++) {
                        colors.push(colorElements[i].textContent);
                    }

                    const titles = [];

                    for (let i = 0; i < titleElements.length; i++) {
                        titles.push(titleElements[i].textContent);
                    }

                    colors.fill = colors;
                    colors.title = titles;

                    this.colors = colors.map((color, index) => {
                        return {
                            id: index + 1,
                            name: titles[index],
                            title: titles[index],
                            color: color,
                        };
                    });
                });
        },
    },
};
</script>
