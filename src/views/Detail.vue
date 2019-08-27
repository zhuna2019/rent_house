<template>
    <div>
        <!-- 头部返回导航 -->
        <div>
          <mt-header title="米兔·民宿" id="header">
            <router-link to="/" slot="left">
                <mt-button icon="back"></mt-button>
            </router-link>
            <mt-button icon="more" slot="right"></mt-button>
          </mt-header>
        </div>
        <div class="top_img"><img  :src="`http://127.0.0.1:3000/${list.img_url}`" ></div>
        <!-- PRO -->
        <div id="detail"  >
            <div>
            <div><h1>优选<span style="color:red">P</span>RO.</h1></div>
            <div class="mainTitle" >{{list.title}}</div>
            <div class="types">
                <div class="house">
                    <div><img src="../assets/house.png" alt=""></div>
                    <div>{{list.rent_mode}}</div>
                    <div>{{list.area}}</div>
                </div>
                <div class="door">
                    <div><img src="../assets/door.png" alt=""></div>
                    <div>{{list.layout}}</div>
                    <div>{{list.remark}}</div>
                </div>
                <div class="bed">
                    <div><img src="../assets/bed.png" alt=""></div>
                    <div>{{list.Suitable}}</div>
                    <div>{{list.bed}}</div>
                </div>
            </div>
        </div>
        <!-- 优惠 -->
        <div class="discount">
            <span class="count">连住优惠</span> <span>满3天9.9折，7天9.2折，30天8.5折</span>
        </div>
        
        <div>
            <!-- 选择入住时间 -->
            <div class="selector selectYear" @click="selectYear">
                <!-- 入住时间 -->
                <div class="show_year">
                    <p v-if="!isClicked">选择入住日期</p>
                    <span>入住时间:</span>
                    <span v-if="isClicked">{{inyear}}年</span>
                    <span v-if="isClicked">{{inmonth}}月</span>
                    <span v-if="isClicked">{{indate}}日</span>
                    <i class="icon"></i>
                </div> 
            </div>
            <!-- 选择离开时间 -->
            <div class="selector selectYear" @click="selectOutYear">
                <!-- 离开时间 -->
                <div class="show_year">
                    <p v-if="!isClicked">选择离开日期</p>
                    <span>离开时间:</span>
                    <span v-if="isClicked">{{outyear}}年</span>
                    <span v-if="isClicked">{{outmonth}}月</span>
                    <span v-if="isClicked">{{outdate}}日</span>
                    <i class="icon"></i>
                </div> 
            </div>
            
            <div> 
                <mt-datetime-picker 
                v-model="dateValue" 
                type="date" 
                ref="datePicker" 
                year-format="{value} 年" 
                month-format="{value} 月" 
                date-format="{value} 日" 
                :startDate="new Date()" 
                @confirm="handleConfirm">
                </mt-datetime-picker>
            </div>
            <div> 
                <mt-datetime-picker 
                v-model="outdateValue" 
                type="date" 
                ref="date2Picker" 
                year-format="{value} 年" 
                month-format="{value} 月" 
                date-format="{value} 日" 
                :startDate="new Date()" 
                @confirm="handle2Confirm">
                </mt-datetime-picker>
            </div>
        </div>
        <!-- 房东 -->
        <div class="houser">
            <!-- 房东头像 -->
            <div class="avatar">
                <img :src="`http://127.0.0.1:3000/${list.avatar}`" alt="">
            </div>
            <div class="tail">
                <div class="uname" >{{list.uname}}</div>
                <div class="type">{{list.type}}</div>
            </div>
        </div>
       </div>
        <!-- 预定须知-->
        <div class="preOrder">
            <div><h1>预定须知</h1></div>
            <div class="tip">
                <h2>闪订</h2>
                <h4>预订无需等待，订单闪电确认</h4>
            </div>
            <div class="tip">
                <h2>无需押金</h2>
                <h4>免押入住，订房更轻松</h4>
            </div>
            <div class="tip">
                <h2>清洁费</h2>
                <h4>需与房东线下确认</h4>
            </div>
            <div class="tip">
                <h2>提供发票</h2>
                <h4>米兔开局发票，点击进入发票说明页</h4>
            </div>
             <div class="tip">
                <h2>退订规则</h2>
                <h4>入住前一天的12点后取消，将产生扣款(由房东定制)</h4>
            </div>
           
        </div>
       <!-- 下订单 -->
       <div class="btn">
           <div>￥{{list.price}}</div>
           <div @click="order" :data-title="list.title"  :data-img="list.img_url" :data-price="list.price">立即预定</div>
       </div>
    </div>
