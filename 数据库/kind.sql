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

/*Table structure for table `kind` */

DROP TABLE IF EXISTS `kind`;

CREATE TABLE `kind` (
  `id` varchar(20) NOT NULL,
  `creatTime` datetime DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `kind` */

insert  into `kind`(`id`,`creatTime`,`status`,`type`,`updateTime`) values ('0c4f','2019-05-10 21:45:14','1','考试','2019-05-11 10:18:46'),('0c5d','2019-05-10 23:58:13','1','生活百科','2019-05-11 10:19:33'),('15dd','2019-05-11 10:20:09','0','社科',NULL),('237a','2019-05-11 10:21:28','1','管理经营',NULL),('4a0c','2019-05-10 21:28:16','1','计算机',NULL),('8552','2019-05-11 10:19:50','0','学术',NULL),('a1dd','2019-05-11 10:30:29','1','经济',NULL),('afae','2019-05-10 23:58:55','1','科技',NULL),('b027','2019-05-10 21:37:39','1','少儿图书',NULL),('b948','2019-05-11 10:19:04','1','励志',NULL),('cc78','2019-05-10 23:58:28','1','生活',NULL),('d28d','2019-05-10 23:57:55','1','艺术','2019-05-11 10:16:46'),('d433','2019-05-13 10:32:29','0','1',NULL),('d927','2019-05-10 21:40:26','1','小说',NULL),('f63f','2019-05-11 10:20:27','1','英文原版','2019-05-11 10:59:34');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
