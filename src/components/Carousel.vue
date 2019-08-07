<template>
  <mt-swipe :auto="4000" :show-indicators="false" :prevent="true" :continuous="true" id="carousel">
      <mt-swipe-item><img src="../assets/banner1.jpg" ></mt-swipe-item>
      <mt-swipe-item><img src="../assets/banner2.jpg" ></mt-swipe-item>
      <mt-swipe-item><img src="../assets/banner.jpg" ></mt-swipe-item> 
  </mt-swipe> 
</template>
<style scoped>
   #carousel{
       width:400px;
       height:150px;
      
   }
#carousel img{
    width:400px;
       height:150px;
}
  
</style>

