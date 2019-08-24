<template>
    <div class="app-login">
        <div class="login"> <img src="../assets/icon.png" alt=""> 会员登录</div>
        <!-- 用户名输入框 -->
        <mt-field :placeholder="unameholder" v-model="uname" class="unamefield"></mt-field>
        <!-- 用户密码输入框 -->
        <mt-field :placeholder="upwdholder" v-model="upwd" type="password" class="upwdfield"></mt-field>
        <div class="codefield">
            <mt-field :placeholder="codeholder" v-model="inputCode"></mt-field>
            <!-- 验证码 -->
            <div>
                <div class="login-code" @click="refreshCode">
                <!--验证码组件-->
                <random :identifyCode="identifyCode" />
              </div>
            </div>
            <!-- 验证码 -->
        </div>
        <!-- 登录按钮 -->
        <mt-button size="large" @click="login" class="lg">登录</mt-button>
    </div>
</template>
<script>
//引入验证码组件
import RandomCode from "./RandomCode.vue";
// 引入qs模块 初始化post 要传递的参数兑现
import qs from 'qs';
export default {
    data(){
        return{
            unameholder:"请输入用户名",
            upwdholder:"请输入密码",
            codeholder:"请输入验证码",
            uname:"",
            upwd:"",
            identifyCodes: "1234567890abcdefghijklmnopqrstuvwxyz",
            identifyCode: "",//四个验证码，用于和用户输入验证码进行比对
            inputCode:""
        }
    },
    //注册随机验证码组件
    components:{
        "random":RandomCode,
    },
    methods: {
        login(){
            //完成用户的登录操作
            //1 获取用户输入的用户名
            var u_name=this.uname;
            //2 获取用户输入的密码
            var u_pwd=this.upwd;
            var u_code=this.inputCode;
            //3 创建正则表达式验证用户名/密码/验证码
            var creg=/^[0-9]{4}$/i;
            var reg=/^[a-z0-9]{3,12}$/i
            // 3~12 字母或者数字
            //console.log(reg.test(u_code))
            if(!reg.test(u_code)){
                this.$toast("验证码不正确");
                return;
            }
            //4用户名验证失败提示消息
            if(!reg.test(u_name)){
                this.$toast("用户名格式不正确，请输入3~12位数字或字母");
                return;
            }
            //5密码验证失败的提示消息
            if(!reg.test(u_pwd)){
                this.$toast("密码格式不正确，请输入3~12位数字或字母密码");
                return;
            }
            
            //console.log(u_pwd,u_name,u_code)
            //6验证都成功发送ajax请求，axios
            var url="login";
            var obj={uname:u_name,upwd:u_pwd}
            //this.axios.get(url,{params:obj}).then
            // this.axios.post(url,{params:obj}).then
            this.axios.post(url,qs.stringify(obj)).then
            (res=>{
                //7 获取服务器的返回结果
                console.log(res.data)
             //7.1:登录失败  提示
                if(res.data.code!=1){
                    this.$toast("登录失败,用户名或密码错误")
                }
                //7.2:登录成功  提示
                else{
                    this.$toast("登录成功");
                    //Vue中组件之间的跳转的方法
                    this.$router.push("/Mine");
                }
            })
        },
        //获取验证码
        randomNum(min, max) {
            return Math.floor(Math.random() * (max - min) + min);//返回一个随机数
        },
        //刷新验证码
        refreshCode() {
            this.identifyCode = "";
            this.makeCode(this.identifyCodes, 4);
        },
        makeCode(o, l) {
            for (let i = 0; i < l; i++) {
                this.identifyCode += this.identifyCodes[this.randomNum(0, this.identifyCodes.length)];
            }
            console.log(this.identifyCode);
        }
        },
        created() {
            //初始化验证码
            this.refreshCode();
        },
        mounted() {
            this.identifyCode = "";
            this.makeCode(this.identifyCodes, 4);
        }
        
    }
</script>
<style scoped>
.login{
    width:100%;
    height:5rem;
    background:rgb(125, 223, 226);
    font-size:26px;
    color:#fff;
    text-align: center;
    padding-top :2rem;
}
    .unamefield{border-bottom:1px solid #eee;
   }
    .upwdfield{border-bottom:1px solid #eee;}
    .codefield{
        position:relative;
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom:1px solid #eee;
    }
    .lg{
        background:rgb(125, 223, 226);;
    }
</style>
