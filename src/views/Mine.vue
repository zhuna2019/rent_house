<template>
<div>
    <div class="top">
        <img src="../assets/swiper1.png" alt="">
       <div><img class="girl" src="../assets/girl.png" alt=""></div>
       <div @click="load" class="uname"><span>欢迎</span> {{uname}}</div>
    </div>
    <div class="middle">
        <div class="nav">
            <img src="../assets/chiper.png" alt="">
            <div>优惠券</div>
        </div>
        <div class="nav">
           <router-link to="/Collection"> <img src="../assets/hide.png" alt=""></router-link>
            <div>收藏</div>
        </div>
        <div class="nav">
             <img src="../assets/time.png" alt="">
            <div>浏览过</div>
        </div>
        <div class="nav">
            <router-link to="/Order"><img src="../assets/mesg.png" alt=""></router-link>
            <div>订单</div>
        </div>
        <div class="nav">
            <img src="../assets/server.png" alt="">
            <div>客服</div>
        </div>
        <div class="nav">
            <img src="../assets/money.png" alt="">
            <div>开发票</div>
        </div>
    </div>
    <div class="middle2">
      <div class="item">
          <span>推荐米兔给朋友</span>
          <img src="../assets/right.png" alt="">
      </div>
      <div class="item">
          <span>意见反馈</span>
          <img src="../assets/right.png" alt="">
      </div>
      <div class="item">
          <span>关于米兔短租</span>
          <img src="../assets/right.png" alt="">
      </div>
    </div>
    
     
</div>
   
    
</template>

<style scoped>

.top{
    width:100%;
    position: relative;
}
.top>img{
    width:100%;
    height:13rem;
    border-bottom-left-radius: 30%;
    border-bottom-right-radius: 30%;
}
.girl{
    border:1px solid #333;
    border-radius: 50%;
    position:absolute;
    background:rgb(5, 5, 5);
    top:20%;
    left:40%;
    
}
.uname{
    width:20rem;
    height:3rem;
    position: absolute;
    color:rgb(19, 1, 15);
    top:60%;
    left:25%;
    font-size:26px;
}
.top span{
    color:rgb(233, 7, 158);
}
.middle{
    width:80%;
    height:15rem;
    display: flex;
    justify-content: space-between;
     border:1px solid #eee;
     box-shadow: 0 0 0 3px rgba(230, 235, 231, 0.4);
     border-radius: 5%;
     
     margin:1rem auto;
     padding:1.5rem;
      flex-wrap: wrap;
}
.nav{
    width:13%;
    height:12%;
    display:flex;
    flex-direction: column;
    margin-left:3rem;
    margin-right:2rem;
    margin-top:1rem;
}

.nav img{
    width:100%;
    margin-bottom:1rem;
    
}
.middle2{
    width:80%;
    height:10rem;
    display: flex;
    flex-direction: column;
     border:1px solid #eee;
     box-shadow: 0 0 0 3px rgba(230, 235, 231, 0.4);
     border-radius: 5%;
     margin:1rem auto;
     padding:1.5rem;
      flex-wrap: wrap;
      justify-content: space-between;
}
.item{
  display:flex;
  justify-content:space-between;
  font-size:14px;
}

</style>
<script>
export default {
    data(){
        return{
           uname:"",
        }
    
    },
    methods:{
        load(){
            var url="select"
           this.axios.get(url).then(res=>{
               console.log(res)
               if(res.code==-1){
                 this.$router.push("/login");
               }else{
                   this.uname=res.data.data;
               }
           })
        }
    },
    mounted() {
        this.load()
    }
}
</script>


