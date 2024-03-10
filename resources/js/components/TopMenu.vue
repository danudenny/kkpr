<template>
    <div>
        <ul class="hidden gap-4 cursor-pointer sm:flex">
            <li
                v-for="item in menu"
                :key="item.id"
                :class="[
                    'px-4 py-2 text-lg font-bold transition duration-200 ease-in-out border-b-4 border-transparent rounded-md ',
                    'text-neutral-900 hover:text-neutral-500 hover:bg-green-500 hover:bg-opacity-10 hover:border-green-500 ',
                    {
                        'bg-green-500 bg-opacity-10 border-b-4 border-green-700':
                            $route.path === item.url,
                    },
                ]"
            >
                <router-link :to="item.url">{{ item.title }}</router-link>
            </li>
        </ul>
    </div>
</template>

<script>
import menuItems from "../menu";

export default {
    name: "TopMenu",
    data() {
        return {
            menu: [],
        };
    },
    mounted() {
        this.menu = menuItems;
    },
};
</script>

<style></style>
