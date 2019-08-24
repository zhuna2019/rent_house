<template>
 <div >
     <!-- 搜索框 -->
     <div id="search">       
       <mt-search  ></mt-search>
     </div>
     <!-- 民宿列表 -->
    <div class="details" v-for="(item,i) of list" :key="i">
       <div class="pic"><img :src="`http://127.0.0.1:3000/${item.pic}`" ></div>
       <div class="del">
          <div class="title">{{item.title}}</div>
          <div class="subtitle">{{item.subtitle}}</div>
          <div class="spec">{{item.spec}}</div>
          <div class="price">￥{{item.price.toFixed(2)}}</div>
       </div>
    </div>
    <div><button  @click="loadMore">更多房源</button></div>
 </div>
</template>
<script>
export default {
    data(){
        return{
               list:[],
                pno:0,
              }
         },
    methods:{
       loadMore(){
          // 获取url
         var url="index";
          this.pno++;
          var obj={pno:this.pno};
         this.axios.get(url,{params:obj}).then(result=>{
            console.log(result.data.data);
            // 将返回结果保存
            // this.list=result.data.data;
            var rows=this.list.concat(result.data.data);
            this.list=rows;
          })
        },
  },
  created(){
     this.loadMore()
    },
}
</script>
<style scoped>
#search{
    width:100%;
    height:5rem;
}
.details{
  width:100%;
  margin-top:1rem;
}
.del{
  width:100%;
  height:8rem;
  margin:0 40%;
  margin-top:1rem;
}
.pic{
   margin-left:1rem;
   margin-right:1rem;
}
.pic>img{
  width:100%;
  height:100%; 
}
.title{
  font-size:30px;
  margin-bottom:0.5rem;

}
.subtitle,.spec{
  font-size:12px;
  margin-bottom:0.5rem;
}
.price{
  font-size:16px;
   margin-bottom:0.5rem;
  color:#f00;
}
button{
    width:20rem;
    height:3rem;
    margin:5% 20%;
    background:rgb(2, 128, 69);
    color:#fff;


}
</style>
