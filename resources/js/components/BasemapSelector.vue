<template>
    <div
        class="flex flex-col items-center gap-2 p-2 transition-all duration-300 ease-in-out"
    >
        <div
            v-for="baseMap in baseMaps"
            :key="baseMap.name"
            class="flex items-center justify-start w-full space-x-2"
        >
            <input
                type="radio"
                :id="baseMap.name"
                :value="baseMap.name"
                v-model="baseMapSelected"
                @click="
                    selectbaseMap(
                        baseMap.name,
                        baseMap.url,
                        baseMap.attribution
                    )
                "
                class="hidden"
            />
            <div
                @click="
                    selectbaseMap(
                        baseMap.name,
                        baseMap.url,
                        baseMap.attribution
                    )
                "
                :class="[
                    'flex items-center w-full border-2 border-b-4 border-r-4 rounded-xl border-slate-500 hover:bg-green-400 cursor-pointer transition-all duration-300 ease-in-out',
                    {
                        'border-green-500': baseMap.name === baseMapSelected,
                    },
                    { 'bg-green-300': baseMap.name === baseMapSelected },
                    {
                        'border-green-500': baseMap.name === baseMapSelected,
                    },
                    { 'bg-green-300': baseMap.name === baseMapSelected },
                ]"
                :title="baseMap.name"
            >
                <img
                    :for="baseMap.name"
                    :src="baseMap.thumbnail"
                    :alt="baseMap.name"
                    class="w-20 h-20 rounded-lg cursor-pointer"
                />
                <label
                    :for="baseMap.name"
                    class="px-2 py-1 font-semibold text-gray-800 cursor-pointer"
                    >{{ baseMap.name }}</label
                >
            </div>
        </div>
    </div>
</template>

<script>
import baseMapItems from "../data/basemap";
import ButtonVue from "./Button.vue";
export default {
    name: "BasemapSelector",
    components: {
        ButtonVue,
    },
    data() {
        return {
            baseMaps: null,
            baseMapSelected: "Esri WorldImagery",
            showBasemapSelector: true,
            title: "Show Basemap",
        };
    },
    mounted() {
        this.initBaseMaps();
    },
    methods: {
        initBaseMaps() {
            this.baseMaps = baseMapItems;
        },
        selectbaseMap(name, url, attribution) {
            this.baseMapSelected = name;
            this.$emit("baseMapSelected", url, attribution);
        },
    },
};
</script>

<style></style>
