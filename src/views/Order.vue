<template>
  <div>
       <mt-header title="米兔·民宿" id="header">
            <router-link to="/" slot="left">
                <mt-button icon="back"></mt-button>
            </router-link>
            <mt-button icon="more" slot="right"></mt-button>
       </mt-header>
       <div class="title">【一屋·恋樱】翠湖旁/150寸家庭影院</div>
       <div class="top_img">
           <img src="http://127.0.0.1:3000/07.jpg" alt="">
           <div class="orderBar">
           <!-- 到店日期 -->
                <div class="check_in">
                        <div>08月26日</div>
                        <div>周一14:00</div>
                </div>
                <div><img src="http://127.0.0.1:3000/right.png" alt=""></div>
                <!-- 离店日期 -->
                <div class="leave">
                    <div>08月27日</div>
                    <div>周一12:00</div>
                </div>
                <!-- 支付金额 -->
                <div class="pay">
                    <div>支付总价</div>
                    <div class="price">￥439.00</div>
                </div>
           </div>
       </div>
       <div class="all">查看全部订单</div>
       
  </div>
</template>
<style scoped>
#header{
    background:#fff;
    color:#000;
    font-size:18px;
    }
.title{
    padding:1rem;
}
.top_img{
 position:relative;
 
}
.top_img img{
    width:100%;
     padding:1rem;
  
   
}
.orderBar{
    width:90%;
    display:flex;
    justify-content: space-around;
    background:rgba(20, 20, 20, 0.5);
    position: absolute;
    top:16rem;
    left:0;
    color:#fff;
    align-items: center;
    padding:1rem;
     margin-left:1rem;
}
.orderBar img{padding:0 }
.price{
    color:rgb(230, 142, 12);
    font-size:16px;
    font-weight: bolder;
   
} 
.all{
    color:rgb(8, 129, 89);
    font-size:14px;
    text-align: center;
}
</style>
<script>
export default {
    
}
</script>


