/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.25 : Database - bookstore
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bookstore` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bookstore`;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activeCode` varchar(6) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `introduce` varchar(100) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `registTime` datetime DEFAULT NULL,
  `role` varchar(2) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `telephone` varchar(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`activeCode`,`email`,`gender`,`introduce`,`password`,`registTime`,`role`,`state`,`telephone`,`updateTime`,`username`) values (1,NULL,'13688888888@qq.com','男','测试数据','1','2019-05-10 21:06:58','3',0,'15866666666','2019-05-10 23:38:27','test1'),(3,NULL,'123156464@qq.com','女','','222222','2019-05-11 09:48:37','3',0,'18256986985','2019-05-14 19:06:50','test2'),(4,NULL,'13688888888@qq.com','男','','888888','2019-05-13 10:36:16','3',0,'18256986985',NULL,'test4'),(10,NULL,'123156464@qq.com','男','','333333','2019-05-14 18:16:59','3',0,'15866666666',NULL,'test3');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
