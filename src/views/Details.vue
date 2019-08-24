<template>
    <div class="app-details">
        <myswiper />
        <mt-popup
            v-model="popupVisible"
            popup-transition="popup-fade"
             class="popup1" closeOnClickModal="true">
            已收藏，请勿重复操作
        </mt-popup>
        <!-- 做三个组件，查询功能暂时单一一点 -->
        <div class="app-select">
           
            <select v-model="conditions" >
                <option value="all">全部房源</option>
                <option v-for="(item,i) of list1" :key="i" :value='`${item.house_area}`'>{{item.house_area}}</option>
            </select> 
        
        </div>
        <div class="houses-item" v-for="(item,i) in list" :key="(i)">
            <img :src="`http://127.0.0.1:3000/${item.pic}`"  @click="jump" alt="">
            <div class="house-spec">
                <h4 v-text="item.housename"></h4>
                <span v-text="item.house_area"></span>
                <p v-text="item.spec"></p> 
                <p v-text="item.promise"></p>
                <div class="app-price">
                   <p class="price" v-text="`${item.price.toFixed(2)}`"></p>
                   <p>元/月</p>
                   <!-- @click="collection" -->
                   <mt-button style="margin-left:4px" @click="addCollect" :data-hid="item.hid"
                   :data-housename="item.housename" 
                   :data-price="item.price" :data-pic="item.pic">收藏<img class="myimg" src="http://127.0.0.1:3000/selected.png" alt=""> </mt-button>   
                </div>
            </div>  
        </div>
        <!-- 加载更多按钮 -->
        <mt-button type="primary" size="large" @click="loadMore()">加载更多</mt-button>
        <mt-button @click="jumpCart">查看已收藏房源</mt-button>
    </div>

</template>
<script>
import swiper from './Swiper.vue';
export default {
    data(){
        return{
            list:[],//商品列表数组
            list1:[],
            pno:0,
            pageSize:4,
            isSelected:false,
            qCon:false,
            conditions:"all",
            popupVisible:false
        }
    },
    // 注册AreaQuery组件， RentalQuery组件
    components:{
        "myswiper":swiper
    },
    watch:{
        // 监控条件查询的变化，有变化就调用条件查询的函数
        conditions(){
            // 条件查询之前先将前面查询出来的数组清空，防止数据重复加载
            
            if(this.conditions=="all"){
                this.pno=0; //初始化this.pno
                this.pageSize=100;    
                this.loadMore();
            }else{

                this.loadWhich();
            }
            console.log(this.conditions)
        }
    },
    methods: {
        jump(){
            this.$router.push("/Houseinfo")
        },
        // 条件查询方法
        // queryByTask(e){
        //     let tar=e.target;
        //     this.conditions=tar.dataset.cdn;
        //     this.qCon=true;
        // },
        // 跳转收藏组件方法
        jumpCart(){
            this.$router.push("/Collection")
        },
        // 添加到收藏方法
        addCollect(e){      
            let tar=e.target;
            // 获取房源id
            let hid=tar.dataset.hid;
            // 房源名称
            let housename=tar.dataset.housename;
            // 价格
            let price=tar.dataset.price;
             let pic=tar.dataset.pic;
            console.log(hid,housename,price)
            // 发送ajax请求
            let url="addcollect";
            let obj={hid,housename,price,pic}
            this.axios.get(url,{params:obj}).then(
                res=>{
                    if(res.data.code==-1){
                        this.$toast("请先登录")
                        this.$router.push("/Login");
                    }else if(res.data.data.length>0){
                        this.popupVisible=true;
                        // 定义一个一次性定时器，2秒钟将popup层关闭
                        setTimeout(()=>{
                       this.popupVisible=false;
                        },2000) 
                    }else{
                        this.$toast("添加成功") 
                    }
                }
            )
        },
        // collection(e){
        //     // 收藏小图颜色切换
        //     let img=e.target;
        //     if( (img.nodeName=="IMG") && (this.isSelected==false) ) {
        //         img.src="http://127.0.0.1:3000/selected.png";
        //         this.isSelected=true;
        //     }else{
        //         this.isSelected=false;
        //         img.src="http://127.0.0.1:3000/normal.png"
        //     }
        //     // 收藏小图颜色切换
            
        // },
       loadMore(){//功能：获取分页房源的数据
        this.qCon=false;    
        //1 发送ajax请求，axios
        var url="houses";//指定访问路径 
        this.pno++;
        var obj={pno:this.pno,pageSize:this.pageSize}
        this.axios.get(url,{params:obj}).then
        (res=>{
            //2 获取服务器的返回结果
            //console.log(res.data.data[1].pic)
            //3：将返回结果保存
            //this.list=res.data.data;
            //拼接多页的内容,运用concat进行数组拼接
            var rows=this.list.concat(res.data.data);
            // console.log(res.data.data)
            this.list=rows;
            // list1是方便条件查询使用，如果不定义list1，后面条件查询会将所有的商品替换成条件搜索出来的数组，select下拉框有事根据list循环出来的，select就只剩条件查询的选项了
            this.list1=rows;
            // console.log(this.list+"list")
             console.log(this.list1)
            })
        },
        //功能：按 “条件” 获取分页房源的数据
        loadWhich(){
        this.list=[];
        this.pno=""; //想要以接口需要准确的掌握好pno的增减，需要的时候增加，不需要的时候赋值为空 让后端使用默认值********及其重要，研究了好几天
        //条件查询开关  默认是false：无条件查询  true：按条件查询  
        this.qCon=true;  
        var conditions=this.conditions;
        //1 发送ajax请求，axios
        var url="conditions";//指定访问路径
        //console.log(conditions)
        var obj={conditions:this.conditions,pno:this.pno,pageSize:this.pageSize}
        this.axios.get(url,{params:obj}).then
        (res=>{
            //2 获取服务器的返回结果
            //console.log(res.data.data[1].pic)
            //3：将返回结果保存
            //this.list=res.data.data;
            //拼接多页的内容,运用concat进行数组拼接
            var rows=this.list.concat(res.data.data);
            //console.log(res.data.data)
            this.list=rows;
            })
        }, 
    },
    created() {
        if(!this.qCon){
        this.loadMore();
        }else{
            this.loadWhich()  
        }
        // console.log("1:created 组件创建成功")
    },
    mounted() {

    },
    
}
</script>
<style scoped>
    div,h4,p{margin:0;padding:0}
    .app-select{
        display: flex;
        justify-content: space-around;
        align-items: center;
        margin-bottom:16px;
        border-bottom:1px solid #ddd;
        background-color: transparent
    }
    .app-details{
        text-align: left;
        border-top:1px solid #eee;
    }
    .houses-item{
        padding:2px;
        display: flex;
        /* justify-content: space-around; */
        align-items: center;
        border-bottom:1px solid #0f0;
    }
    .house-spec{
        margin-left:10px;
    }
    .houses-item img{
        width:100px;
    }
    .app-price{
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size:14px;
    }
    .price{
        color:#f00;
        font-size:24px;
    }
    .myimg{
        width:24px !important;
        height:24px;
        vertical-align: middle;
    }
    /* 三个条件查询悬浮块 */
    .popup1{
        width:80%;
        border-radius: 2%;
        line-height: 40px;
        text-align: center;
        background-color:transparent;
        color:#fff;
    }
</style>
