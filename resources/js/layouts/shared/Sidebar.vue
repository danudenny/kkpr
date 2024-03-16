<template>
    <aside
        class="absolute top-0 left-0 z-30 w-0 h-full overflow-auto transition-all duration-300 ease-in-out bg-green-100 shadow-md sm:w-1/5 md:w-1/5 lg:w-1/5 xl:w-1/5 sidebar"
    >
        <div class="p-4">
            <div class="flex items-center gap-4">
                <img
                    src="../../../../public/Lambang_Kabupaten_Banyuasin.png"
                    alt="Kabupaten Banyuasin"
                    class="h-[70px] w-auto"
                />
                <div class="flex flex-col gap-0">
                    <span
                        class="text-4xl font-bold tracking-widest logo-text text-slate-700"
                        >KKPR</span
                    >
                    <span
                        class="text-lg font-semibold tracking-tight text-slate-500"
                        >Kabupaten Banyuasin</span
                    >
                </div>
            </div>
            <div class="flex items-center gap-2 mt-10 text-sm">
                <button
                    class="w-full p-2 font-semibold text-white bg-green-500 border-b-4 border-r-4 border-green-600 rounded-md hover:bg-green-600"
                    @click="toogleBaseMapSelector"
                >
                    <VIcon name="hi-globe" />
                    Basemap
                </button>
                <button
                    class="w-full p-2 font-semibold text-white bg-teal-500 border-b-4 border-r-4 border-teal-600 rounded-md hover:bg-teal-600"
                    @click="toggleToolbarSelector"
                >
                    <VIcon name="hi-cog" />Tools
                </button>
                <button
                    class="w-full p-2 font-semibold text-white border-b-4 border-r-4 rounded-md bg-lime-500 border-lime-600 hover:bg-lime-600"
                    @click="toogleTableSelector"
                >
                    <VIcon name="hi-solid-table" /> Tables
                </button>
            </div>
            <hr class="my-4 border-t-2 border-green-500" />
            <div class="flex flex-col gap-2 mt-4">
                <div>
                    <input
                        type="file"
                        id="file"
                        ref="file"
                        class="hidden"
                        @change="uploadShapefile"
                    />
                    <button
                        class="w-full p-2 font-semibold text-white bg-yellow-500 border-b-4 border-r-4 border-yellow-600 rounded-md hover:bg-yellow-600"
                        @click="openFile"
                    >
                        <VIcon name="hi-upload" />
                        Upload Shapefile
                    </button>
                </div>
                <SidebarAccordion title="LAYERS" title_id="Layers">
                    <div v-for="layer in layers" :key="layer.id">
                        <div class="flex items-center gap-2">
                            <input
                                type="checkbox"
                                :id="layer.id"
                                :value="layer.name"
                                @change="toggleLayer(layer.name)"
                                class="w-4 h-4"
                                :checked="isChecked"
                            />
                            <label
                                :for="layer.id"
                                class="text-sm font-semibold tracking-tight cursor-pointer"
                                >{{ layer.title }}</label
                            >
                        </div>
                        <div class="p-1 mt-2">
                            <div class="flex justify-between">
                                <label
                                    for="transparent"
                                    class="text-xs font-semibold tracking-widest uppercase"
                                    >Opacity</label
                                >

                                <span
                                    class="text-xs font-black tracking-wider text-green-900"
                                    >{{ sliderValue }}</span
                                >
                            </div>

                            <input
                                type="range"
                                :id="layer.id"
                                name="transparent"
                                min="0"
                                max="1"
                                step="0.1"
                                class="w-full bg-green-200 accent-green-500"
                                v-model="sliderValue"
                                @input="updateParent"
                            />
                        </div>
                    </div>
                </SidebarAccordion>
                <SidebarAccordion title="LEGENDS" title_id="Legends">
                    <div v-for="color in colors" :key="color.id">
                        <table>
                            <tr>
                                <td>
                                    <div
                                        :style="{
                                            backgroundColor: color.color,
                                        }"
                                        class="w-4 h-4 mr-2 rounded-full"
                                    ></div>
                                </td>
                                <td
                                    class="text-sm font-semibold tracking-tight"
                                >
                                    {{ color.title }}
                                </td>
                            </tr>
                        </table>
                    </div>
                </SidebarAccordion>
                <!-- Download Report -->
                <div>
                    <button
                        class="w-full p-2 font-semibold text-white bg-blue-500 border-b-4 border-r-4 border-blue-600 rounded-md hover:bg-blue-600"
                        @click="downloadReport"
                    >
                        <VIcon name="hi-download" />
                        Download Report
                    </button>
                </div>
            </div>
        </div>
        <Footer />
    </aside>
</template>

<script>
import Footer from "./Footer.vue";
import SidebarAccordion from "../../components/SidebarAccordion.vue";
import layerItems from "../../data/layers.js";
import { addIcons } from "oh-vue-icons";
import {
    HiGlobe,
    HiCog,
    HiSolidTable,
    HiUpload,
    HiDownload,
} from "oh-vue-icons/icons";

addIcons(HiGlobe, HiCog, HiSolidTable, HiUpload, HiDownload);

export default {
    name: "Sidebar",
    components: {
        Footer,
        SidebarAccordion,
    },
    data() {
        return {
            filename: "",
            isUploading: false,
            file: null,
            isChecked: true,
            title: "",
            title_id: "",
            sliderValue: this.value,
        };
    },
    props: {
        isChecked: {
            type: Boolean,
            required: true,
            default: true,
        },
        value: {
            type: Number,
            required: true,
            default: 1,
        },
        colors: {
            type: Array,
            required: true,
        },
    },
    computed: {
        layers() {
            return layerItems;
        },
    },
    watch: {
        value(newValue) {
            this.sliderValue = newValue;
        },
        sliderValue(newValue) {
            this.$emit("input", newValue);
        },
    },
    methods: {
        toogleBaseMapSelector() {
            this.$emit("toogleBaseMapSelector");
        },
        toogleTableSelector() {
            this.$emit("toogleTableSelector");
        },
        toggleToolbarSelector() {
            this.$emit("toogleToolbarSelector");
        },
        openFile() {
            this.$refs.file.click();
        },
        uploadShapefile() {
            this.isUploading = true;
            const file = this.$refs.file.files[0];
            this.filename = file.name;
            this.$emit("uploadShapefile", file, this.isUploading);
            this.isUploading = false;
        },
        toggleLayer(name) {
            this.$emit("toggleLayer", name, this.isChecked);
        },
        downloadReport() {
            this.$emit("downloadReport");
        },
        updateParent() {
            this.$emit("update:transparent", this.sliderValue);
        },
    },
};
</script>

<style scoped>
.logo-text {
    font-family: "Paytone One", sans-serif;
}
</style>
