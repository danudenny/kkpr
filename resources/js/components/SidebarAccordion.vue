<template>
    <div class="bg-green-400 border-t-4 border-green-600 rounded-lg shadow-lg">
        <div class="p-2 cursor-pointer" @click="toggleAccordion(title_id)">
            <h1
                class="text-sm font-bold tracking-wider text-center text-white uppercase"
            >
                {{ title }}
            </h1>
        </div>
        <div :id="title_id" class="hidden">
            <hr class="border-t-2 border-green-500" />
            <div
                class="p-4 overflow-auto bg-green-200 border-b-4 border-green-500 max-h-80"
            >
                <slot></slot>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "SidebarAccordion",
    props: {
        title: {
            type: String,
            required: true,
        },
        title_id: {
            type: String,
            required: true,
        },
    },
    methods: {
        toggleAccordion(id) {
            const x = document.getElementById(id);
            x.classList.toggle("hidden");

            const otherAccordions = [
                "legend",
                "layers",
                "information",
                "filters",
            ];

            otherAccordions.forEach((accordion) => {
                if (accordion !== id) {
                    const y = document.getElementById(accordion);
                    y.classList.add("hidden");
                }
            });
        },
    },
};
</script>

<style></style>
