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
                    <span class="text-2xl font-bold tracking-wider">KKPR</span>
                    <span class="font-semibold tracking-tight text-md"
                        >Kabupaten Banyuasin</span
                    >
                </div>
            </div>
            <div class="flex gap-2 mt-10 text-sm">
                <button
                    class="w-full p-2 font-semibold text-white bg-green-500 border-b-4 border-r-4 border-green-600 rounded-md hover:bg-green-600"
                    @click="toogleBaseMapSelector"
                >
                    <i class="fas fa-plus-circle"></i> Basemap
                </button>
                <button
                    class="w-full p-2 font-semibold text-white bg-teal-500 border-b-4 border-r-4 border-teal-600 rounded-md hover:bg-teal-600"
                    @click="toggleToolbarSelector"
                >
                    <i class="fas fa-plus-circle"></i> Tools
                </button>
                <button
                    class="w-full p-2 font-semibold text-white border-b-4 border-r-4 rounded-md bg-lime-500 border-lime-600 hover:bg-lime-600"
                    @click="toogleTableSelector"
                >
                    <i class="fas fa-plus-circle"></i> Tables
                </button>
            </div>
            <hr class="my-4 border-t-2 border-green-500" />
            <div class="flex flex-col gap-2 mt-4">
                <SidebarAccordion
                    v-for="(title, index) in titles"
                    :key="index"
                    :title="title"
                    :title_id="title.toLowerCase().replace(' ', '-')"
                >
                    <LayerCard />
                </SidebarAccordion>
            </div>
        </div>
        <Footer />
    </aside>
</template>

<script>
import Footer from "./Footer.vue";
import SidebarAccordion from "../../components/SidebarAccordion.vue";
import LayerCard from "../../components/LayerCard.vue";
export default {
    name: "Sidebar",
    components: {
        Footer,
        SidebarAccordion,
        LayerCard,
    },
    data() {
        return {
            titles: ["Legend", "Layers", "Information", "Filters"],
            title_id: "",
            otherAccordions: [],
        };
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
    },
};
</script>
