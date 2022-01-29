import Vue from 'vue'
import Router from 'vue-router'
// import { createRouter, createWebHistory } from 'vue-router'
import AddTitle from '../views/AddTitle.vue'
import EditTitle from '../views/EditTitle.vue'
import Home from '../views/Home.vue'


// Vue.use(VueRouter)

const routes = [
    {
        path: '',
        name: 'home',
        component: Home
    },
    {
        path: '/add',
        name: 'add',
        component: AddTitle

    },    
    {
        path: '/edit',
        name: 'edit',
        component: EditTitle
    },
]

const router = new Router({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
});

export default router;