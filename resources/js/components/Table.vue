<template>
    <div
        class="bottom-0 right-0 z-40 w-4/5 p-3 overflow-auto bg-neutral-50 h-[350px] shadow-md"
    >
        <div class="p-4">
            <!-- Close button -->

            <div>
                <div class="flex items-center justify-between">
                    <h1 class="text-xl font-bold text-gray-900">
                        <VIcon name="ri-table-line" scale="1.5" fill="green" />
                        Tabel Pola Ruang RTRW Kabupaten Banyuasin
                    </h1>
                    <button
                        class="p-2 text-white"
                        @click="toggleTableSelector"
                        title="Close Table Selector"
                    >
                        <VIcon name="oi-x-circle-fill" fill="red" scale="1.5" />
                    </button>
                </div>
                <div class="flex items-center gap-2">
                    <div class="flex items-center justify-between my-4">
                        <div class="flex flex-col items-center">
                            <select
                                name="filterNameObj"
                                id="filterNameObj"
                                class="w-48 p-2 text-sm border border-gray-300 rounded-md"
                            >
                                <option value="" selected>
                                    Pilih Nama Objek
                                </option>
                                <option
                                    v-for="(name, index) in nameObject"
                                    :key="index"
                                    :value="name.namobj"
                                >
                                    {{ name.namobj }}
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="flex items-center justify-between my-4">
                        <div class="flex flex-col items-center">
                            <select
                                name="filterJenisSarana"
                                id="filterJenisSarana"
                                class="w-48 p-2 text-sm border border-gray-300 rounded-md"
                            >
                                <option value="" selected>Pilih Jenis</option>
                                <option
                                    v-for="(name, index) in nameJenis"
                                    :key="index"
                                    :value="name.jnsspr"
                                >
                                    {{ name.jnsspr }}
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="flex items-center justify-between my-4">
                        <div class="flex flex-col items-center">
                            <select
                                name="filterKecamatan"
                                id="filterKecamatan"
                                class="w-48 p-2 text-sm border border-gray-300 rounded-md"
                            >
                                <option value="" selected>
                                    Pilih Kecamatan
                                </option>
                                <option
                                    v-for="(name, index) in nameKecamatan"
                                    :key="index"
                                    :value="name.wadmkc"
                                >
                                    {{ name.wadmkc }}
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="flex gap-1">
                        <button
                            class="px-3 py-1 font-semibold text-white bg-teal-500 border-r-4 border-teal-600 rounded-md hover:bg-teal-600"
                            @click="searchDataPolaRuang"
                        >
                            <VIcon name="ri-search-line" scale=".8" />
                            Search
                        </button>
                        <button
                            class="px-3 py-1 font-semibold text-white bg-red-500 border-r-4 border-red-600 rounded-md hover:bg-red-600"
                            @click="resetDataPolaRuang"
                        >
                            <VIcon name="ri-refresh-line" scale=".8" />
                            Reset
                        </button>
                        <!-- Show on map -->
                        <button
                            v-show="isSearch"
                            class="px-3 py-1 font-semibold text-white bg-green-500 border-r-4 border-green-600 rounded-md hover:bg-green-600"
                            @click="showOnMap"
                        >
                            <VIcon name="ri-road-map-line" scale=".8" />
                            Show on Map
                        </button>
                    </div>
                </div>
            </div>
            <table class="min-w-full table-fixed">
                <thead
                    class="text-sm font-semibold tracking-wider text-white uppercase bg-teal-400"
                >
                    <tr>
                        <th class="p-2 rounded-l-lg">No</th>
                        <th class="text-left">Name</th>
                        <th>Jenis</th>
                        <th>Orde 1</th>
                        <th>Orde 2</th>
                        <th>Kecamatan</th>
                        <th class="rounded-r-lg">Luas</th>
                    </tr>
                </thead>
                <tbody>
                    <div
                        v-if="isLoading"
                        class="fixed inset-0 z-50 flex items-center justify-center bg-black bg-opacity-50"
                    >
                        <div
                            class="flex items-center gap-4 p-4 bg-white rounded-lg shadow-lg"
                        >
                            <i
                                class="text-green-500 fas fa-spinner fa-spin fa-2x"
                            ></i>
                            <span class="text-lg font-semibold text-green-500"
                                >Loading...</span
                            >
                        </div>
                    </div>
                    <tr
                        v-for="(pola, index) in polaRuang"
                        :key="pola.gid"
                        :class="`text-sm font-semibold tracking-wide text-gray-900 border-b-2 cursor-pointer bg-gray-50 hover:shadow-md hover:bg-green-100 hover:text-green-800 ${
                            index % 2 === 0 ? 'bg-gray-100' : 'bg-gray-200'
                        }`"
                    >
                        <td class="p-1 m-2 text-center">
                            {{ index + 1 }}
                        </td>
                        <td>
                            {{ pola.namobj }}
                        </td>
                        <td class="text-center">
                            {{ pola.jnsspr }}
                        </td>
                        <td class="text-center break-normal text-pretty">
                            {{ pola.orde1 }}
                        </td>
                        <td class="text-center break-normal text-pretty">
                            {{ pola.orde2 }}
                        </td>
                        <td class="text-center">
                            <span class="capitalize">{{ pola.wadmkc }}</span>
                        </td>
                        <td class="text-center">
                            {{ parseFloat(pola.luas).toFixed(3) }}
                        </td>
                    </tr>
                    <tr v-if="polaRuang.length === 0">
                        <td
                            class="text-sm font-semibold tracking-wider text-center text-gray-900 border-b-2 cursor-pointer bg-gray-50 hover:bg-gray-100 hover:shadow-md"
                            colspan="7"
                        >
                            No data found
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="p-4">
            <Pagination
                :currentPage="pagination.currentPage"
                :totalPages="pagination.lastPage"
                :total="pagination.total"
                :from="pagination.from"
                :to="pagination.to"
                @prevPage="prevPage"
                @nextPage="nextPage"
            />
        </div>
    </div>
</template>

<script>
import Pagination from "./Pagination.vue";
import { addIcons } from "oh-vue-icons";
import {
    OiXCircleFill,
    RiRoadMapLine,
    RiRefreshLine,
    RiSearchLine,
    RiTableLine,
} from "oh-vue-icons/icons";

addIcons(
    OiXCircleFill,
    RiRoadMapLine,
    RiRefreshLine,
    RiSearchLine,
    RiTableLine
);

export default {
    name: "Table",
    components: {
        Pagination,
    },
    data() {
        return {
            polaRuang: [],
            pagination: {
                currentPage: 1,
                perPage: 10,
                total: 0,
                lastPage: 0,
                nextPageUrl: null,
                prevPageUrl: null,
                from: 0,
                to: 0,
            },
            rowNumber: null,
            isLoading: false,
            nameObject: [],
            nameKecamatan: [],
            nameJenis: [],
            isSearch: false,
        };
    },
    mounted() {
        this.getDataPolaRuang();
        this.getNameObj();
        this.getNameKecamatan();
        this.getNameJenis();
    },
    methods: {
        getDataPolaRuang() {
            this.isLoading = true;
            fetch("http://localhost:8000/api/pola-ruang")
                .then((response) => response.json())
                .then((data) => {
                    this.polaRuang = data.data;
                    this.pagination.currentPage = data.current_page;
                    this.pagination.perPage = data.per_page;
                    this.pagination.total = data.total;
                    this.pagination.lastPage = data.last_page;
                    this.pagination.nextPageUrl = data.next_page_url;
                    this.pagination.prevPageUrl = data.prev_page_url;
                    this.pagination.from = data.from;
                    this.pagination.to = data.to;
                    this.isLoading = false;
                });
        },
        prevPage() {
            if (this.pagination.prevPageUrl) {
                this.isLoading = true;
                fetch(this.pagination.prevPageUrl)
                    .then((response) => response.json())
                    .then((data) => {
                        this.polaRuang = data.data;
                        this.pagination.currentPage = data.current_page;
                        this.pagination.perPage = data.per_page;
                        this.pagination.total = data.total;
                        this.pagination.lastPage = data.last_page;
                        this.pagination.nextPageUrl = data.next_page_url;
                        this.pagination.prevPageUrl = data.prev_page_url;
                        this.pagination.from = data.from;
                        this.pagination.to = data.to;
                        this.isLoading = false;
                    });
            }
        },
        nextPage() {
            if (this.pagination.nextPageUrl) {
                this.isLoading = true;
                fetch(this.pagination.nextPageUrl)
                    .then((response) => response.json())
                    .then((data) => {
                        this.polaRuang = data.data;
                        this.pagination.currentPage = data.current_page;
                        this.pagination.perPage = data.per_page;
                        this.pagination.total = data.total;
                        this.pagination.lastPage = data.last_page;
                        this.pagination.nextPageUrl = data.next_page_url;
                        this.pagination.prevPageUrl = data.prev_page_url;
                        this.pagination.from = data.from;
                        this.pagination.to = data.to;
                        this.isLoading = false;
                    });
            }
        },
        getNameObj() {
            fetch("http://localhost:8000/api/pola-ruang/name-obj")
                .then((response) => response.json())
                .then((data) => {
                    this.nameObject = data;
                });
        },
        getNameKecamatan() {
            fetch("http://localhost:8000/api/pola-ruang/kecamatan")
                .then((response) => response.json())
                .then((data) => {
                    this.nameKecamatan = data;
                });
        },
        getNameJenis() {
            fetch("http://localhost:8000/api/pola-ruang/jenis-sarana")
                .then((response) => response.json())
                .then((data) => {
                    this.nameJenis = data;
                });
        },
        searchDataPolaRuang() {
            this.isSearch = true;
            const filter = {
                nameObj: document.getElementById("filterNameObj").value,
                jenisSarana: document.getElementById("filterJenisSarana").value,
                kecamatan: document.getElementById("filterKecamatan").value,
            };

            this.isLoading = true;
            fetch("http://localhost:8000/api/pola-ruang/search", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(filter),
            })
                .then((response) => response.json())
                .then((data) => {
                    this.polaRuang = data.data;
                    this.pagination.currentPage = data.current_page;
                    this.pagination.perPage = data.per_page;
                    this.pagination.total = data.total;
                    this.pagination.lastPage = data.last_page;
                    this.pagination.nextPageUrl = data.next_page_url;
                    this.pagination.prevPageUrl = data.prev_page_url;
                    this.pagination.from = data.from;
                    this.pagination.to = data.to;
                    this.isLoading = false;
                });
        },
        resetDataPolaRuang() {
            this.getDataPolaRuang();
            const filter = {
                nameObj: (document.getElementById("filterNameObj").value = ""),
                jenisSarana: (document.getElementById(
                    "filterJenisSarana"
                ).value = ""),
                kecamatan: (document.getElementById("filterKecamatan").value =
                    ""),
            };

            this.$emit("resetDataPolaRuang");
        },
        toggleTableSelector() {
            this.$emit("toggleTableSelector");
        },
        showOnMap() {
            const filter = {
                nameObj: document.getElementById("filterNameObj").value,
                jenisSarana: document.getElementById("filterJenisSarana").value,
                kecamatan: document.getElementById("filterKecamatan").value,
            };

            this.$emit("showOnMap", filter);
        },
    },
};
</script>

<style></style>
