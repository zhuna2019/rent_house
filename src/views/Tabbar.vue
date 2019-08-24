<template>
    <div>
       <!--面板-->
     <!--父元素-->
     <mt-tab-container v-model="active">
       <!--子面板1 -->
       <mt-tab-container-item id="home">
        <apphome></apphome>
       </mt-tab-container-item>
       <!--子面板2-->
       <mt-tab-container-item id="cole">    
        <appcole></appcole>
       </mt-tab-container-item>
       <!--子面板3-->
       <mt-tab-container-item id="log">
        <applog> </applog>
       </mt-tab-container-item>
       <!--子面板3-->
       <mt-tab-container-item id="prof">
        个人中心
       </mt-tab-container-item>
     </mt-tab-container>
     <!-- 底部导航条父元素 -->
      <mt-tabbar v-model="active" fixed class="mtabbar">
            <mt-tab-item id="home" >
                <img src="../assets/home.png"  alt="">
            </mt-tab-item>
            <mt-tab-item id="cole">
                <img src="../assets/collection.png" alt="">
            </mt-tab-item>
            <mt-tab-item id="log">
                <img src="../assets/login.png" alt="">
            </mt-tab-item>
            <mt-tab-item id="prof">
                <img src="../assets/profile.png" alt="">
            </mt-tab-item>
      </mt-tabbar>
    </div>
</template>
<script>
import login from './Login.vue';
import home from './Details.vue';
import cole from './Collection.vue'
export default {
    data(){
        return{
            active:"home"
        }
    },
    components:{
        "applog":login,
        "apphome":home,
        "appcole":cole
    }
}
</script>
<style scoped>
    .mint-tabbar.is-fixed {
        line-height:40px;
    }
</style>