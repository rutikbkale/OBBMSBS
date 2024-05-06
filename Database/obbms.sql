/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 8.0.36 : Database - obbms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`obbms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `obbms`;

/*Table structure for table `admintb` */

DROP TABLE IF EXISTS `admintb`;

CREATE TABLE `admintb` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `admintb` */

insert  into `admintb`(`id`,`username`,`password`) values 
(1,'root','1234');

/*Table structure for table `blood_donation_list_tb` */

DROP TABLE IF EXISTS `blood_donation_list_tb`;

CREATE TABLE `blood_donation_list_tb` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `bloodgroup` varchar(10) DEFAULT NULL,
  `unit` int DEFAULT NULL,
  `age` int DEFAULT NULL,
  `disease` varchar(50) DEFAULT NULL,
  `reqdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) DEFAULT 'Pending',
  `donar_id` int DEFAULT NULL,
  `approval_date` timestamp NULL DEFAULT NULL,
  `rejection_reason` varchar(255) DEFAULT 'none',
  PRIMARY KEY (`id`),
  KEY `donar_id` (`donar_id`),
  CONSTRAINT `donar_id` FOREIGN KEY (`donar_id`) REFERENCES `donar_info_tb` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `blood_donation_list_tb` */

insert  into `blood_donation_list_tb`(`id`,`name`,`bloodgroup`,`unit`,`age`,`disease`,`reqdate`,`status`,`donar_id`,`approval_date`,`rejection_reason`) values 
(1,'John Snow','B+',350,25,'NA','2024-04-28 09:28:17','Approved',1,'2024-04-28 00:00:00','none'),
(2,'Rob Peterson','AB+',400,46,'high bp','2024-04-28 09:31:19','Rejected',2,NULL,'because of high blood pressure'),
(3,'Robert Barathian','O+',450,48,'NA','2024-04-28 09:35:49','Donated',3,'2024-04-28 00:00:00','none');

/*Table structure for table `blood_request_list_tb` */

DROP TABLE IF EXISTS `blood_request_list_tb`;

CREATE TABLE `blood_request_list_tb` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `bloodgroup` varchar(255) DEFAULT NULL,
  `unit` int DEFAULT NULL,
  `reqdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Pending',
  `patient_id` int DEFAULT NULL,
  `donar_id` int DEFAULT NULL,
  `approval_date` timestamp NULL DEFAULT NULL,
  `rejection_reason` varchar(255) DEFAULT 'none',
  PRIMARY KEY (`id`),
  KEY `donar_id2` (`donar_id`),
  KEY `patient_id` (`patient_id`),
  CONSTRAINT `donar_id2` FOREIGN KEY (`donar_id`) REFERENCES `donar_info_tb` (`id`),
  CONSTRAINT `patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient_info_tb` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `blood_request_list_tb` */

insert  into `blood_request_list_tb`(`id`,`name`,`age`,`reason`,`bloodgroup`,`unit`,`reqdate`,`status`,`patient_id`,`donar_id`,`approval_date`,`rejection_reason`) values 
(1,'John Doe',34,'For efficiency of rbc\'s','A+',350,'2024-04-28 09:26:22','Approved',1,NULL,'2024-04-28 00:00:00','none'),
(2,'Aarya Stark',27,'emergency','O-',300,'2024-04-28 09:46:34','Rejected',3,NULL,NULL,'stock not available'),
(3,'Alex Carpenter',42,'emergency','A-',350,'2024-04-28 09:47:24','Withdrawal',2,NULL,'2024-04-28 00:00:00','none');

/*Table structure for table `blood_stock_tb` */

DROP TABLE IF EXISTS `blood_stock_tb`;

CREATE TABLE `blood_stock_tb` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bloodgroup` varchar(10) NOT NULL,
  `unit` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `blood_stock_tb` */

insert  into `blood_stock_tb`(`id`,`bloodgroup`,`unit`) values 
(1,'A+',4650),
(2,'A-',4650),
(3,'B+',5000),
(4,'B-',5000),
(5,'O+',5450),
(6,'O-',5000),
(7,'AB+',5000),
(8,'AB-',5000);

/*Table structure for table `donar_info_tb` */

DROP TABLE IF EXISTS `donar_info_tb`;

CREATE TABLE `donar_info_tb` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fName` varchar(20) NOT NULL,
  `lName` varchar(20) NOT NULL,
  `address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dob` date NOT NULL,
  `bloodgroup` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mobno` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_mobno` (`mobno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `donar_info_tb` */

insert  into `donar_info_tb`(`id`,`fName`,`lName`,`address`,`dob`,`bloodgroup`,`mobno`,`password`) values 
(1,'John','Snow','Winterfell','1998-07-31','B+','7878565614','12'),
(2,'Rob','Peterson','Kingslanding','1978-01-23','AB+','5656787814','12'),
(3,'Robert','Barathian','DraganStrom','1975-08-04','O+','9012901290','12');

/*Table structure for table `patient_info_tb` */

DROP TABLE IF EXISTS `patient_info_tb`;

CREATE TABLE `patient_info_tb` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fName` varchar(20) NOT NULL,
  `lName` varchar(20) NOT NULL,
  `address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dob` date NOT NULL,
  `bloodgroup` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mobno` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_mobno` (`mobno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `patient_info_tb` */

insert  into `patient_info_tb`(`id`,`fName`,`lName`,`address`,`dob`,`bloodgroup`,`mobno`,`password`) values 
(1,'John','Doe','LA','1989-07-13','A+','7878565614','12'),
(2,'Alex','Carpenter','London','1981-05-09','A-','9012901290','12'),
(3,'Aarya','Stark','Bravos','1997-04-15','O-','9172475163','12');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
