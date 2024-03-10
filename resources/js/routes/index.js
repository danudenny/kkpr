import DefaultLayout from "../layouts/DefaultLayout.vue";
import { createRouter, createWebHistory } from "vue-router";

const router = createRouter({
    history: createWebHistory(),
    routes: [
        {
            path: "/",
            name: "home",
            component: () => import("../views/Home.vue"),
            meta: {
                layout: DefaultLayout,
            },
        },
        {
            path: "/about",
            name: "about",
            component: () => import("../views/About.vue"),
            meta: {
                layout: DefaultLayout,
            },
        },
        {
            path: "/contact",
            name: "contact",
            component: () => import("../views/Contact.vue"),
            meta: {
                layout: DefaultLayout,
            },
        },
    ],
});

export default router;
