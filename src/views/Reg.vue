<template>
    <div class="regVue" >
        <div :class="{'upSec':!active}">
            <mt-header title="用户注册" v-model="val">
                <router-link to="/" slot="left">
                    <mt-button >返回</mt-button>
                </router-link> 
                <mt-button  slot="right"></mt-button>
            </mt-header>
            <div class="myLogo">
                <img  src="../assets/mylogo.png" alt="加载中...请耐心等待">
            </div>
            <!-- 内容区域 -->
            <div class="reg">
                <!--手机号-->
                <mt-field :disabled="!val" type="number" v-model="phone" placeholder="请输入您的手机号" @blur.native.capture="checkPhone"> 
                    <i class="iconfont iconimg">&#xe6a6;</i>
                    <i v-if="type==1" class="iconfont correct">&#xe611;</i>
                    <i v-else-if="type==-1" class="iconfont uncorrect">&#xe960;</i>
                </mt-field>
                <!--用户名-->
                <mt-field :disabled="!val" type="text" v-model="uname" placeholder="请输入3-8用户名(不区分大小写)" @blur.native.capture="checkUname"> 
                    <i class="iconfont iconimg">&#xe607;</i>
                    <i v-if="type3==1" class="iconfont correct">&#xe611;</i>
                    <i v-else-if="type3==-1" class="iconfont uncorrect">&#xe960;</i>
                </mt-field>
                <!--密码 -->
                <mt-field :disabled="!val" type="password" v-model="upwd" placeholder="请输入6~18位大,小写字母,数字" @blur.native.capture="checkUpwd">
                    <i class="iconfont iconimg">&#xe64a;</i>
                    <i v-if="type0==1" class="iconfont correct">&#xe611;</i>
                    <i v-else-if="type0==-1" class="iconfont uncorrect">&#xe960;</i>
                </mt-field>
                <!--确认密码 -->
                <mt-field :disabled="!val" type="password" v-model="upwd2" placeholder="请确认密码" @blur.native.capture="confirmUpwd">
                    <i class="iconfont iconimg">&#xe64c;</i>
                    <i v-if="type1==1" class="iconfont correct">&#xe611;</i>   
                    <i v-else-if="type1==-1" class="iconfont uncorrect">&#xe960;</i>   
                </mt-field>
                <!-- 验证码 -->
                <mt-field  :disabled="!val" placeholder="验证码" type="text"  v-model="inputCode" @blur.native.capture="confirmCode">
                    <i class="iconfont iconimg">&#xe668;</i>
                    <i v-if="type2==1" class="iconfont correct">&#xe611;</i>
                    <i v-else-if="type2==-1" class="iconfont uncorrect">&#xe960;</i>
                    <!-- 全局组件 随机验证码 -->
                    <vRandomCode  @click.native="refreshCode" :identifyCode="identifyCode" class="myident"/>   
                </mt-field>
                <!-- 注册 -->
                <mt-button :disabled="!val" size="large" type=danger class="btn" @click="reg">同意用户协议并注册</mt-button>
                <h4 class="myfooter">
                    <input type="checkbox" v-model="val" checked>&nbsp;
                    <span class="myspan">我已阅读并同意</span> &nbsp;
                    <a class="myagr" @click="toAgree">&lt;&lt;用户协议&gt;&gt;</a>
                </h4> 
            </div>
            <!-- 内容区域 -->
            {{res.uname}}{{res.uid}}
            <mt-button v-show="res.uid" class="btn" size="large" @click="logout">退出登录</mt-button>
        </div>
        <!-- 用户须知 -->
        <div :class="{'show':!active,'hide':active}">
            <span class="close">点击关闭</span>
            <i @click="backReg" class="iconfont backReg">&#xe960;</i>
            <center><h2 style="padding-bottom:5px;">网站注册服务条款</h2></center>
            &nbsp;&nbsp;&nbsp;&nbsp;尊敬的用户，欢迎您注册成为小二租房网站的用户。此服务条款详细表述您在“小二租房”网站享受我们的服务时所须遵守的条款，如您有任何疑问，请及时与我们联系。
            在您注册成为“小二租房”电子商务用户（以下简称：本网站用户）前，请务必仔细阅读本用户协议、隐私保护、以及其他本网站公布之相关有效规则、文件，一旦您注册成为了本网站用户即表示您已经阅读、同意并接受本网站相关法律文件中所含的所有条款。如果我们对本声明进行了任何变更，我们会在“小二租房”官方网站页面上发布相关变更事项的通知，所有协议内容在发布之日后自动生效。如您有任何疑问，请先致电我们的客服。 
            <h3>一、服务条款的确认和接纳</h3> 
            <p>
            小二租房网站各项服务的所有权和运作权归本网站拥有。
            邮件/短信服务：
            小二租房网站会通过邮件、短信的形式，对本网站注册、预约用户发送订单信息、促销活动等告知服务。如果你不想接受来自小二租房网站的邮件、短信，您可以向小二租房网站提出退阅申请，并注明您的E-mail地址、手机号或相关地址信息，小二租房网站会在收到申请后为您办理退阅。</p>
            <h3>二、用户注册 </h3>
            <p> 1、在线用户注册成功后，您将拥有一个青客（商城、社区）专用免费帐号及相应的密码，该帐号和密码将成为用户登录“青客（商城、社区）”、享受“青客（商城、社区）”服务、发表评论、预约房源等服务的凭证。</p>
            <p> 2、每位用户只允许在“青客（商城、社区）”拥有一个有效账户，如有证据证明用户存在恶意注册多个账户的情形，青客有权采取取消、冻结或关闭账号等措施。该账户被取消、冻结或关闭之前所作出的行为引起的所有法律后果均由该用户承担，如该行为造成青客官网损失的，用户需承担相应的损害赔偿责任。</p>
            <p>3、享受“青客（商城、社区）”服务过程中，用户有义务保管好其个人账号及密码，并对他人使用私人计算机作出限制。用户不得以任何形式擅自转让或授权他人使用自己的“青客（商城、社区）”帐号及密码。如果因为用户管理不善造成帐号、密码等被复制或被盗用，相应损失由用户自行承担。同时，通过该用户的个人账户在“青客（商城、社区）”上发生的所有活动以及产生的责任，亦应由该用户承担。</p>
            <p>4、注册用户不得采用测试、欺骗等任何非法手段，盗取其他用户的账户信息或对他人进行骚扰。</p>
            <p> 5、青客承诺仅根据本网站服务目的使用用户个人信息。服务目的包括但不限于预约确认、时间安排、客户回访、政策更新、用户通知、发送促销信息、商业信息以及其他与预约和服务相关的辅助服务等。如用户认为“青客（商城、社区）”超范围使用了其个人信息，请立即与客服中心联系，上海青客设备租赁有限公司将核实处理。</p>
            <h3>三、用户隐私保护 </h3>
            <h4>维护与尊重用户个人隐私是“小二租房网站”的一项基本政策，因此，“小二租房网站”非依法律规定或其他有效法律约定不会向任何第三方披露、转让、出租或者出售预约用户名单、预约记录等涉及消费者个人信息的数据以及用户保存在“小二租房网站”各项服务中的非公开内容。
            对用户注册资料的保护</h4>
            用户可授权“小二租房网站”向第三方透露其注册资料，否则“小二租房网站”不会公开用户的姓名、住址、通信地址、电子邮箱、电话及帐号。以下情况除外：
            <p>1）事先获得用户明确授权后，用户许可或授权“小二租房网站”通过电子邮件服务或其他方式透露这些信息； </p>
            <p>2）相应的法律、法规要求以及按照有关政府主管部门的要求，需要“小二租房网站”提供用户的个人资料；</p>
            <p>3）为了维护交易双方、用户和（或）“小二租房网站”、 上海青客设备租赁有限公司合法利益；</p>
            <p>4）“小二租房网站”可能会与第三方合作向用户提供相关的网络服务，在此情况下，如该第三方同意承担与“小二租房网站”同等的保护用户隐私的责任，则“小二租房网站”有权将用户的注册资料等提供给该第三方；</p>
            <p>5）在不透露单个用户隐私资料的前提下，“小二租房网站”有权对整个用户数据库进行分析并对用户数据库进行商业上的利用；</p>
            <p>6）根据本网站已经公布之有效法律文件，本网站有权许可第三方使用该用户个人信息的其他情形。</p>
            <h3>四、预约及留言管理 </h3>
            <h4>注册用户在本网站进行商品预约和留言时必须遵守以下条款 ：</h4>
            <p>1. 您在本网站的一切操作应遵守所有适用的中国法律法规、规章制度和地方性法规要求。同时您必须确保遵守本用户协议和隐私保护以及纳入上述文件的所有其它条款、规则等一切相关内容。</p>
            <p>2. 如您在本网站预约商品，您有义务完成与本网站的预约流程（法律或本用户协议禁止的预约除外）。预约操作执行并下预约单后，即表示您同意该商品描述所含的一切出售条件，（商品出售条件不违反本协议并合法）。</p>
            <p>3. “小二租房网站”保留对商品预约数量的限制权。在下预约单的同时，您也同时承认了您拥有购买这些产品的权利能力和行为能力，并且将您对您在订单中提供的所有信息的真实性负责。</p>
            <p>4. “小二租房网站”网站上的广告，价目表和声明并不构成要约。在本网站对您的预约单进行确认之前，您和本网站之间不存在合同关系。本网站有权在发现显现的商品及订单的明显错误或缺货的情况下，单方面撤回该信息或终止交易。5. 商品价格和可获性都在网站上指明。这类信息将随时更改且不另行通知。在确认了您的订单后发生的意外情况，比如由于商家提价、市场调节、税额变化引起的价格变化、或是由于网站的错误等造成价格变化，本网站会通过E-mail或电话形式通知您，让您决定是否取消订单。</p>
            <p>6. 拒绝提供担保:用户明确同意信息服务的使用由用户个人承担风险。 “小二租房网站”不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保，但会在能力范围内，避免出错。</p>
            <p>8. 用户不能在本网站上使用谩骂，侮辱，诽谤等不雅言语以及其它攻击其他用户和网站的言语。“小二租房网站”有权自行决定删除此类言论及其它“小二租房网站”认为不合适的言论，而不负有通知义务并承担责任。</p>
            <p>9. 您在本网站下订单并完成订单交易后，如出现任何问题需与客服人员取得联系，并按照本网站“消费保障”政策进行处理。</p>
            <h3>六、网站安全 </h3>
            <h4>您同意，未经本网站明示书面准许，您不会为了任何目的使用任何机器人、蜘蛛软件、刷屏软件或其他自动方式进入网站。此外，您同意绝不进行以下操作：</h4>
            <p>1. 进行任何对本网站造成或可能造成（按本网站自行酌情确定）不合理或不合比例的重大负荷的行为；</p>
            <p>2. 未经本网站事先明示书面准许，对本网站的任何内容（除您的个人信息以外）制作拷贝、进行复制、修改、制作衍生作品、分发或公开展示等的侵权行为；</p>
            <p>3. 干扰或试图干扰本网站的正常工作或活动；</p>
            <p>4. 在本网站中使用可能视为被禁止或可能被禁止的任何内容；</p>
            <p>5. 对本网站使用不良数据。包含可能破坏、改变、删除、不利影响、秘密截取、未经授权而接触，或占用任何系统、数据、个人资料的病毒、间谍软件、其他电脑程序等；</p>
            <p>6、侵犯他人合法权益的行为；</p>
            <p>7、违反法律法规或本网站有效法律文件约定之行为。</p>
            <h3>七、知识产权声明 </h3>
            本网站所提供的网络服务的相关著作权、专利权、商标、商业隐私及其它权利，均属“中国婚博会官网”所有。非经本网站同意，任何个人或单位均不得擅自下载、复制、传输、修改、编辑制作等操作，否则将承担所有法律责任。“小二租房网站”拥有本网站服务器中的任何数据信息的绝对所有权。 
            <h3>八、免责声明 </h3>
            本网站用户同意接收来自“小二租房网站”或者“小二租房网站”合作伙伴发出的信息，包括但不限于电子邮件，手机短消息。
            “小二租房网站”有义务在技术上确保网站的正常运行，尽力避免服务中断或将中断时间限制在最短时间内，保证用户网上预约活动顺利进行。但如因不可抗力或其他本网站无法控制的因素使网站崩溃或无法正常使用导致网上预约无法完成或丢失有关的信息、记录等，本网站不承担责任；任何用户向本网站提供错误、不完整、不实信息等造成不能正常使用本网站服务或遭受任何其他损失，概与本网站无关。
            本网站《免责声明》中所列之其他情形。
            <h3>九、服务终止</h3>
            <h4>1. 注册会员或“小二租房网站”可随时根据实际情况中断一项或多项服务。“小二租房网站”不需对任何个人或第三方负责而随时中断服务。会员若反对任何服务条款的建议或对后来的条款修改有异议，或对“小二租房网站”服务不满，会员可以行使如下权利：</h4>
            <p>1)会员用户不再享受“小二租房网站”相关信息服务 。</p>
            <p>2)通知“小二租房网站”停止对该会员的服务。</p>
            <p>3)结束用户会员服务后，注册会员使用“小二租房网站”服务的权利马上中止。会员服务终止后，会员没有权利，“小二租房网站”也没有义务传送任何未处理的信息或未完成的服务给会员或第三方。</p>
            <h4>2. 如有以下行为的注册会员将会被取消会员资格：</h4>
            <p>1)违反“小二租房网站”注册条款。</p>
            <p>2)提供虚假注册会员个人资料。</p>
            <p>3)注册会员有损公司利益的行为。 </p>
            <p>4)有违反中国的法律、法规、违反互联网相关规定的行为。 </p>
            <p>5)用户将会员帐号用于出售、拍卖等，利用会员帐号当作商品进行交易的行为。 </p>
            <p>6)用户出借、转让会员帐号给其他会员等不恰当行使会员权利的行为。</p>
            <p>7)利用盗取密码、诈骗等不正当手段获得会员帐号的行为。</p>
            <p>8)恶意在商品留言，博客、微博等个人空间中多次或大量使用谩骂，侮辱，诽谤等不雅言语的行为。</p>
            <h3>十、其它 </h3>
            <p>1、本服务条款以及与使用“小二租房网站”服务相关的声明、说明、规则、政策、程序，构成“小二租房网站”与用户之间有效的完整协议，将对用户持续有效，有效期至用户注销或者被取消账户、且停止一切使用“小二租房网站”服务的行为后，但“小二租房网站”与用户间已经产生的权利义务，仍对双方有约束力。</p>
            <p>2、上海青客设备租赁有限公司将视向用户所提供服务内容之特性，要求用户在注册小二租房网站提供的有关服务时，遵守特定的条件和条款；如该特定条件和条款与以上服务条款有任何不一致之处，则以特定条件和条款为准。</p>
            <p>3、本服务条款中的任何条款无论因何种原因完全或部分无效或不具有执行力，其余条款仍应有效并且有约束力。</p>
            <p>4、本服务条款的标题、序号均为方便阅读而设定，不影响条款实际含义及其效力。</p>
            <p>5、本服务条款自公布及适用的当天生效，有效期持续至新版本发布之时。</p>
            <p>6、以上条款的解释权归上海青客设备租赁有限公司最终所有。</p>
	    
        </div>
        <!-- 用户须知 -->
    </div>
