<template>
  <fragment> 
      
  <router-view />
  </fragment>
</template>

<script>
import Vue from "vue";
import Home from "./views/Home.vue";
import Fragment from "vue-fragment";



Vue.use(Fragment.Plugin);

export default {
  name: "app",
  components: {
    Home,
  },
 
};
</script>

<style>


</style>
