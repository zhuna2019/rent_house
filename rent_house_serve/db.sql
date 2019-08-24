#vue_server_00 创建目录
#一定要单独创建目录不要放在脚手架项目中
#(1)进入数据 xz
USE xz;
#(2)创建表  xz_login
CREATE TABLE xz_login(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(50),
  upwd  VARCHAR(32)
);
#(3)添加二条测试数据11:40
INSERT INTO xz_login VALUES(null,'tom',md5('123'));
INSERT INTO xz_login VALUES(null,'jerry',md5('123'));


#完成商品分页显示功能
#(1)添加列xz_laptop img_url VARCHAR(255)
  ALTER TABLE xz_laptop ADD img_url VARCHAR(255);
#(2)更新数据
UPDATE xz_laptop SET img_url='01.jpg';




