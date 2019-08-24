<template>
    <div>
       <mt-swipe :auto="4000" class="swiperHome">
            <mt-swipe-item><img src="../assets/swiper1.png"> </mt-swipe-item>
            <mt-swipe-item><img src="../assets/swiper2.png"></mt-swipe-item>
            <mt-swipe-item><img src="../assets/swiper3.png"></mt-swipe-item>
       </mt-swipe>
    </div>
</template>
<script>

export default {
    data(){
        return{}
    }
}
</script>
<style scoped>
    .swiperHome{
        height:150px;
        margin-bottom:4px;
    }
</style>