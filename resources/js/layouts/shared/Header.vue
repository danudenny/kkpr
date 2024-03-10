<template>
    <header
        class="fixed top-0 right-0 z-30 w-full p-3 bg-white shadow-md sm:w-4/5"
    >
        <nav>
            <div class="flex items-center justify-end gap-4">
                <TopMenu />
                <div class="flex gap-3">
                    <button
                        class="px-4 py-2 text-white transition duration-200 ease-in-out bg-green-500 border-b-4 border-r-4 border-green-600 rounded-md hover:bg-green-600 hover:border-green-700"
                        @click="login"
                    >
                        Login
                    </button>
                </div>
            </div>
        </nav>
    </header>
</template>

<script>
import { defineComponent } from "vue";
import TopMenu from "../../components/TopMenu.vue";

export default defineComponent({
    name: "Header",
    components: {
        TopMenu,
    },
    data() {
        return {
            color: "green",
            title: "Login",
        };
    },
    methods: {
        login() {
            alert("Login");
        },
    },
});
</script>
