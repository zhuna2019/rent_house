import Vue from 'vue'
import App from './App.vue'
import router from './router'
// 引入第三方组件库 mint ui
// 1:完整引入mint-ui组件库中所有组件
import MintUI from "mint-ui"
// 2:单独引入mint-ui组件库中样式文件
import "mint-ui/lib/style.css"
// 12将实例对象添加到Vue中
// 3:将mint-ui注册Vue实例中
Vue.use(MintUI)
 // 4将字体图标引入当前项目中
//  import "./font/iconfont.css"
//  5引入axios第三方ajax模块
 import axios from 'axios'
//  6配置axios基础路径
 axios.defaults.baseURL="http://127.0.0.1:3000/"
//  7配置axios 保存session信息
 axios.defaults.withCredentials=true
//  8将axios注册vue实例中
//  由于axios不支持use 将实例添加到vue原型
 Vue.prototype.axios=axios;
//9引入Vuex第三方模块
import Vuex from "vuex"
//引入插件
import VueAwesomeSwiper from 'vue-awesome-swiper'
// require styles  引入样式
import 'swiper/dist/css/swiper.css'
//在全局使用该插件
Vue.use(VueAwesomeSwiper, /* { default global options } */)
// 10 注册Vuex
// 先注册再创建实例对象
Vue.use(Vuex)
import Home from './views/Home.vue'
import Mine from './views/Mine.vue'
import Collection from './views/Collection.vue'
import Order from './views/Order.vue'
Vue.component("apphome",Home);
Vue.component("appmine",Mine);
Vue.component("appcollection",Collection);
Vue.component("appOrder",Order);
// 11创建Vuex存储实例对象
var store=new Vuex.Store({
  state:{cartCount:0},
  mutations:{
    increment(state){//购物车数量加一
        state.cartCount++;
    },
    clear(state){
        state.cartCount=0;
    }
  },
  getters:{
    getCartCount(state){
      return state.cartCount
    }
  },
  actions:{
    
  }
})

Vue.config.productionTip = false

new Vue({
  router,
  render: h => h(App),
  store
}).$mount('#app')
