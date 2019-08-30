-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2019-08-30 02:42:48
-- 服务器版本： 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rh`
--

-- --------------------------------------------------------

--
-- 表的结构 `rent_collection`
--

CREATE TABLE `rent_collection` (
  `id` int(11) NOT NULL,
  `hid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `housename` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `rent_collection`
--

INSERT INTO `rent_collection` (`id`, `hid`, `uid`, `housename`, `price`, `pic`) VALUES
(43, 4, 1, '洱海一民宿', '4009.00', '04.jpg'),
(44, 3, 1, '香格里拉民宿', '6999.00', '03.jpg'),
(45, 2, 1, '丽江民宿', '5999.00', '02.jpg'),
(46, 1, 1, '洱海民宿', '4999.00', '01.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `rent_detail`
--

CREATE TABLE `rent_detail` (
  `did` int(11) NOT NULL,
  `title` varchar(32) DEFAULT NULL,
  `price` int(32) DEFAULT NULL,
  `rent_mode` varchar(32) DEFAULT NULL,
  `area` varchar(16) DEFAULT NULL,
  `layout` varchar(128) DEFAULT NULL,
  `remark` varchar(32) DEFAULT NULL,
  `Suitable` varchar(32) DEFAULT NULL,
  `bed` varchar(32) DEFAULT NULL,
  `avatar` varchar(32) DEFAULT NULL,
  `uname` varchar(128) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `img_url` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `rent_detail`
--

INSERT INTO `rent_detail` (`did`, `title`, `price`, `rent_mode`, `area`, `layout`, `remark`, `Suitable`, `bed`, `avatar`, `uname`, `type`, `img_url`) VALUES
(1, '江汉路步行街/地铁3分钟/一室一厅小公寓', 239, '整套出租', '50m2', '1室1厅1厨1阳台', '可做饭', '可住2人', '共1张床· 可加床', '01.jpg', '早茶月光公寓', '民宿自营', '01.jpg'),
(2, '江汉路步行街/地铁3分钟/一室一厅小公寓', 469, '整套出租', '50m2', '1室1厅1厨1阳台', '可做饭', '可住2人', '共1张床· 可加床', '01.jpg', '早茶月光公寓', '民宿自营', '02.jpg'),
(3, '江汉路步行街/地铁3分钟/一室一厅小公寓', 229, '整套出租', '50m2', '1室1厅1厨1阳台', '可做饭', '可住2人', '共1张床· 可加床', '01.jpg', '早茶月光公寓', '民宿自营', '03.jpg'),
(4, '江汉路步行街/地铁3分钟/一室一厅小公寓', 198, '整套出租', '50m2', '1室1厅1厨1阳台', '可做饭', '可住2人', '共1张床· 可加床', '01.jpg', '早茶月光公寓', '民宿自营', '04.jpg'),
(5, '江汉路步行街/地铁3分钟/一室一厅小公寓', 369, '整套出租', '50m2', '1室1厅1厨1阳台', '可做饭', '可住2人', '共1张床· 可加床', '01.jpg', '早茶月光公寓', '民宿自营', '05.jpg'),
(6, '江汉路步行街/地铁3分钟/一室一厅小公寓', 468, '整套出租', '50m2', '1室1厅1厨1阳台', '可做饭', '可住2人', '共1张床· 可加床', '01.jpg', '早茶月光公寓', '民宿自营', '06.jpg'),
(7, '江汉路步行街/地铁3分钟/一室一厅小公寓', 322, '整套出租', '50m2', '1室1厅1厨1阳台', '可做饭', '可住2人', '共1张床· 可加床', '01.jpg', '早茶月光公寓', '民宿自营', '07.jpg'),
(8, '江汉路步行街/地铁3分钟/一室一厅小公寓', 255, '整套出租', '50m2', '1室1厅1厨1阳台', '可做饭', '可住2人', '共1张床· 可加床', '01.jpg', '早茶月光公寓', '民宿自营', '08.jpg'),
(9, '江汉路步行街/地铁3分钟/一室一厅小公寓', 269, '整套出租', '50m2', '1室1厅1厨1阳台', '可做饭', '可住2人', '共1张床· 可加床', '01.jpg', '早茶月光公寓', '民宿自营', '09.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `rent_house`
--

CREATE TABLE `rent_house` (
  `hid` int(11) NOT NULL,
  `housename` varchar(64) NOT NULL,
  `title` varchar(128) NOT NULL,
  `price` decimal(7,2) NOT NULL DEFAULT '6999.00',
  `promise` varchar(256) DEFAULT NULL,
  `spec` varchar(32) DEFAULT NULL,
  `pic` varchar(128) NOT NULL,
  `detail` varchar(3000) DEFAULT NULL,
  `href` varchar(300) DEFAULT NULL,
  `isRented` smallint(6) NOT NULL,
  `house_area` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `rent_house`
--

INSERT INTO `rent_house` (`hid`, `housename`, `title`, `price`, `promise`, `spec`, `pic`, `detail`, `href`, `isRented`, `house_area`) VALUES
(1, '洱海民宿', '云南风温馨小屋', '4999.00', '入住前12小时无条件退房', '大床房', '01.jpg', '详情一', 'house_details.html?lid=1', 0, '西湖区'),
(2, '丽江民宿', '近江渔村', '5999.00', '入住前12小时无条件退房', '大床房', '02.jpg', '详情二', 'house_details.html?lid=2', 0, '滨江区'),
(3, '香格里拉民宿', '人间天堂', '6999.00', '入住前12小时无条件退房', '大床房', '03.jpg', '详情三', 'house_details.html?lid=3', 0, '上城区'),
(4, '洱海一民宿', '云南风温馨小屋', '4009.00', '入住前12小时无条件退房', '大床房', '04.jpg', '详情四', 'house_details.html?lid=4', 0, '下城区'),
(5, '丽江一民宿', '近江渔村', '5009.00', '入住前12小时无条件退房', '大床房', '05.jpg', '详情五', 'house_details.html?lid=5', 0, '萧山区'),
(6, '香格里拉一民宿', '人间天堂', '6009.00', '入住前12小时无条件退房', '大床房', '06.jpg', '详情六', 'house_details.html?lid=6', 1, '富阳区'),
(7, '洱海二民宿', '云南风温馨小屋', '3899.00', '入住前12小时无条件退房', '大床房', '07.jpg', '详情七', 'house_details.html?lid=7', 0, '千岛湖'),
(8, '丽江二民宿', '近江渔村', '5900.00', '入住前12小时无条件退房', '大床房', '08.jpg', '详情八', 'house_details.html?lid=8', 0, '江干区'),
(9, '香格里拉二民宿', '人间天堂', '6000.00', '入住前12小时无条件退房', '大床房', '01.png', '详情九', 'house_details.html?lid=9', 0, '西湖区');

-- --------------------------------------------------------

--
-- 表的结构 `rent_user`
--

CREATE TABLE `rent_user` (
  `uid` smallint(6) NOT NULL,
  `uname` varchar(32) DEFAULT NULL,
  `upwd` varchar(32) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `avatar` varchar(128) DEFAULT NULL,
  `user_name` varchar(32) DEFAULT NULL,
  `gender` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `rent_user`
--

INSERT INTO `rent_user` (`uid`, `uname`, `upwd`, `phone`, `avatar`, `user_name`, `gender`) VALUES
(1, 'dingding', 'e10adc3949ba59abbe56e057f20f883e', '15658150402', 'img/01.png', '林钉钉', 0),
(2, 'tom', 'e10adc3949ba59abbe56e057f20f883e', '13612345679', 'img/01.png', '汤姆', 0);

-- --------------------------------------------------------

--
-- 表的结构 `rh_order_detail`
--

CREATE TABLE `rh_order_detail` (
  `did` int(11) NOT NULL,
  `order_id` int(32) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `img_url` varchar(16) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `inyear` int(11) DEFAULT NULL,
  `inmonth` int(11) DEFAULT NULL,
  `indate` int(11) DEFAULT NULL,
  `outyear` int(11) DEFAULT NULL,
  `outmonth` int(11) DEFAULT NULL,
  `outdate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `rh_order_detail`
--

INSERT INTO `rh_order_detail` (`did`, `order_id`, `title`, `img_url`, `price`, `inyear`, `inmonth`, `indate`, `outyear`, `outmonth`, `outdate`) VALUES
(1, 2147483647, '江汉路步行街/地铁3分钟/一室一厅小公寓', '02.jpg', 469, 2019, 8, 27, 2019, 8, 29),
(2, 2147483647, '江汉路步行街/地铁3分钟/一室一厅小公寓', '04.jpg', 198, 2019, 8, 28, 2019, 10, 29),
(3, 2147483647, '江汉路步行街/地铁3分钟/一室一厅小公寓', '06.jpg', 468, 0, 0, 0, 0, 0, 0),
(4, 1626820653, '江汉路步行街/地铁3分钟/一室一厅小公寓', '04.jpg', 198, 0, 0, 0, 0, 0, 0),
(5, 2147483647, '江汉路步行街/地铁3分钟/一室一厅小公寓', '02.jpg', 469, 2019, 8, 29, 2019, 9, 29),
(6, 2147483647, '江汉路步行街/地铁3分钟/一室一厅小公寓', '03.jpg', 229, 0, 0, 0, 0, 0, 0),
(7, 2147483647, '江汉路步行街/地铁3分钟/一室一厅小公寓', '02.jpg', 469, 0, 0, 0, 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rent_collection`
--
ALTER TABLE `rent_collection`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `rent_user`
--
ALTER TABLE `rent_user`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `uname` (`uname`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `rh_order_detail`
--
ALTER TABLE `rh_order_detail`
  ADD PRIMARY KEY (`did`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `rent_collection`
--
ALTER TABLE `rent_collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- 使用表AUTO_INCREMENT `rh_order_detail`
--
ALTER TABLE `rh_order_detail`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
