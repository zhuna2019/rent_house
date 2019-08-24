import Vue from 'vue'
import Router from 'vue-router'
import TableBar from './views/TableBar.vue'
import Home from './views/Home.vue'
import Products from './views/Products.vue'
import Houseinfo from './views/Houseinfo.vue'
import Mine from './views/Mine.vue'



Vue.use(Router)

export default new Router({
  routes: [
    {path: '/',name: 'tablebar',component:TableBar},
    {path: '/home',name: 'home',component:Home},
    {path: '/products',name:'products',component:Products,props:true},
    {path: '/Houseinfo',name:'products',component:Houseinfo,props:true},
    {path: '/Mine',name:'products',component:Mine},
    {
      path: '/Collection',
      name: 'Collection',
      // route level code-splitting
      // this generates a separate chunk (about.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import(/* webpackChunkName: "about" */ './views/Collection.vue')
    },
    {
      path: '/Details',
      name: 'Details',
      component: () => import(/* webpackChunkName: "about" */ './views/Details.vue') 
    },
    {
      path: '/Login',
      name: 'Login',
      component: () => import(/* webpackChunkName: "about" */ './views/Login.vue') 
    },
    
    {
      path: '/Swiper',
      name: 'Swiper',
      component: () => import(/* webpackChunkName: "about" */ './views/Swiper.vue') 
    },

  ]
})
