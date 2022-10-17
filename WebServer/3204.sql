-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: clinic_db
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL,
  `username` varchar(500) DEFAULT NULL,
  `loginid` varchar(30) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(500) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `dob` varchar(45) DEFAULT NULL,
  `mobileno` varchar(45) DEFAULT NULL,
  `addr` varchar(45) DEFAULT NULL,
  `notes` varchar(45) DEFAULT NULL,
  `created_on` varchar(45) DEFAULT NULL,
  `updated_on` varchar(45) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `last_login` date DEFAULT NULL,
  `delete_status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'','ndbhalerao91@gmail.com','aa7f019c326413d5b8bcad4314228bcd33ef557f5d81c7cc977f7728156f4357','Nikhil Bhalerao','admin','profile.jpg','Male','2018-11-26','9423979393','Maharashtra India','admin panel','2018-11-26','2019-10-15',1,'0000-00-00',NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `appointmentid` int DEFAULT NULL,
  `appointmenttype` varchar(45) DEFAULT NULL,
  `patientid` int DEFAULT NULL,
  `roomid` int DEFAULT NULL,
  `departmentid` int DEFAULT NULL,
  `appointmentdate` date DEFAULT NULL,
  `appointmenttime` varchar(500) DEFAULT NULL,
  `doctorid` int DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `app_reason` varchar(500) DEFAULT NULL,
  `delete_status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (4,'<blank>',1,0,2,'2020-05-29','15:00:00',1,'Approved','Reason of appointment',0),(2,'<blank>',1,0,2,'2020-05-27','10:00:00',1,'Approved','Reason of appointment',0),(3,'<blank>',1,0,1,'2020-05-26','11:11:00',1,'Inactive','Reason',0),(4,'<blank>',1,0,2,'2020-05-29','15:00:00',1,'Approved','Reason of appointment',0);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing_records`
--

DROP TABLE IF EXISTS `billing_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_records` (
  `billingservice_id` int NOT NULL,
  `billingid` int DEFAULT NULL,
  `bill_type_id` int DEFAULT NULL,
  `bill_type` varchar(250) DEFAULT NULL,
  `bill_amount` float DEFAULT NULL,
  `bill_date` date DEFAULT NULL,
  `status` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`billingservice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_records`
--

LOCK TABLES `billing_records` WRITE;
/*!40000 ALTER TABLE `billing_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `departmentid` int NOT NULL,
  `departmentname` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `delete_status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`departmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'ICU department','ICU department for people with serious illness','Active','0'),(2,'Neurology department','neurology department for treating diseases of nervous system','Active','0');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doctorid` int NOT NULL,
  `doctorname` varchar(45) DEFAULT NULL,
  `mobileno` varchar(45) DEFAULT NULL,
  `departmentid` int DEFAULT NULL,
  `loginid` varchar(45) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `education` varchar(45) DEFAULT NULL,
  `experience` float DEFAULT NULL,
  `consultancy_charge` float DEFAULT NULL,
  `delete_status` int DEFAULT NULL,
  PRIMARY KEY (`doctorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Dr. Akash Ahire','9423979339',1,'akash@gmail.com','bbcff4db4d8057800d59a68224efd87e545fa1512dfc3ef68298283fbb3b6358','Active','MD',3,200,0);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manage_website`
--

DROP TABLE IF EXISTS `manage_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manage_website` (
  `id` int NOT NULL,
  `business_email` varchar(600) DEFAULT NULL,
  `business_web` varchar(500) DEFAULT NULL,
  `portal_addr` varchar(600) DEFAULT NULL,
  `addr` varchar(600) DEFAULT NULL,
  `curr_sym` varchar(600) DEFAULT NULL,
  `curr_position` varchar(500) DEFAULT NULL,
  `front_end_en` varchar(500) DEFAULT NULL,
  `date_format` date DEFAULT NULL,
  `def_tax` varchar(500) DEFAULT NULL,
  `logo` varchar(500) DEFAULT NULL,
  `business_name` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manage_website`
--

LOCK TABLES `manage_website` WRITE;
/*!40000 ALTER TABLE `manage_website` DISABLE KEYS */;
INSERT INTO `manage_website` VALUES (1,'mayuri.infospace@gmail.com','#','#','<p>Maharashtra, India</p>\\r\\n','$','right','0','0000-00-00','0.20','logo for hospital system.jpg','Mayuri K');
/*!40000 ALTER TABLE `manage_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patientid` int NOT NULL,
  `patientname` varchar(45) DEFAULT NULL,
  `admissiondate` date DEFAULT NULL,
  `admissiontime` varchar(500) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `mobileno` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `pincode` varchar(45) DEFAULT NULL,
  `bloodgroup` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `delete_status` varchar(45) DEFAULT NULL,
  `loginid` varchar(50) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`patientid`),
  UNIQUE KEY `patientid_UNIQUE` (`patientid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Atul Petkar','2020-05-25','11:00:00','nashik, maharashtra','9423979339','nashik','1234','B+','Male','1995-07-25','Active','0','atul@gmail.com','bbcff4db4d8057800d59a68224efd87e545fa1512dfc3ef68298283fbb3b6358');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-14  2:58:40