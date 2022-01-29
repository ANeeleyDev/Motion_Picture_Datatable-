import Vue from 'vue'
import App from './App.vue'
import router from './router/index'
import VueRouter from 'vue-router'
import axios from 'axios'
// import 'bootstrap/dist/js/bootstrap.min.js'
import { BootstrapVue } from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'



Vue.config.productionTip = false
Vue.use(VueRouter),
Vue.use(BootstrapVue);

axios.defaults.baseURL = process.env.VUE_APP_REMOTE_API;

new Vue({         
    router,
    BootstrapVue,  
    render: h => h(App)
  }).$mount('#app')