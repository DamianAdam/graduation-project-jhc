/*
SQLyog Ultimate v10.00 Beta1
MySQL - 8.0.26 : Database - book
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`book` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `book`;

/*Table structure for table `t_book` */

DROP TABLE IF EXISTS `t_book`;

CREATE TABLE `t_book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sales` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `img_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'static/img/default.jpg',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `t_book` */

insert  into `t_book`(`id`,`name`,`price`,`author`,`sales`,`stock`,`img_path`) values (23,'Java从入门到精通','25.90','张玉宏',11,989,'static/img/books/java-rumengdaojintong-zhangyuhong.jpg'),(24,'数据结构与算法','78.50','严蔚敏',34,966,'static/img/books/da-yanweimin.jpg'),(25,'MySQL从入门到精通','74.80','明日科技',12,988,'static/img/books/MySQL从入门到精通.png'),(26,'Python编程-从入门到实践','66.80','Eric Matthes',556,1000,'static/img/books/Python编程-从入门到实践.png'),(27,'C++编程思想','95.70','Bruce Eckel、Chuck Allison\n',681,1000,'static/img/books/C++编程思想.png'),(28,'Hive编程指南','34.50','Edward Capriolo',15,985,'static/img/books/Hive编程指南.png'),(29,'Scala和Spark大数据分析','66.50','雷扎尔·卡里姆',87,913,'static/img/books/Scala和Spark大数据分析.png'),(30,'Java编程思想','99.50','埃克尔',75,925,'static/img/books/Java编程思想.png'),(31,'疯狂H5+C3+JS讲义','41.00','李刚',216,1000,'static/img/books/疯狂HTML5+CSS3+JavaScript讲义.png'),(32,'Cocos2d-x游戏开发','55.80','刘克男',95,1000,'static/img/books/Cocos2d-x游戏开发.png'),(33,'C语言程序设计','28.00','谭浩强',156,1000,'static/img/books/C语言程序设计.png'),(34,'Lua程序设计','44.00','Roberto,Ierusalimschy',841,1000,'static/img/books/Lua程序设计.png'),(36,'机器学习 西瓜书','66.00','周志华',24,1000,'static/img/books/机器学习-西瓜书.png'),(37,'操作系统导论','49.50','雷姆兹·H.阿帕希杜塞尔',564,1000,'static/img/books/操作系统导论.jpg'),(38,'数据结构与算法分析','173.15','封大神',59,999,'static/img/books/数据结构与算法分析-Java语言描述.png'),(39,'UNIX环境高级编程','118.30','W.理查德·史蒂文斯',11,989,'static/img/books/UNIX环境高级编程.png'),(40,'JavaScript语言精粹','33.10','道格拉斯·克罗克福德',522,1000,'static/img/books/JavaScript语言精粹.png'),(41,'大话设计模式','24.00','程杰',653,1000,'static/img/books/大话设计模式.png'),(42,'Hadoop大数据技术开发实战','49.50','张伟洋',896,1000,'static/img/books/Hadoop大数据技术开发实战.png'),(46,'计算机网络 自顶向下方法','44.50','詹姆斯·F.库罗斯',189,999,'static/img/books/计算机网络-自顶向下方法.png');

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单id',
  `create_time` datetime DEFAULT '2020-01-01 00:00:00' COMMENT '创建时间',
  `price` decimal(11,2) DEFAULT NULL COMMENT '订单价格',
  `status` tinyint DEFAULT NULL COMMENT '订单状态,0未发货,1已发货,2已收货',
  `user_id` int DEFAULT NULL COMMENT '所属的用户id',
  PRIMARY KEY (`order_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='订单表';

/*Data for the table `t_order` */

insert  into `t_order`(`order_id`,`create_time`,`price`,`status`,`user_id`) values ('16360997619564','2021-11-05 16:09:22','6395.50',2,4),('16361024784194','2021-11-05 16:54:38','4596.80',2,4),('16362871119234','2021-11-07 20:11:52','1549.25',0,4),('16365994816754','2021-11-11 10:58:02','1080.90',2,4),('16365995899624','2021-11-11 10:59:50','78.50',2,4),('163661377901311','2021-11-11 14:56:19','4574.00',2,11),('16384106695694','2021-12-02 10:04:30','74.80',1,4);

/*Table structure for table `t_order_item` */

DROP TABLE IF EXISTS `t_order_item`;

CREATE TABLE `t_order_item` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '订单项id(主键)',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称',
  `count` int DEFAULT NULL COMMENT '商品数量',
  `price` decimal(11,2) DEFAULT NULL COMMENT '商品单价',
  `total_price` decimal(11,2) DEFAULT NULL COMMENT '商品总价',
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '所属的订单id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  CONSTRAINT `t_order_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `t_order` (`order_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='订单项表';

/*Data for the table `t_order_item` */

insert  into `t_order_item`(`id`,`name`,`count`,`price`,`total_price`,`order_id`) values (105,'数据结构与算法',19,'78.50','1491.50','16360997619564'),(106,'Hive编程指南',13,'34.50','448.50','16360997619564'),(107,'Scala和Spark大数据分析',67,'66.50','4455.50','16360997619564'),(108,'MySQL从入门到精通',1,'74.80','74.80','16361024784194'),(109,'Java编程思想',45,'99.50','4477.50','16361024784194'),(110,'计算机网络 自顶向下方法',1,'44.50','44.50','16361024784194'),(111,'数据结构与算法分析',1,'173.15','173.15','16362871119234'),(112,'UNIX环境高级编程',11,'118.30','1301.30','16362871119234'),(113,'MySQL从入门到精通',1,'74.80','74.80','16362871119234'),(114,'Java从入门到精通',1,'25.90','25.90','16365994816754'),(115,'数据结构与算法',13,'78.50','1020.50','16365994816754'),(116,'Hive编程指南',1,'34.50','34.50','16365994816754'),(117,'数据结构与算法',1,'78.50','78.50','16365995899624'),(118,'Java从入门到精通',10,'25.90','259.00','163661377901311'),(119,'Scala和Spark大数据分析',20,'66.50','1330.00','163661377901311'),(120,'Java编程思想',30,'99.50','2985.00','163661377901311'),(121,'MySQL从入门到精通',1,'74.80','74.80','16384106695694');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`username`,`password`,`email`) values (4,'admin','admin','admin@qq.com'),(6,'adam1224','123123','123@123.com'),(7,'as1245','123123','123@112.com'),(8,'12312','123123aa','123123@qq.com'),(9,'sq_123','sq_123','123@qq.com'),(10,'云云老婆','123','1234@qq.com'),(11,'xxy1224','xxy1224','850340745@qq.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
