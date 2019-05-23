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

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `id` varchar(10) NOT NULL,
  `address` varchar(20) DEFAULT NULL,
  `creatDate` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `receiverName` varchar(12) DEFAULT NULL,
  `receiverPhone` varchar(11) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  `sumCast` double DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn1oo1sx1svg78ibr8u541941o` (`user_id`),
  CONSTRAINT `FKn1oo1sx1svg78ibr8u541941o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_order` */

insert  into `t_order`(`id`,`address`,`creatDate`,`quantity`,`receiverName`,`receiverPhone`,`status`,`sumCast`,`updateDate`,`user_id`) values ('0b097096','sichuan','2019-05-14 18:09:46',1,'ss','18066669999','1',37.44,'2019-05-14 18:09:53',4),('5a837cc3','四川攀枝花学院','2019-05-11 00:03:45',2,'黄莎莎','18066669999','0',122,NULL,NULL),('625a2af7','四川攀枝花学院','2019-05-13 10:39:39',1,'张三','18066669999','1',37.44,'2019-05-13 10:40:48',4),('68fe4220','sichuan1111','2019-05-15 02:13:48',1,'dsf','18066669999','0',94,NULL,3),('8a6cb192','sichuan1111','2019-05-14 20:36:42',1,'dsf','18066669999','1',88.5,'2019-05-14 20:37:04',3),('aff80956','四川攀枝花学院','2019-05-15 10:43:23',6,'黄莎莎','18066669999','1',312.7,'2019-05-15 10:43:49',3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
