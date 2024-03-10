<template>
    <div>
        <Header />
        <main>
            <router-view></router-view>
        </main>
    </div>
</template>

<script>
import Footer from "./shared/Footer.vue";
import Header from "./shared/Header.vue";
import Sidebar from "./shared/Sidebar.vue";
export default {
    components: {
        Footer,
        Header,
        Sidebar,
    },
};
</script>

<style></style>
