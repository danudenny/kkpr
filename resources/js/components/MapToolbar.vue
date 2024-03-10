<template>
    <div
        class="w-1/3 bg-white rounded-sm px-4 py-2 text-slate-800 fixed top-[85px] shadow-lg mx-auto md:left-72 left-60 right-0 z-40 opacity-90"
    >
        <div>
            <div class="flex items-center mx-auto">
                <MapToolbarItem iconName="la-plus-solid" @toggle="addData" />
                <MapToolbarItem iconName="la-print-solid" @toggle="printMap" />
                <MapToolbarItem
                    iconName="la-hand-pointer"
                    :isActive="isInfoClicked"
                    @toggle="showInfo"
                />

                <VerticalDivider />

                <MapToolbarItem
                    iconName="la-crop-alt-solid"
                    :isActive="isClipped"
                    @toggle="clippedPolygon"
                />
                <MapToolbarItem
                    iconName="la-pencil-alt-solid"
                    :isActive="isDrawLine"
                    @toggle="drawLine"
                />
                <MapToolbarItem
                    iconName="la-draw-polygon-solid"
                    :isActive="isDrawPolygon"
                    @toggle="drawPolygon"
                />
                <MapToolbarItem
                    iconName="la-map-marker-alt-solid"
                    :isActive="isDrawMarker"
                    @toggle="drawMarker"
                />
                <MapToolbarItem
                    iconName="la-circle"
                    :isActive="isDrawCircle"
                    @toggle="drawCircle"
                />
                <MapToolbarItem
                    iconName="la-ruler-solid"
                    :isActive="isMeasure"
                    @toggle="measure"
                />
                <MapToolbarItem
                    iconName="la-trash-alt-solid"
                    @toggle="clearDrawnItems"
                />

                <VerticalDivider />

                <MapToolbarItem
                    iconName="la-search-plus-solid"
                    @toggle="zoomIn"
                />
                <MapToolbarItem
                    iconName="la-search-minus-solid"
                    @toggle="zoomOut"
                />
                <MapToolbarItem
                    iconName="la-arrows-alt-solid"
                    @toggle="zoomExtent"
                />
            </div>
        </div>
        <div
            v-if="
                isDrawPolygon ||
                isDrawMarker ||
                isDrawCircle ||
                isMeasure ||
                isInfoClicked ||
                isDrawLine ||
                isClipped
            "
            class="bg-neutral-300 w-[150px] rounded-sm px-1 py-1 text-slate-800 fixed top-[60px] shadow-lg mx-auto left-0 z-40 transition-all duration-300 ease-in-out"
        >
            <button
                class="px-2 py-1 mr-1 text-xs text-white uppercase bg-green-500 rounded-md hover:bg-slate-200 hover:text-slate-800"
                @click="done"
            >
                <VIcon name="la-check-solid" scale=".7" fill="white" />
                Done
            </button>
            <button
                class="px-2 py-1 text-xs text-white uppercase bg-red-500 rounded-md hover:bg-slate-200 hover:text-slate-800"
                @click="deleteFeature"
            >
                <VIcon name="la-trash-alt-solid" scale=".7" fill="white" />
                Delete
            </button>
        </div>
    </div>
</template>

<script>
import { addIcons } from "oh-vue-icons";
import VerticalDivider from "./VerticalDivider.vue";
import MapToolbarItem from "./MapToolbarItem.vue";
import {
    LaPlusSolid,
    LaCropAltSolid,
    LaPencilAltSolid,
    LaPrintSolid,
    LaDrawPolygonSolid,
    LaMapMarkerAltSolid,
    LaRulerSolid,
    LaTrashAltSolid,
    LaSearchPlusSolid,
    LaSearchMinusSolid,
    LaCameraSolid,
    LaWindowCloseSolid,
    LaCheckSolid,
    LaCircle,
    LaArrowsAltSolid,
    LaHandPointer,
} from "oh-vue-icons/icons";

addIcons(
    LaPlusSolid,
    LaCropAltSolid,
    LaPencilAltSolid,
    LaPrintSolid,
    LaDrawPolygonSolid,
    LaMapMarkerAltSolid,
    LaRulerSolid,
    LaTrashAltSolid,
    LaSearchPlusSolid,
    LaSearchMinusSolid,
    LaCameraSolid,
    LaWindowCloseSolid,
    LaCheckSolid,
    LaCircle,
    LaArrowsAltSolid,
    LaHandPointer
);

export default {
    name: "MapToolbar",
    data() {
        return {
            isInfoClicked: false,
            isClipped: false,
            isDrawLine: false,
            isDrawPolygon: false,
            isDrawMarker: false,
            isDrawCircle: false,
            isMeasure: false,
            isDone: false,
            isDelete: false,
        };
    },
    components: {
        VerticalDivider,
        MapToolbarItem,
    },
    methods: {
        addData() {
            this.$emit("addData");
        },
        printMap() {
            this.$emit("printMap");
        },
        showInfo() {
            this.isInfoClicked = !this.isInfoClicked;
            this.$emit("showInfo");
        },
        clippedPolygon() {
            this.isClipped = !this.isClipped;
            this.$emit("clippedPolygon");
        },
        drawLine() {
            this.isDrawLine = !this.isDrawLine;
            this.$emit("drawLine");
        },
        drawPolygon() {
            this.isDrawPolygon = !this.isDrawPolygon;
            this.$emit("drawPolygon");
        },
        drawMarker() {
            this.isDrawMarker = !this.isDrawMarker;
            this.$emit("drawMarker");
        },
        drawCircle() {
            this.isDrawCircle = !this.isDrawCircle;
            this.$emit("drawCircle");
        },
        measure() {
            this.isMeasure = !this.isMeasure;
            this.$emit("measure");
        },
        clearDrawnItems() {
            this.$emit("clearDrawnItems");
        },
        zoomIn() {
            this.$emit("zoomIn");
        },
        zoomOut() {
            this.$emit("zoomOut");
        },
        zoomExtent() {
            this.$emit("zoomExtent");
        },
        done() {
            this.isDone = !this.isDone;
            this.$emit("done");
        },
        deleteFeature() {
            this.isDelete = !this.isDelete;
            this.$emit("deleteFeature");
        },
    },
};
</script>

<style></style>