</template>
<script>
import qs from 'qs';
export default {
    data(){
        return {
            res:{
                uid:localStorage.getItem('uid'),
                uname:localStorage.getItem('uname')
            },
            val:true,
            uname:"",
            upwd:"",
            upwd2:"",  //确认密码
            phone:"",
            active:true,  //元素是否显示的判断条件
            identifyCodes: "1234567890abcdefghijklmnopqrstuvwxyz",
            identifyCode: "",//四个验证码，用于和用户输入验证码进行比对
            inputCode:"", //获取用户输入的验证码
            // 确认输入框输入内容符合正则
            type:0,
            type0:0,
            type1:0,
            type2:0,
            type3:0,
        }
    },
    methods: {
        //5 用户确认信息 点击注册
        reg(){
            let phone=this.phone;
            let uname=this.uname;
            let upwd=this.upwd;
            let url="/user/reg";
            let obj={uname,upwd,phone};
            if(!phone||!uname||!upwd){
                this.$toast("请输入相关信息再点击注册")
                return;
            }
            this.axios.post(url,qs.stringify(obj))
            .then(result=>{
                if(result.data.code>0){
                    this.$toast("恭喜您注册成功,3秒后跳转至登录页面");
                    setTimeout(()=>{
                        setTimeout(()=>{
                            // this.jumpStatus=1
                            this.$router.push('/Login')
                        },3000)
                    },20)
                }else{
                    this.$messagebox("提示","注册失败")
                }
            })
        },
        //1 手机号验证
        checkPhone(){
            //1:电话正则验证
            let reg_phone=/^1[3-8]\d{9}$/i;
            if(!reg_phone.test(this.phone)){
                this.$toast("手机号格式错误，请重新输入！")
                this.type=-1;
                return;
            }else if(reg_phone.test(this.phone)){
                //发送axios请求
            //"根据后台数据库验证此号码是否被注册过"
                let url="checkPhos";
                let obj={phone:this.phone}; 
                this.axios.get(url,{params:obj}).then(
                result=>{
                    console.log(result.data.code)
                    if(result.data.code>0){
                    this.$toast("该手机号已注册！")
                    this.type=-1;
                    }else{
                        this.type=1;
                    }
                }
                )
            }
        },
        //2 密码验证
        checkUpwd(){
            //1.1:密码正则验证      
            let reg_upwd=/^.*(?=.{6,18})(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).*$/;
            if(!reg_upwd.test(this.upwd)){
                this.$toast("密码格式错误，请重新输入！")
                this.type0=-1;
                return;
            }else if(reg_upwd.test(this.upwd)){
                this.type0=1;
            }
        },
        //3:确认密码验证
        confirmUpwd(){
            if(this.upwd2!=this.upwd||this.upwd2==""){
                this.$toast("两次密码不一致，请重新输入！")
                this.type1=-1;
                return;
            }else{
                this.type1=1;
            }
        },
        // 4 确认随机验证码
        confirmCode(){
            if(this.inputCode!=this.identifyCode){
                this.$toast("验证码输入错误,请重新输入!");
                this.refreshCode();
                this.type2=-1;
                return;
            }else{
                this.type2=1;
            }
        },
        // 5 用户名确认
        checkUname(){
           //1:电话正则验证
            let check_uname=/^[a-z][a-zA-Z0-9_]{3,8}$/i;
            if(!check_uname.test(this.uname)){
                this.$toast("用户名错误或为空，请重新输入！")
                this.type=-1;
                return;
            }else if(check_uname.test(this.uname)){
                //发送axios请求
            //"根据后台数据库验证此号码是否被注册过"
                let url="user/checkName";
                let obj={uname:this.uname}; 
                this.axios.get(url,{params:obj}).then(
                result=>{
                    console.log(result.data.code)
                    if(result.data.code>0){
                    this.$toast("该用户名已注册！")
                    this.type3=-1;
                    }else{
                        this.type3=1;
                    }
                })
            }
        },
        // 6 退出登录
        logout(){
            this.$store.commit("changeUser",{uid:"",uname:""});
            localStorage.clear()
            window.location.reload()
        },
        toAgree(){
            this.active=false;
        },
        // 关闭用户须知返回注册页
        backReg(){
            this.active=true;
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
        makeCode(o,l) {
            for (let i = 0; i < l; i++) {
                this.identifyCode += this.identifyCodes[this.randomNum(0, this.identifyCodes.length)];
            }
            //console.log(this.identifyCode);
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
    .reg>>>.mint-field-clear{
    display:none
  }
    .myident{
        position:absolute;
        top:-.125rem;left:8rem;
        margin-left:1rem;  /* 右边要稍微空出适当的距离，验证需要显示图标 */
    }
    .myspan{
        font-size:.9rem;
    }
    .myagr{
        color:#f00;
    }
    .close{
        font-size:1.4rem;
        font-weight: bolder;
    }
    .regVue{
        padding:0 3%;      
    }
    /* 初始化 */
    .regVue>>>.mint-cell{
        width:90%;
        margin-left:.6rem;
        position:static;
    }
    .myLogo>img{
        width:30%;
    }
    .regVue>>>.mint-field-core{
        margin-left:10%;
    }
    .regVue>>>.mint-cell-wrapper{
        border-bottom:1px solid rgb(167, 165, 165);
        margin-left:0;
    }
    .reg{
        display: flex;
        align-items: center;
        flex-wrap: wrap;
    }
    .regVue>>>.mint-field-other{
        left:-102%;top:-0.8rem;
        position: relative;
    }
    .regVue>>>.mint-field-other>.iconimg{
        position: absolute;
    }
    /* 验证正确字符显示 */
    .regVue>>>.mint-field-other>.correct{
        position: absolute;
        left:17.5rem;
    }
    /* 验证字符错误显示 */
    .regVue>>>.mint-field-other>.uncorrect{
        position: absolute;
        left:17.5rem;
    }
    .iconfont{
        font-size:1.75rem;
    }
    .myfooter{
        margin:1rem auto;
    }
    .btn{
        margin-top:1rem;
    }
    /* 用户协议 */ 
    .upSec{
        display: none;
    }
    .show{
        display:block;
        position:absolute;
        top:4rem;left:0;
        font-size:.6rem;
        width:90%;height:25rem;
        overflow:scroll;
        padding:2px;
        margin-left:1rem;
        background-color: rgb(29, 110, 156);
        color:cornsilk;
        }
    .hide{
        display:none;
        }
</style>