<template>
    <nav
        class="flex items-center justify-between w-full p-4 bg-teal-400 rounded-lg shadow-md"
        aria-label="Pagination"
    >
        <div class="flex justify-between flex-1 sm:hidden">
            <button
                @click="prevPage"
                :disabled="currentPage < 2"
                class="relative inline-flex items-center px-4 py-2 text-sm font-semibold text-gray-700 bg-white border border-gray-300 rounded-md"
            >
                Previous
            </button>
            <button
                @click="nextPage"
                :disabled="currentPage >= totalPages"
                class="relative inline-flex items-center px-4 py-2 text-sm font-semibold text-gray-700 bg-white border border-gray-300 rounded-md"
            >
                Next
            </button>
        </div>
        <div
            class="hidden sm:flex-1 sm:flex sm:items-center sm:justify-between"
        >
            <div>
                <p class="text-sm text-white">
                    Showing
                    <span class="font-semibold">{{ from }}</span>
                    to
                    <span class="font-semibold">{{ to }}</span>
                    of
                    <span class="font-semibold">{{ total }}</span>
                    results
                </p>
            </div>
            <div>
                <nav
                    class="relative z-0 inline-flex -space-x-px rounded-md shadow-sm"
                    aria-label="Pagination"
                >
                    <button
                        @click="prevPage"
                        :disabled="currentPage < 2"
                        class="relative inline-flex items-center px-2 py-2 text-sm font-semibold text-gray-500 bg-white border border-gray-300 rounded-l-md hover:bg-gray-50"
                    >
                        <span>Previous</span>
                    </button>
                    <button
                        @click="nextPage"
                        :disabled="currentPage >= totalPages"
                        class="relative inline-flex items-center px-2 py-2 text-sm font-semibold text-gray-500 bg-white border border-gray-300 rounded-r-md hover:bg-gray-50"
                    >
                        <span>Next</span>
                    </button>
                </nav>
            </div>
        </div>
    </nav>
</template>

<script>
export default {
    name: "Pagination",
    props: {
        total: {
            type: Number,
            required: true,
        },
        currentPage: {
            type: Number,
            required: true,
        },
        totalPages: {
            type: Number,
            required: true,
        },
        from: {
            type: Number,
            required: true,
        },
        to: {
            type: Number,
            required: true,
        },
    },
    methods: {
        prevPage() {
            if (this.currentPage > 1) {
                this.$emit("prevPage", this.currentPage - 1);
            }
        },
        nextPage() {
            if (this.currentPage < this.totalPages) {
                this.$emit("nextPage", this.currentPage + 1);
            }
        },
    },
};
</script>

<style></style>
