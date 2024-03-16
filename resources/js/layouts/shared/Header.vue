<template>
    <header
        class="fixed top-0 right-0 z-30 w-full p-3 bg-white shadow-md sm:w-4/5"
    >
        <nav>
            <div class="flex items-center justify-between gap-4">
                <!-- <TopMenu /> -->
                <div class="block sm:hidden">
                    <VIcon
                        name="gi-hamburger-menu"
                        scale="2"
                        @click="showLeftSidebar"
                    />
                </div>
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
import { addIcons } from "oh-vue-icons";
import { GiHamburgerMenu } from "oh-vue-icons/icons";
import TopMenu from "../../components/TopMenu.vue";

addIcons(GiHamburgerMenu);

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
        showLeftSidebar() {
            this.$store.commit("showLeftSidebar");
        },
    },
});
</script>
