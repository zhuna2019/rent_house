#设置客户端连接服务器编码
SET NAMES UTF8;
#丢弃数据库，如果存在
DROP DATABASE IF EXISTS rh;
#创建数据库rh,设置存储的编码
CREATE DATABASE rh CHARSET=UTF8;
#进入该数据库
USE rh;
#创建用户信息表
CREATE TABLE rent_user(
  uid SMALLINT PRIMARY KEY,
  uname VARCHAR(32) UNIQUE,
  upwd VARCHAR(32),
  phone VARCHAR(16) UNIQUE,
  avatar VARCHAR(128),
  user_name VARCHAR(32),
  gender SMALLINT
);
#插入数据
INSERT INTO rent_user VALUES(1,'dingding','123456','13612345678','img/01.png','林钉钉',0);

#创建保存民宿数据的表
CREATE TABLE rent_house(
  hid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64)  NOT NULL,
  subtitle VARCHAR(128) NOT NULL,
  price DECIMAL(7,2) NOT NULL DEFAULT 6999,   
  promise VARCHAR(256),
  spec VARCHAR(32),
  pic VARCHAR(128) NOT NULL,
  detail VARCHAR(3000),
  isRented SMALLINT NOT NULL
);
#插入数据
INSERT INTO rent_house VALUES(null,'洱海民宿','云南风温馨小屋',4999.00,'入住前12小时无条件退房','大床房','01.png','详情一',0);
INSERT INTO rent_house VALUES(null,'丽江民宿','近江渔村',5999.00,'入住前12小时无条件退房','大床房','02.png','详情二',0);
INSERT INTO rent_house VALUES(null,'香格里拉民宿','人间天堂',6999.00,'入住前12小时无条件退房','大床房','03.png','详情三',0);
INSERT INTO rent_house VALUES(null,'洱海民宿','云南风温馨小屋',4999.00,'入住前12小时无条件退房','大床房','01.png','详情一',0);
INSERT INTO rent_house VALUES(null,'丽江民宿','近江渔村',5999.00,'入住前12小时无条件退房','大床房','02.png','详情二',0);
INSERT INTO rent_house VALUES(null,'香格里拉民宿','人间天堂',6999.00,'入住前12小时无条件退房','大床房','03.png','详情三',0);
INSERT INTO rent_house VALUES(null,'洱海民宿','云南风温馨小屋',4999.00,'入住前12小时无条件退房','大床房','01.png','详情一',0);
INSERT INTO rent_house VALUES(null,'丽江民宿','近江渔村',5999.00,'入住前12小时无条件退房','大床房','02.png','详情二',0);
INSERT INTO rent_house VALUES(null,'香格里拉民宿','人间天堂',6999.00,'入住前12小时无条件退房','大床房','03.png','详情三',0);
INSERT INTO rent_house VALUES(null,'洱海民宿','云南风温馨小屋',4999.00,'入住前12小时无条件退房','大床房','01.png','详情一',0);
INSERT INTO rent_house VALUES(null,'丽江民宿','近江渔村',5999.00,'入住前12小时无条件退房','大床房','02.png','详情二',0);
INSERT INTO rent_house VALUES(null,'香格里拉民宿','人间天堂',6999.00,'入住前12小时无条件退房','大床房','03.png','详情三',0);
INSERT INTO rent_house VALUES(null,'洱海民宿','云南风温馨小屋',4999.00,'入住前12小时无条件退房','大床房','01.png','详情一',0);
INSERT INTO rent_house VALUES(null,'丽江民宿','近江渔村',5999.00,'入住前12小时无条件退房','大床房','02.png','详情二',0);
INSERT INTO rent_house VALUES(null,'香格里拉民宿','人间天堂',6999.00,'入住前12小时无条件退房','大床房','03.png','详情三',0);
INSERT INTO rent_house VALUES(null,'洱海民宿','云南风温馨小屋',4999.00,'入住前12小时无条件退房','大床房','01.png','详情一',0);
INSERT INTO rent_house VALUES(null,'丽江民宿','近江渔村',5999.00,'入住前12小时无条件退房','大床房','02.png','详情二',0);
INSERT INTO rent_house VALUES(null,'香格里拉民宿','人间天堂',6999.00,'入住前12小时无条件退房','大床房','03.png','详情三',0);
INSERT INTO rent_house VALUES(null,'洱海民宿','云南风温馨小屋',4999.00,'入住前12小时无条件退房','大床房','01.png','详情一',0);
INSERT INTO rent_house VALUES(null,'丽江民宿','近江渔村',5999.00,'入住前12小时无条件退房','大床房','02.png','详情二',0);
INSERT INTO rent_house VALUES(null,'香格里拉民宿','人间天堂',6999.00,'入住前12小时无条件退房','大床房','03.png','详情三',0);
INSERT INTO rent_house VALUES(null,'洱海民宿','云南风温馨小屋',4999.00,'入住前12小时无条件退房','大床房','01.png','详情一',0);
INSERT INTO rent_house VALUES(null,'丽江民宿','近江渔村',5999.00,'入住前12小时无条件退房','大床房','02.png','详情二',0);
INSERT INTO rent_house VALUES(null,'香格里拉民宿','人间天堂',6999.00,'入住前12小时无条件退房','大床房','03.png','详情三',0);
#创建用户收藏民宿的表
CREATE TABLE rent_cart(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	user_id  INT,
	title VARCHAR(64)  NOT NULL,
	price DECIMAL(7,2) NOT NULL,
	house_id INT,
	FOREIGN KEY(house_id) REFERENCES rent_house(hid)
)
#INSERT INTO rent_cart VALUES(1,1,'洱海民宿',4999.00,1);