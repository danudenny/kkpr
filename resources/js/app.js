import "./bootstrap";

import "tailwindcss/tailwind.css";
import { createApp } from "vue";
import { OhVueIcon } from "oh-vue-icons";

import router from "./routes";

import App from "./App.vue";

const app = createApp(App);
app.use(router);
app.component("VIcon", OhVueIcon);
app.mount("#app");
