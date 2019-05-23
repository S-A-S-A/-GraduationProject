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

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` varchar(10) NOT NULL,
  `creatTime` datetime DEFAULT NULL,
  `level` varchar(2) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`id`,`creatTime`,`level`,`password`,`phone`,`updateTime`,`username`) values ('1','2019-06-01 21:08:12','1','1','18888888','2019-05-10 21:08:38','hss'),('71d8ade8','2019-05-15 10:34:11','2','000000','13388317054','2019-05-15 10:34:11','test'),('be83c602','2019-05-10 21:27:13','2','1','13666668888','2019-05-10 21:27:13','admin1'),('db8bda01','2019-05-11 09:50:07','2','123456','13666668888','2019-05-11 09:50:07','admin2');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
