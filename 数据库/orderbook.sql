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

/*Table structure for table `orderbook` */

DROP TABLE IF EXISTS `orderbook`;

CREATE TABLE `orderbook` (
  `id` bigint(20) NOT NULL,
  `gmtCreate` datetime DEFAULT NULL,
  `bookId` varchar(20) DEFAULT NULL,
  `orderId` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKknrf821u5g977v5bskd0eio8k` (`bookId`),
  KEY `FKcmjtcrt1ieob39px5u91cfqfs` (`orderId`),
  CONSTRAINT `FKcmjtcrt1ieob39px5u91cfqfs` FOREIGN KEY (`orderId`) REFERENCES `t_order` (`id`),
  CONSTRAINT `FKknrf821u5g977v5bskd0eio8k` FOREIGN KEY (`bookId`) REFERENCES `bookinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orderbook` */

insert  into `orderbook`(`id`,`gmtCreate`,`bookId`,`orderId`) values (6,'2019-05-11 00:03:45','11387298','5a837cc3'),(7,'2019-05-11 00:03:45','bf2ce24e','5a837cc3'),(19,'2019-05-13 10:39:39','2f47134d','625a2af7'),(20,'2019-05-14 18:09:46','2f47134d','0b097096'),(24,'2019-05-14 20:36:42','f2117311','8a6cb192'),(25,'2019-05-15 02:13:48','bf2ce24e','68fe4220'),(26,'2019-05-15 10:43:23','11387298','aff80956'),(27,'2019-05-15 10:43:23','fa5bead8','aff80956'),(28,'2019-05-15 10:43:23','d161a153','aff80956'),(29,'2019-05-15 10:43:23','bf2ce24e','aff80956'),(30,'2019-05-15 10:43:23','021991d9','aff80956');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
