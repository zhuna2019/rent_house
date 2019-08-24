//vue_server_00/app.js node程序
//1:加载第三方模块
//web服务器
const express = require("express");
//mysql驱动
const mysql = require("mysql");
// body-parser
const bodyParser = require('body-parser');
//跨域
const cors = require("cors");
//session
const session = require("express-session");
const pool=require("./pool");
var query=require("./query");
//2:配置数据库连接池:提高数据效率
// var pool = mysql.createPool({
//    host:"127.0.0.1",  //数据库地址
//    user:"root",       //数据库用户名
//    password:"",       //数据库密码
//    port:3306,         //数据库端口
//    database:"rh",     //数据库名称
//    connectionLimit:15 //连接数量
// });

var app = express();

//3:配置跨域模块 50
app.use(cors({
   //允许跨域访问程序地址列表
   origin:["http://127.0.0.1:8080",
   "http://localhost:8080"],
   credentials:true //请求验证
}))
//使用body-parser中间件
app.use(bodyParser.urlencoded({extended:false}));
//?4:配置session模块
app.use(session({
  secret:"128位字符串",//安全字符串
  resave:true,//请求更新数据
  saveUninitialized:true //保存初始数据
}));
// 静态托管public

app.use(express.static("public"));

//5监听3000
app.listen(3000);

//功能一:完成用户登录操作
app.post("/login",(req,res)=>{
  //1:参数:获取网页传递两个数据 uname upwd
  //参数方式一:?uname=tom&upwd=123 查询字符串
  //参数方式二:/tom/123            参数
  var uname = req.body.uname;
  var upwd = req.body.upwd;
  console.log(req.body)
  console.log(uname,upwd)
  //2:sql:查询sql语句
  //数据库 库名 表名 列名 小写字母
  var sql = "SELECT uid FROM rent_user";
  sql+=" WHERE uname = ? AND upwd=md5(?)";
  `SELECT uid FROM rent_user WHERE uname = ? AND upwd=md5(?)`
  //3:json:{code:1,msg:"登录成功"}
  pool.query(sql,[uname,upwd],(err,result)=>{
     //执行sql语句回调函数
     if(err)throw err;
     //判断
     console.log(result)
     if(result.length==0){
        res.send({code:-1,msg:"用户名或密码有误"});
     }else{
        //登录成功
        //1.将登陆成功凭据保存到session中
        //result返回的结果格式：[{uid:1}]
        req.session.uid = result[0].uid;
        req.session.uname = uname;
        //console.log(req.session)
        //2.将成功消息发送到脚手架
        res.send({code:1,msg:"登录成功"})    
     }
  })
});

// 功能二
//1 接收请求方式get 请求地址/product
// 功能二
//1 接收请求方式get 请求地址/product
app.get("/product",(req,res)=>{
  // 2接收客户端二个参数
var obj=req.query
console.log(obj)
var p=obj.pno;
var val=obj.value;
var ps=obj.pageSize;
// 3设置参数默认值 pno:1 pageSize:4
if(!p){p=1}
if(!ps){ps=4}
// 4创建变量offset 计算数据库偏移量
var offset =(p-1)*ps;
ps=parseInt(ps);
// 6创建sql语句
var sql=`SELECT * FROM rent_house WHERE title LIKE '%${val}%'`
// 7通过连接池发送sql语句
pool.query(sql,(err,result)=>{
  if(err) throw err;
  // 8获取数据库返回的查询结果
  // 9将查询结果发送客户端
  res.send({code:1,msg:"查询成功",data:result})
});
})

  
// 商品主业
app.get("/index",(req,res)=>{

// 2接收客户端二个参数
var obj=req.query
var p=obj.pno;
var ps=obj.pageSize;
// 3设置参数默认值 pno:1 pageSize:4
if(!p){p=1}
if(!ps){ps=4}
// 4创建变量offset 计算数据库偏移量
var offset =(p-1)*ps;
ps=parseInt(ps);
// 6创建sql语句
var sql="SELECT * FROM rent_house LIMIT ?,?"
// 7通过连接池发送sql语句
pool.query(sql,[offset,ps],(err,result)=>{
  if(err) throw err;
  // 8获取数据库返回的查询结果
  // 9将查询结果发送客户端
  res.send({code:1,msg:"查询成功",data:result})
});
})

