<template>
<!-- 指定房源详情页 -->
    <div id="app"> 
        <div >
            <img class="infoImg" src="http://127.0.0.1:3000/08.jpg"  alt="">
            <h4>{{list.housename}}</h4>
            <div class="infoDel">
                <div>{{list.price}}</div>
                <div>三室一厅</div>
                <div>30平方米</div>
            </div>
            <div class="infoSpec">
                <span>价格</span>
                <span>户型</span>
                <span>建筑面积</span>
            </div>
            <h5 style="background-color:#bbb;line-height:25px;">详细信息</h5>
            <div class="houInfo">
                <div>朝向:南</div>
                <div>电梯:有</div>
                <div>用途:出租住宅</div>
                <div>年代:2014年建成</div>
                <div>小区:闻堰镇戈雅公寓</div>
                <div>周边:***小学</div>
            </div> 
       </div>
    </div>
</template>
<script>
export default { 
    data(){
        return{
            list:[],
            hid:1
        }
    },
    methods: {
        loadInfo(){
            let url="query";
            let hid=this.hid;
            let obj={hid}
            console.log(hid)
            this.axios.get("/query",{params:obj}).then(res=>{
                var rel=res.data.data[0];
                this.list=rel;
                console.log(this.list)
            })
        }
    },
     created() {
        this.list=[];
        this.loadInfo();
    },
}
</script>
<style scoped>
#app{
    text-align: center;
}
    .infoImg{
        width:375px;
    }
    .infoDel{
        display: flex;
        justify-content: space-around;
        align-items: center;
    }
    .infoSpec{
        color:#ddd;
        font-size:14px;
        margin-top:2px;
        display: flex;
        justify-content: space-around;
        align-items: center;
    }
    .houInfo{
        display: flex;
        justify-content: space-around;
        align-items: center;
        flex-wrap: wrap;
    }
    .houInfo div{
        width:48%;
        background-color:rgb(149, 207, 209);
        margin-bottom:16px;
        text-align: left;
        padding-left:4px; 
    }
</style>