</template>
<style scoped>
#header{
    background:#eee;
    color:#000;
    font-size:18px;
    
}
h1{
    font-size:20px;
    padding:1rem;
}
.mainTitle{
   font-size:20px;
   padding:1rem;
}
.types{
    background:rgba(250,250,250,.8);
    display:flex;
    justify-content:space-around;
    padding:2rem;
}
.door,.bed,.house{
    display: flex;
    flex-direction: column;
    align-items: center;
}
.discount{
    padding:2rem;
}
.count{
    border:1px solid red;
    margin-right:1rem;
    color:red;
    padding:0.2rem;
}
.houser{
    display:flex;
    padding:2rem;
}
.avatar img{
    width:4rem;
    height:4rem;
    border:1px solid #000;
    border-radius: 50%;
    margin-right:1rem;
}

.uname{
    font-size:16px;
    margin:1rem 0;
    color:#000;
}
.tip{
    padding:0.8rem;
    margin-bottom:1rem;
}
h2{
    margin-bottom:0.5rem;
}
h4{
    color:#aaa;
}
.btn{
   
    display:flex;
    justify-content:space-between;
    font-size:20px;
    color:#fff;
    padding:1.5rem;
    background:rgb(5, 124, 55);
}
#day{
    padding:0.1rem;
    background:rgb(5, 124, 55);
    color:#fff;
    font-size:14px;
    font-weight: bolder;
}
.show_yea{
    display:flex;
}
</style>
<script>
// 引入qs模块 初始化post 要传递的参数兑现
import qs from 'qs';
export default {
    data(){
        return{
          list:{},
          inyear:"",
          inmonth:"",
          indate:"",
          dateValue:"",
          outyear:"",
          outmonth:"",
          outdate:"",
          outdateValue:"",
          isClicked:false
        }
    },
    props:["did"],
    methods:{
        // 选择入住时间
            selectYear () {
                this.$refs.datePicker.open();
            },
            handleConfirm (value) {
                console.log(value);
                this.inyear = value.getFullYear();
                this.inmonth = value.getMonth() + 1;
                this.indate = value.getDate();
                this.isClicked = true;
                },
            // 选择离开时间
            selectOutYear () {
            this.$refs.date2Picker.open();
            },
            handle2Confirm (value) {
            console.log(value);
            this.outyear = value.getFullYear();
            this.outmonth = value.getMonth() + 1;
            this.outdate = value.getDate();
            this.isClicked = true;
            },
         load(){
            if(this.did){
                this.axios.get("query",{params:{did:this.did}}).then(result=>{
                     console.log(result.data.data[0])
                    this.list=result.data.data[0];
                })
            }
        },
        order(e){
            var order_id=Math.floor(Math.random()*9999999999);
            var inyear=this.inyear;
            var inmonth=this.inmonth;
            var indate=this.indate;
            var outyear=this.outyear;
            var outmonth=this.outmonth;
            var outdate=this.outdate;
            var title=e.target.dataset.title;
            var img_url=e.target.dataset.img;
            var price=e.target.dataset.price;
            var obj={order_id,title,img_url,price,inyear,inmonth,indate,outyear,outmonth,outdate}
            var url="order"
            this.axios.post(url,qs.stringify(obj)).then(res=>{
                // console.log(res)
                if(res.data.code===-1){
                    this.$toast("请先登录")
                   this.$router.push("/Login");
                }
                if(res.data.code===1){
                   this.$toast("已成功订入");
                }
            })
        },
    },
    created(){
        this.load();
    }
}
</script>