//功能二：分页查询商品列表
// 1：接收请求方式 GET 请求地址 /houses
app.get("/houses",(req,res)=>{
  // 2：接收客户端的四个参数 
  //    pno  页码   pageSize  页大小  qCon 是否按条件查询  conditions 条件查询的条件
     var p = req.query.pno ;
     var ps = req.query.pageSize;
  // 3：设置默认值   pno：1    pagesize：4
     if(!p){p=1};
     if(!ps){ps=4};
  // 4：创建变量offset 计算数据库偏移量
     var offset = (p-1)*ps;
  // 5：对pageSize转换整形防止nodejs报错
     ps=parseInt(ps);
  // 6：创建sql语句
     var sql=`SELECT hid,price,housename,promise,spec,pic,house_area FROM rent_house LIMIT ?,?`;
     console.log(req.query)
  // 7：通过连接池发送sql语句
     pool.query(sql,[offset,ps],(err,result,)=>{
        if(err)throw err;
        // 8：获取数据库返回的查询结果
        // 9：将差查询结果发送给客户端
        res.send({code:1,msg:"查询成功",data:result});
     })
  })
  // 功能2.1条件加载房源数据并
  app.get("/conditions",(req,res)=>{
     // 2：接收客户端的四个参数 
     //    pno  页码   pageSize  页大小  qCon 是否按条件查询  conditions 条件查询的条件
        var p = req.query.pno ;
        var ps = req.query.pageSize;
        var conditions=req.query.conditions;
        // var uid=req.session.uid;
        console.log(conditions) 
     // 3：设置默认值   pno：1    pagesize：4
        if(!p){p=1};
        if(!ps){ps=4};
     // 4：创建变量offset 计算数据库偏移量
        var offset = (p-1)*ps;
     // 5：对pageSize转换整形防止nodejs报错
        ps=parseInt(ps);
     // 6：创建sql语句
        var sql="";
        // console.log(req.query)
        // if(!qCon){ 
        // }else{
            sql=`SELECT hid,price,housename,promise,spec,pic,house_area FROM rent_house `;
            sql+=`WHERE house_area= ? LIMIT ?,?`;
        // }
        console.log(sql)
        console.log(conditions) 
     // 7：通过连接池发送sql语句
        pool.query(sql,[conditions,offset,ps],(err,result)=>{
           if(err)throw err;
           // 8：获取数据库返回的查询结果
           // 9：将差查询结果发送给客户端
           res.send({code:1,msg:"查询成功",data:result});
           console.log(result,sql)
        })
     })
  //******************** */
  
  //功能三：将指定的房源加入收藏夹
  // 1: addcollect
  app.get("/addcollect",(req,res)=>{
  // 2：参数
  //获取当前登录用户的id值
  var uid=req.session.uid;
  // console.log(uid)
  //如果没登录
  if(!uid){
     res.send({code:-1,msg:"请先登录"})
     return;
  }
  //获取商品id，价格，名字
  var hid=req.query.hid;
  var price=req.query.price;
  var pic=req.query.pic
  var housename=req.query.housename;
  // console.log(uid,hid,housename)
  // 3：查询指定用户是否已收藏此房源
  var sql=`SELECT id FROM rent_collection WHERE uid=? AND hid=?`;
  pool.query(sql,[uid,hid],(err,result)=>{
     if(err)throw err;
     // 4：没有收藏过就添加此房源
     var sql=``;
     if(result.length==0){                          //数据库中的产品名字是字符串，所以模板字                                                  符串中的${housename}需要加引号
     // console.log(result.length)  
        sql=`INSERT INTO rent_collection VALUES (null,${hid},${uid},'${housename}',${price},'${pic}')`;
     }else{
        // 5：收藏过就查询你收藏夹中是否有房源信息的id
        sql=`SELECT id FROM rent_collection WHERE price=${price}&&hid=${hid}`;
     }
     pool.query(sql,(err,result)=>{
        if(err)throw err;
        // console.log(result);
        res.send({code:1,msg:"添加成功",data:result})
     })
     // 6：json
  })
  })
  
  //功能四：完成购物车的加载
  //1:type:GET   "/collect"
  app.get("/collect",(req,res)=>{
  //2:获得当前用户的uid值获取rent_collection中当前用户商品的编号hid，名称housename，和数量
  var uid=req.session.uid;
     //判断，如果登录了就进入收藏夹
     //没登录就提示登录
     if(!uid){
        res.send({code:-1,msg:"请登录"});
        return;
     }
  //3:创建sql语句查询收藏夹的内容
  var sql=`SELECT id,hid,housename,price,pic FROM rent_collection WHERE uid = ? `
  //4:获取返回结果并且发送给客户端
  pool.query(sql,[uid],(err,result)=>{
     if(err)throw err;
     res.send({code:1,msg:"查询成功",data:result})
  })
  
  })
  //功能5：删除收藏夹中的一个房源
  app.get("/del",(req,res)=>{
     //获取参数 id
     var id= req.query.id;
     //创建sql语句
     var sql="DELETE FROM rent_collection WHERE id = ?";
     pool.query(sql,[id],(err,result)=>{
        if(err)throw err;
        // console.log(result)
        if(result.affectedRows>0){
           res.send({code:1,msg:"删除成功"})
        }else{
           res.send({code:-1,msg:"删除失败"})
        }
     }
     )
  })
  //功能6：删除收藏夹的多个房源
  app.get("/delM",(req,res)=>{
     var ids=req.query.ids;
     // console.log(ids)
     var sql=`DELETE FROM rent_collection WHERE id IN (${ids})`;
     pool.query(sql,(err,result)=>{
        if(err)throw err;
        if(result.affectedRows>0){
           res.send({code:1,msg:"删除成功"})
        }else{
           res.send({code:-1,msg:"删除失败"})
        }
     })
  })

// 功能7 查询用户名
app.get("/select",(req,res)=>{
   // 2：参数
  //获取当前登录用户的id值
  var uid=req.session.uid;
  var uname=req.session.uname;
 console.log(uname)
  //如果没登录
  if(!uid){
     res.send({code:-1,msg:"请先登录"})
     return;
   }else{
      res.send({code:1,msg:"登录成功",data:uname})
   }
   

})

// 功能7：加载指定商品的详情页
app.get("/query",(req,res)=>{
   let hid=req.query.hid;
   console.log(req.query)
   var sql="SELECT price,housename,promise,spec,pic,house_area FROM rent_house WHERE hid = ?"
   pool.query(sql,[hid],(err,result)=>{
   if(err)throw err;
   console.log(result)
   res.send({code:1,msg:"查询成功",data:result})
   })
   })
   
   // 功能7：加载指定商品的详情页
   app.get("/query",(req,res)=>{
   let hid=req.query.hid;
   console.log(req.query)
   var sql="SELECT price,housename,promise,spec,pic,house_area FROM rent_house WHERE hid = ?"
   pool.query(sql,[hid],(err,result)=>{
   if(err)throw err;
   console.log(result)
   res.send({code:1,msg:"查询成功",data:result})
   })
   })
  
  