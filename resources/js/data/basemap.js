const bingMapsKey =
    "X6ZSh2QcMxbUe2taDM7P~RBJ68nKx6FyUMTxTgf9ojA~AnbiMSnfI5Wx0Iej-vtzyvuU7Rkh2t4WcBPfrbvwDsNaKUK9WiidPaAki-BBHcE-";

const mapBoxToken =
    "pk.eyJ1IjoiZGFudWRlbm5qIiwiYSI6ImNsbjRmZWRzYjA0ZGgya3FoOWZyYTFnczIifQ.ZCLrfouIIbufGF-T3tBj9Q";

const baseMapItems = [
    {
        name: "Open Street Map",
        url: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        options: {
            maxZoom: 19,
        },
        thumbnail: "https://a.tile.openstreetmap.org/0/0/0.png",
        attribution: "&copy; OpenStreetMap contributors",
    },
    {
        name: "Esri World Imagery",
        url: "https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",
        options: {
            maxZoom: 19,
        },
        thumbnail:
            "https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/0/0/0",
        attribution:
            "Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community",
    },
    {
        name: "Esri World Street Map",
        url: "https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}",
        options: {
            maxZoom: 19,
        },
        thumbnail:
            "https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/0/0/0",
        attribution: "Tiles &copy; Esri",
    },
    {
        name: "Esri World Topo Map",
        url: "https://server.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}",
        options: {
            maxZoom: 19,
        },
        thumbnail:
            "https://server.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/0/0/0",
        attribution: "Tiles &copy; Esri",
    },
    {
        name: "CartoDB Dark",
        url: "https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png",
        options: {
            maxZoom: 19,
        },
        thumbnail: "https://a.basemaps.cartocdn.com/dark_all/0/0/0.png",
        attribution: "Tiles &copy; CartoDB",
    },
    {
        name: "CartoDB Light",
        url: "https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png",
        options: {
            maxZoom: 19,
        },
        thumbnail: "https://a.basemaps.cartocdn.com/light_all/0/0/0.png",
        attribution: "Tiles &copy; CartoDB",
    },
    {
        name: "Wikimedia",
        url: "https://maps.wikimedia.org/osm-intl/{z}/{x}/{y}{r}.png",
        options: {
            maxZoom: 19,
        },
        thumbnail: "https://maps.wikimedia.org/osm-intl/0/0/0.png",
        attribution: "&copy; Wikimedia",
    },
    {
        name: "Open Topo Map",
        url: "https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png",
        options: {
            maxZoom: 17,
        },
        thumbnail: "https://a.tile.opentopomap.org/0/0/0.png",
        attribution: "Tiles &copy; OpenTopoMap",
    },
    {
        name: "Mapbox Streets",
        url: `https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/256/{z}/{x}/{y}@2x?access_token=${mapBoxToken}`,
        options: {
            maxZoom: 19,
        },
        thumbnail: `https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/256/0/0/0@2x?access_token=${mapBoxToken}`,
        attribution: "&copy; Mapbox",
    },
    {
        name: "Mapbox Satellite V9",
        url: `https://api.mapbox.com/styles/v1/mapbox/satellite-v9/tiles/256/{z}/{x}/{y}@2x?access_token=${mapBoxToken}`,
        options: {
            maxZoom: 19,
        },
        thumbnail: `https://api.mapbox.com/styles/v1/mapbox/satellite-v9/tiles/256/0/0/0@2x?access_token=${mapBoxToken}`,
        attribution: "&copy; Mapbox",
    },
];

export default baseMapItems;
