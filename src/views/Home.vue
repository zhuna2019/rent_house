<template>

  <div class="home container">
    <!-- 搜索框 -->
     <mt-search id="search" ></mt-search>
   <!-- 分类 -->
     <div class="seprate">
       <div>
         <div class="iconfont icon-shouye"></div>
         <div>整租</div>  
       </div>
       <div>
         <div class="iconfont icon-men"></div>
         <div>合组</div>  
       </div>
       <div>
         <div class="iconfont icon-rili"></div>
         <div>月租</div>  
       </div>
       <div>
         <div class="iconfont icon-dalou1"></div>
         <div>独栋公寓</div>  
       </div>
       <div>
         <div class="iconfont icon-chakantiezidingwei"></div>
         <div>地图找房</div>  
       </div>
       <div>
         <div class="iconfont icon-zhifeiji"></div>
         <div>去出租</div>  
       </div>
       <div>
         <div class="iconfont icon-wendang"></div>
         <div>查成交</div>  
       </div>
       <div>
         <div class="iconfont icon-banjiapeisong"></div>
         <div>搬家</div>  
       </div>
       <div>
         <div class="iconfont icon-erji"></div>
         <div>联系我们</div>  
       </div>
     </div>
   <!-- 轮播图 -->
     <carousel id="carousel"></carousel>
   <!-- 全部房源 -->
   <div class="house">
     <h2>为您推荐</h2>
     <h3>特价好房，先到先得！</h3>
     <div class="details" v-for="(item,i) of list" :key="i">
       <div class="pic"><img :src="`http://127.0.0.1:3000/${item.pic}`" alt=""></div>
       <div class="del">
          <div class="title">{{item.title}}</div>
          <div class="subtitle">{{item.subtitle}}</div>
          <div class="spec">{{item.spec}}</div>
          <div class="price">￥{{item.price.toFixed(2)}}</div>
       </div>
     </div>
   </div>
   <div><router-link to='Details'><button>更多优惠房源</button></router-link></div>
  </div>

</template>

<script>

import Carousel from '../components/Carousel'

export default {
  data(){
    return{
      list:[],
      pno:0,
    }
  },
  methods:{
   
    download(){
      // 获取请求url
      var url="index";
      this.pno++;
          var obj={pno:this.pno};
         this.axios.get(url,{params:obj}).then(result=>{
            // console.log(result.data.data);
            // 将返回结果保存
             this.list=result.data.data;
          })
        },
  },
  created(){
    this.download();
  },
 
  components:{
   Carousel, 
  }
}
</script>
<style scoped>
.home{
  position: relative;

  height:100rem;
}
#search{
 width:31rem;
 position: absolute;
  top:0rem;
  left:0rem; 
}
#carousel{
  position:absolute;
  top:26rem;

}
.seprate{
  width:100%;
  display:flex;
  flex-wrap: wrap;
  position:absolute;
  top:6rem;
}
.seprate>div{
  
  width:4rem;
  height:4rem;
  margin-left:35px;
  margin-bottom:3rem;
  font-size:1rem;
}
.iconfont{
  margin-bottom:1rem;

}
.house{
  position:absolute;
  top:40rem;
  margin-bottom:10rem;
}
h2{
  font:26px SimHei;
  font-weight:bolder;
  margin-left:1rem;
 
}
h3{
  font:16px;
  margin-top:1rem;
  margin-bottom:1rem;
  margin-left:1rem;
}
.details{
  width:100%;
  margin-top:2rem;
  display:flex; 
 margin-left:1.5rem;
 margin-top:1rem;
}
.del{
  margin-left:1rem;
  margin-top:1rem;
}
.pic>img{
  width:18rem;
  height:10rem;
}
.title{
  font-size:20px;
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
    font-size:20px;
    border-radius: 5%;
  position:absolute;
  top:90rem;
  margin-bottom:8rem;
}
</style>

