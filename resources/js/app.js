import './bootstrap';
import {createApp} from 'vue'
import PrimeVue from 'primevue/config';
import store from './stores/store';
import App from './App.vue';
import {createRouter, createWebHashHistory} from "vue-router"
import VueAxios from 'vue-axios'
import DataTable from 'primevue/datatable';
import Column from "primevue/column";
import Button from "primevue/button";
import InputText from "primevue/inputtext";

import "primeflex/primeflex.css";
import "primevue/resources/themes/lara-light-blue/theme.css";
// import "primevue/resources/primevue.min.css";
import "primeicons/primeicons.css";
import Toolbar from "primevue/toolbar";
import TabPanel from "primevue/tabpanel";
import TabView from "primevue/tabview";
// import "./index.css";


const routes = [
    {path: '/', name: 'TaskIndex', component: () => import("./components/task/Index.vue")},
    {path: '/:id', name: 'TaskEdit', component: () => import("./components/task/Edit.vue")},
];

const router = createRouter({
    // mode: 'history',
    history: createWebHashHistory(),
    // history: createWebHistory(),
    routes,
});



const app = createApp(App);
app.use(PrimeVue, {ripple: true});
// app.use(VueRouter);
app.use(router);
app.use(store);

app.use(VueAxios, axios)


app.component("DataTable", DataTable);
app.component('Column', Column);
app.component('Toolbar', Toolbar);
app.component('TabPanel', TabPanel);
app.component('TabView', TabView);
app.component('Button', Button);
app.component('InputText', InputText);

app.mount('#app');

export default router;



