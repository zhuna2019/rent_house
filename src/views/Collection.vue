<template>
  <div class="">
    <div class="collect">我的收藏</div>
    <div class="selectAll">
      全选<input type="checkbox" @click="selectAll" v-model="cb">
    </div>
    <div class="cart-item" v-for="(item,i) of list" :key="i">
      <div class="leftImgText">
        <input class="sinInput" type="checkbox" v-model="item.cb" @click="selectOne">
        <img :src="`http://127.0.0.1:3000/${item.pic}`" alt="">
        <div class="lname">{{item.housename}}</div>
        <div class="price">￥{{item.price.toFixed(2)}}</div>
      </div>
      <mt-button class="del" @click="delItem" :data-id="item.id">×</mt-button>
    </div>
     <div class="last">
        收藏夹房源的数量
        <span>({{$store.getters.getCartCount}})</span>
        <mt-button @click="delMitem" type="danger"> 删除选中的房源</mt-button>
      </div>
      <router-link to='Home' class="home"> <div>返回首页</div></router-link>
  </div>
</template>
<script>
  export default {
    data(){
      return {
        list:[],
        cb:false, //全选按钮的双向绑定
      }
    },
    created() {
      this.loadMore();
    },
    methods:{
      //给每一个小checkbox绑定单击事件，
      //如果有任何一个按钮是选中的，全选就不能选中
      selectOne(e){
        var cb=e.target.checked;
        if(!cb){
          this.cb=false;
        }
      },
      selectAll(e){
        // 1:获取全选按钮状态
        var cb=e.target.checked;
        //console.log(cb)
        // 2：创建循环遍历购物车数组
        for(var item of this.list){
          item.cb=cb;
        }
        // 3：将全选状态赋值为购物车商品的选中状态
      },
      delItem(e){
        //获取购物车的id
        var id=e.target.dataset.id; 
        //交互提示是否删除商品
        this.$messagebox.confirm("是否删除指定的房源").then(res=>{
          //console.log(123)
          //请求服务器的url地址
          var url="/del";
          //请求服务器时发送的参数
          var obj={id};
          //发送请求，并返回内容
          this.axios.get(url,{params:obj}).then(res=>{
            //重新调用loadMore(),查新最新的购物车列表
            if(res.data.code>0){
              this.$toast("删除成功");
              this.loadMore();
            }
          })
        })
        .catch(res=>{
          // console.log(456)
        })
      },
      //删除多个商品的功能
      delMitem(){
        //定义空字符保存需要删除的几个id
        var str="";
        //遍历表中的数据，将选中的数据赋值到字符串中，并用逗号链接
        for(var item of this.list){
          if(item.cb){//true: 选中
            str+=item.id+",";
          }
        }
        //做一个判断，如果用户没有选择任何要删除的数据，就提示用户删除
        if(str.length==0){
          this.$toast("请选择要删除的房源");
          return;
        }
        //截取字符串最后的,使其符合语法
        str=str.substring(0,str.length-1);
        //ids=ids.substring(0,str.length-1);
        //交互提示再次确认是否要删除
        this.$messagebox.confirm("是否删除数据？")
        .then(res=>{
          //指定url
          var url="delM";
          var ids={ids:str};
          //var ids={ids};
          this.axios.get("/delM",{params:ids}).then
          (res=>{
            //执行成功后重新加载购物车列表
            this.loadMore();
            this.$toast("删除成功")
          })
        })
        .catch(err=>{
          console.log(err)
        })
        console.log(str);
      },
      loadMore(e){
        //1:创建url
        var url = "collect";
        //2:发送ajax请求
        this.axios.get(url).then(res=>{
          if(res.data.code==-1){
            this.$messagebox("消息","请登录").
            then(res=>{
              this.$router.push("/Login");
              return;
            })
          }else{
            var list=res.data.data;
            //创建循环遍历数组，为每个元素添加一个cb属性表示商品前复选框的状态
            //加载之前先清空一下
            this.$store.commit("clear");
            //先添加cb属性，再复制list
            for(var item of list){
              //添加cb属性表示状态
              item.cb=false;
              //修改共享购物车中数量值 vuex
              this.$store.commit("increment")
            }
            //保存购物车数据
            this.list=list;
            //console.log(this.list)
          }
        })
      }
    }
  }  
</script>
<style scoped>
.home{
  font-size:26px;
}
.collect{
  width:100%;
  height:3rem;
  background:rgb(130, 236, 201);
  font-size:26px;
  color:#fff;
  text-align: center;
  padding-top:2rem;
  margin-bottom:1rem;
}
  /* 元素靠左侧显示 */
  #app{text-align: left;}
  /*最外层弹性布局*/
 .cart-item{
  display:flex;/*弹性布局*/
  justify-content:space-between;
  align-items:center;/*垂直居中*/
  border-bottom:1px solid #ccc;
 }
 .selectAll{
   font-size:1.5rem;border:.5px solid #eee;
   padding-left:1rem;
 }
 .leftImgText{
   /*默认子元素水平对齐*/
   display:flex;
   align-items:center;/*垂直居中*/
   height:100px;
 }
 .sinInput{
   margin-left:2px;
 }
 .leftImgText img{
   width:50px;
   height:50px;
   margin-left:2px;
 }
 .price{
   margin-left:6px;
 }
 .lname{
   margin-left:6px;
   width:143px;
 }
 .del{
   margin-right:2px;
 }
 .last{
   display: flex;
   justify-content: space-between;
   align-items: center;
   margin-top:1rem;
 }
 .last span{
   color :crimson;
   font-size:1.5rem;
 }
</style>