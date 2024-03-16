import "./bootstrap";

import "tailwindcss/tailwind.css";
import { createApp } from "vue";
import { OhVueIcon } from "oh-vue-icons";

import "@fontsource/ibm-plex-sans/100.css";
import "@fontsource/ibm-plex-sans/200.css";
import "@fontsource/ibm-plex-sans/300.css";
import "@fontsource/ibm-plex-sans/400.css";
import "@fontsource/ibm-plex-sans/500.css";
import "@fontsource/ibm-plex-sans/600.css";
import "@fontsource/ibm-plex-sans/700.css";

import "@fontsource/paytone-one";

import router from "./routes";

import App from "./App.vue";

const app = createApp(App);
app.use(router);
app.component("VIcon", OhVueIcon);
app.mount("#app");
