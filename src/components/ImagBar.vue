<template>
    <div>
        <img :src="focused?normalImage:selectedImage" class="imgstyle">
    </div>
</template>
<script>
export default {
    // 声明接收父元素数据的变量
    data(){
        return{}
    },
    props:{
        focused:false,
        selectedImage:{default:""},
        normalImage:{default:""},
    }
}
</script>
<style scoped>
.imgstyle{
    width:30px;
    height:30px;
}
</style>

