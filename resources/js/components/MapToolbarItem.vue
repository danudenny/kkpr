<template>
    <button
        class="w-10 h-10 p-2 text-white rounded-md hover:bg-slate-200"
        :class="{
            'bg-slate-300': isActive,
            'translate-x-0': !isActive,
        }"
        @click="toggleActive"
    >
        <VIcon :name="iconName" :scale="scale || 1" fill="green" />
    </button>
</template>

<script>
export default {
    props: {
        iconName: String,
        isActive: Boolean,
        scale: Number,
    },
    methods: {
        toggleActive() {
            this.$emit("toggle");
        },
    },
};
</script>
