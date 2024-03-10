<template>
    <button
        :type="type"
        :class="[
            `bg-${color}-500`,
            `border-b-4 border-${color}-600`,
            `hover:bg-${color}-600 hover:border-${color}-700`,
            'text-white',
            'px-4',
            'py-2',
            'rounded-md',
            'border-r-4',
            'transition duration-200 ease-in-out',
        ]"
        @click="$emit('click')"
    >
        {{ title }}
    </button>
</template>

<script>
export default {
    name: "Button",
    props: {
        type: {
            type: String,
            default: "button",
        },
        color: {
            type: String,
            default: "green",
        },
        title: {
            type: String,
            default: "Button",
        },
    },
    emits: ["click"],
};
</script>
