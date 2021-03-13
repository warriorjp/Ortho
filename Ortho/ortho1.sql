-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: ortho1
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admin` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','1234');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docregistration`
--

DROP TABLE IF EXISTS `docregistration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `docregistration` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Clinic` varchar(100) NOT NULL,
  `Dob` varchar(45) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Specialization` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Contact` varchar(10) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Confirm_Password` varchar(45) NOT NULL,
  PRIMARY KEY (`did`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docregistration`
--

LOCK TABLES `docregistration` WRITE;
/*!40000 ALTER TABLE `docregistration` DISABLE KEYS */;
INSERT INTO `docregistration` VALUES (1,'Gaurav Nagoshe','Danger Clinic','1996-09-23','male','DBMS','gon23091996@gmail.com','7758983024','Gaurav@123','Gaurav@123'),(2,'Abhijeet Salgar','Quiesta','2019-02-28','male','ortho','abhijeetsalgar5@gmail.com','9561008143','ABHIjeet@1990','ABHIjeet@1990'),(3,'Chetan Raina','Cyborg','1997-06-05','male','Densyisa','hechosverse96@gmail.com','7758983024','1234','1234'),(4,'Manjun Manen','Manga','1992-02-04','male','Densyisa','manju4496ka@gmail.com','8310182354','12365','12365'),(5,'Gayatri','City Hospital','1996-12-20','female','nbnbnb','gayatrikashid11@gmail.com','9373501468','123456','123456'),(6,'Sneha','City Hospital','1997-02-20','female','Densyisa','gayatrikashid12@gmail.com','9373501468','123456','123456'),(11,'Gaurav','City Hospital','1990-04-06','male','Densyisa','gashgsahgs@gmail.com','7589835265','1234','1234'),(12,'sadagd','hdhsadhj','1996-02-02','male','sgadhg','asghasdgh@gmail.com','4578963214','1234','1234'),(13,'Gaasgh','avsvs','1896-02-02','male','Densyisa','gshgasg@gmail.com','5689235689','asdf','asdf'),(14,'Gaasgh','avsvs','1896-02-02','male','Densyisa','gaurav23091996@gmail.com','5689235689','4561','4561'),(15,'shri','bdvb','1236-04-12','male','gvg','hggh@gmail.com','7758983024','1234','1234');
/*!40000 ALTER TABLE `docregistration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fileupload`
--

DROP TABLE IF EXISTS `fileupload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fileupload` (
  `did` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `treatment` varchar(100) DEFAULT NULL,
  `image` varchar(600) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fileupload`
--

LOCK TABLES `fileupload` WRITE;
/*!40000 ALTER TABLE `fileupload` DISABLE KEYS */;
INSERT INTO `fileupload` VALUES (0,0,NULL,'2016-22-10--22-13-33.jpeg'),(0,0,NULL,'2017-18-2--13-13-56.jpeg'),(1,1,NULL,'66.png'),(1,1,NULL,'AMAZON RATES.png'),(1,1,NULL,'BallSmashers.wav'),(1,1,NULL,'66.png'),(1,1,NULL,'AMAZON RATES.png'),(1,1,NULL,'AMAZON RATES.png'),(1,1,NULL,'66.png'),(1,1,NULL,'66.png'),(1,1,NULL,'66.png'),(1,1,NULL,'66.png'),(1,1,NULL,'AMAZON RATES.png'),(1,1,NULL,'66.png'),(1,1,NULL,'c&c++diff.png'),(1,1,NULL,'66.png'),(1,1,NULL,'66.png'),(1,1,NULL,'3.jpg'),(1,1,'Root Canal','4.jpg');
/*!40000 ALTER TABLE `fileupload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `patient` (
  `Pid` int(20) NOT NULL AUTO_INCREMENT,
  `Did` varchar(45) NOT NULL,
  `Pname` varchar(100) NOT NULL,
  `age` varchar(3) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `bgroup` varchar(5) NOT NULL,
  `Pmobile` varchar(10) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Address` varchar(200) NOT NULL,
  PRIMARY KEY (`Pid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'1','Rahul Kotha','24','male','AB+','7769854123','hechosverse@gmail.com','Pune'),(2,'1','Gaurav Nagoshe','23','male','AB+','3652987410','gon23091996@gmail.com','ssvfgvshvhsg'),(3,'5','Ashwini','23','female','O+','8983746621','gayatrikashid11@gmail.com','ABC chauk, Pune'),(4,'5','Suresh','28','male','A-','8983567321','gon23091996@gmail.com','Deccan Pune');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `status` (
  `did` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='																																																													';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES ('1',1),('2',0),('3',0),('4',0),('5',1),('6',0),('7',0),('8',0),('abhijeetsalgar5@gmail.com	',0),('gayatrikashid11@gmail.com	',0),('gon23091996@gmail.com	',0),('hechosverse96@gmail.com	',0),('hggh@gmail.com',1),('manju4496ka@gmail.com	',0);
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `treatment` (
  `Did` int(20) NOT NULL,
  `Pid` int(20) NOT NULL,
  `Pname` varchar(100) NOT NULL,
  `Start_date` date NOT NULL,
  `Treatment` varchar(100) NOT NULL,
  `Total_fees` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment`
--

LOCK TABLES `treatment` WRITE;
/*!40000 ALTER TABLE `treatment` DISABLE KEYS */;
INSERT INTO `treatment` VALUES (1,1,'Rahul Kotha','2019-02-22','Root Canal','15000'),(1,1,'Rahul Kotha','2019-02-22','Root Canal','15000'),(1,1,'Rahul Kotha','2019-02-22','Root Canal','15000'),(1,2,'Gaurav Nagoshe','2019-02-19','Cavity','15000'),(1,2,'Gaurav Nagoshe','2019-02-19','Cavity','15000'),(5,3,'Ashwini','2019-03-28','Root canel','1000'),(5,3,'Ashwini','2019-03-21','Golden teeth','50000'),(1,1,'Rahul Kotha','2019-04-04','Tooth Brush','12000');
/*!40000 ALTER TABLE `treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment_details`
--

DROP TABLE IF EXISTS `treatment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `treatment_details` (
  `Pid` int(20) NOT NULL,
  `Pname` varchar(100) NOT NULL,
  `treatment` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `Diagnosis` varchar(100) NOT NULL,
  `medicine` varchar(200) NOT NULL,
  `progress` varchar(100) NOT NULL,
  `nextdate` date NOT NULL,
  `paid_fees` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment_details`
--

LOCK TABLES `treatment_details` WRITE;
/*!40000 ALTER TABLE `treatment_details` DISABLE KEYS */;
INSERT INTO `treatment_details` VALUES (1,'Rahul Kotha','','2019-02-26','ahgahag','vhvahsvdhv','sbjvdjvhhjvwdj','2019-02-27','5000'),(1,'Rahul Kotha','Root Canal','2019-02-20','shghga','bsajsjh','niwiwebciub','2019-02-28','5000'),(1,'Rahul Kotha','Root Canal','2019-02-04','djadjajdkasdj','jhgjhgh','bjhvjhvjhv','2019-02-28','4000'),(1,'Rahul Kotha','Root Canal','2019-02-05','','','','2019-02-08','3000'),(1,'Rahul Kotha','Root Canal','2019-02-20','','','','2019-02-21','3000'),(1,'Rahul Kotha','Root Canal','2019-02-06','','','','2019-02-13','2000'),(1,'Rahul Kotha','Root Canal','2019-02-08','','','','2019-02-09','2000'),(2,'Gaurav Nagoshe','Cavity','2019-03-30','sahghag','jsagdhagsjh','sagjgdsagdha','2019-04-01','2000'),(2,'Gaurav Nagoshe','Cavity','2019-03-30','sahghag','jsagdhagsjh','sagjgdsagdha','2019-04-01','2000');
/*!40000 ALTER TABLE `treatment_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-03 15:53:47
