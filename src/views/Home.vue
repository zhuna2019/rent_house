<template>
  <div class="home">
    <!-- 搜索框 -->
     <mt-search v-model="value" id="search"></mt-search>
    <!-- 轮播图 -->
     <carousel></carousel>
  
  </div>
</template>

<script>

import Carousel from '../components/Carousel'
export default {
  data(){
    return{
      value:""
    }
  },
  components:{
   Carousel,
    
  }
}
</script>
<style scoped>
.home{
  position: relative;
}
#search{
  width:380px;
 position:absolute;
  top:0px;
  left:0px; 
}
carousel{
  position:absolute;
  top:80px;

}
</style>

