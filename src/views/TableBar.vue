<template>
    <div>
       <!-- 面板 -->
        <!--父元素-->
        <mt-tab-container v-model="active">
          <!--子面板1 -->
          <mt-tab-container-item id="home">
           <apphome></apphome>

          </mt-tab-container-item>
          <!--子面板2-->
          <!-- <mt-tab-container-item id="love">    
              <appcollection></appcollection>
          </mt-tab-container-item> -->
          <!--子面板3-->
          <mt-tab-container-item id="order">
            <appOrder></appOrder>
          </mt-tab-container-item>
          <!--子面板4-->
          <mt-tab-container-item id="mine">
            <appmine></appmine>
          </mt-tab-container-item>
        </mt-tab-container>

       <!-- 底部导航条父元素 -->
       <mt-tabbar v-model="active" fixed>
         <!--第一个首页按钮 -->
         <mt-tab-item id="home" @click.native="changeState(0)">
           <!-- 图片 -->
           <imagbar :selectedImage="require('../assets/02.png')" :normalImage="require('../assets/2.png')" :focused="currentIndex[0].is_select"></imagbar>  
             首页
         </mt-tab-item>
        
      <!--第二个收藏按钮 -->
        
        <!-- <mt-tab-item id="love" @click.native="changeState(1)">
           <imagbar :selectedImage="require('../assets/01.png')" :normalImage="require('../assets/1.png')" :focused="currentIndex[1].is_select"></imagbar>  
            收藏
        </mt-tab-item> -->
        <!--第三个我的按钮 -->
         <mt-tab-item id="order" @click.native="changeState(1)">
           <imagbar :selectedImage="require('../assets/03.png')" :normalImage="require('../assets/3.png')" :focused="currentIndex[1].is_select"></imagbar>  
             订单
        </mt-tab-item>
        <!--第四个我的按钮 -->
         <mt-tab-item id="mine" @click.native="changeState(2)">
           <imagbar :selectedImage="require('../assets/05.png')" :normalImage="require('../assets/5.png')" :focused="currentIndex[2].is_select"></imagbar>  
             我的
        </mt-tab-item>

      </mt-tabbar>
    </div>
</template>
<script>
// 2将图片子件引入当前父元素中


import ImagBar from "../components/ImagBar";
export default {
   data(){
        return{
           active:"home",
           currentIndex:[
               {is_select:true},
               {is_select:false},
               {is_select:false},
              //  {is_select:false},
           ]
        }
    },
   methods:{
      
       changeState(idx){
           
           for(var i=0;i<this.currentIndex.length;i++){
               if(i===idx){
                     this.currentIndex[i].is_select=true;
               }else {this.currentIndex[i].is_select=false;}
           }
        
       }
    },
    // 3注册
    components:{   
         "imagbar":ImagBar,  
    }
}
</script>

<style scoped>
/* 修改按钮默认的样式 */
.mint-tabbar > .mint-tab-item{
    color:#999999;
}
/* 修改按钮选中的样式 */
.mint-tabbar > .mint-tab-item.is-selected{
    background-color:transparent;
    color:#45c018;
}
</style>

