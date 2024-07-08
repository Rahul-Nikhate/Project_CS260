CREATE DATABASE  IF NOT EXISTS `faculty_recruitment` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `faculty_recruitment`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: faculty_recruitment
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applications` (
  `Application_Number` int unsigned NOT NULL AUTO_INCREMENT,
  `Email` varchar(256) NOT NULL,
  `Password` varchar(256) NOT NULL,
  `Post` varchar(256) DEFAULT NULL,
  `Department` varchar(256) DEFAULT NULL,
  `Username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Application_Number`),
  UNIQUE KEY `Application Number_UNIQUE` (`Application_Number`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,'xyz@gmail.com','asdf','Assistant Professor','Mathematics','Test'),(2,'k@g.c','123','Professor','Electrical','abc'),(3,'a@b.c','123','Associate Professor','Mathematics','jbn'),(4,'harshkumar3.14@gmail','123','Assistant Professor','Electrical','harsh'),(5,'harshkumar3.14@gmail.com','123','Professor','CSE','harsh'),(7,'harshkumar3.14@outlook.com','123','Associate Professor','CSE','harshkumar'),(8,'rahul3366@gmail.com','123','Associate Professor','Physics','rahul chandu'),(9,'rahul29@gmail.com','123','Professor','CSE','rahul');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awards` (
  `Application_Number` int unsigned NOT NULL,
  `Award_Name` varchar(255) NOT NULL,
  `Presenter` varchar(255) NOT NULL,
  `Year` int NOT NULL,
  PRIMARY KEY (`Application_Number`),
  CONSTRAINT `ApplicationToAwards` FOREIGN KEY (`Application_Number`) REFERENCES `applications` (`Application_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
INSERT INTO `awards` VALUES (3,'rfecbxjkd','fvecbhdknw',1234),(5,'Lila Corwin','Commodi possimus accusantium voluptatibus quia quibusdam eaque.',2023),(7,'Lila Corwin','Commodi possimus accusantium voluptatibus quia quibusdam eaque.',2023),(8,'Matt McDermott','Praesentium fuga sint.',1234);
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_add`
--

DROP TABLE IF EXISTS `edu_add`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edu_add` (
  `Application_Number` int unsigned NOT NULL,
  `University` varchar(255) DEFAULT NULL,
  `Degree` varchar(255) DEFAULT NULL,
  `Branch` varchar(255) DEFAULT NULL,
  `Year_Of_Joining` int DEFAULT NULL,
  `Year_Of_Completion` int DEFAULT NULL,
  `Duration` int DEFAULT NULL,
  `Percentage` decimal(10,2) DEFAULT NULL,
  `Division` varchar(255) DEFAULT NULL,
  KEY `Application_Nea_idx` (`Application_Number`),
  CONSTRAINT `Application_Nea` FOREIGN KEY (`Application_Number`) REFERENCES `applications` (`Application_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_add`
--

LOCK TABLES `edu_add` WRITE;
/*!40000 ALTER TABLE `edu_add` DISABLE KEYS */;
INSERT INTO `edu_add` VALUES (1,'j','n','e',3,5,4,1.00,' 1'),(1,'asd','gld','ocid',77,88,11,90.00,'f'),(2,'9','8','1',1,1,1,1.00,'7'),(3,'jacn ','chunin','hokage',2003,2002,1,3.40,'2'),(3,'966 Wendell Throughway','chunin','asbkcnl',154,2002,2,6.90,'7'),(5,'naruto','adc','ads',1232,1234,5,2.40,'3'),(7,'naruto','8852 Armstrong Extension','1374 Santina Wall',2323,1232,2,1.30,'4'),(7,'jacn ','asvd','asbkcnl',1234,2212,3,3.50,'5'),(8,'naruto','chunin','asbkcnl',1232,1224,3,1.30,'3'),(9,'naruto','chunin','asbkcnl',1232,1224,3,1.30,'3');
/*!40000 ALTER TABLE `edu_add` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employment_history`
--

DROP TABLE IF EXISTS `employment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employment_history` (
  `Application_Number` int unsigned NOT NULL,
  `Position` varchar(255) NOT NULL,
  `Organisation` varchar(255) NOT NULL,
  `Date_Of_Joining` date NOT NULL,
  `Date_Of_Leaving` date NOT NULL,
  KEY `ApplicationToemh` (`Application_Number`),
  CONSTRAINT `ApplicationToemh` FOREIGN KEY (`Application_Number`) REFERENCES `applications` (`Application_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employment_history`
--

LOCK TABLES `employment_history` WRITE;
/*!40000 ALTER TABLE `employment_history` DISABLE KEYS */;
INSERT INTO `employment_history` VALUES (3,'vrvcf','vgvrf','2024-04-25','2024-04-25'),(5,'Exercitationem sunt architecto voluptatum nobis neque reprehenderit delectus id aliquid.','Consequuntur quis esse.','2024-05-07','2024-05-07'),(7,'Exercitationem sunt architecto voluptatum nobis neque reprehenderit delectus id aliquid.','Consequuntur quis esse.','2024-05-20','2024-05-14'),(7,'Quod aliquid mollitia ab molestiae nam.','Quam repellat aut dolores recusandae quisquam.','2024-05-22','2024-05-21'),(8,'Aut quidem nostrum corporis ut architecto doloribus illum.','Distinctio excepturi earum hic iure eaque soluta.','2025-03-20','2025-03-20'),(9,'Exercitationem sunt architecto voluptatum nobis neque reprehenderit delectus id aliquid.','Consequuntur quis esse.','2024-05-13','2024-05-13'),(9,'Quod aliquid mollitia ab molestiae nam.','Quam repellat aut dolores recusandae quisquam.','2024-05-19','2024-05-19');
/*!40000 ALTER TABLE `employment_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `google_scholar`
--

DROP TABLE IF EXISTS `google_scholar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `google_scholar` (
  `Application_Number` int unsigned NOT NULL,
  `link` longtext NOT NULL,
  PRIMARY KEY (`Application_Number`),
  CONSTRAINT `ApplicationToGS` FOREIGN KEY (`Application_Number`) REFERENCES `applications` (`Application_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `google_scholar`
--

LOCK TABLES `google_scholar` WRITE;
/*!40000 ALTER TABLE `google_scholar` DISABLE KEYS */;
/*!40000 ALTER TABLE `google_scholar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_table`
--

DROP TABLE IF EXISTS `new_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_table` (
  `Application_Number` int unsigned NOT NULL,
  `profile_img` varchar(255) NOT NULL,
  `sign` varchar(2555) NOT NULL,
  `phd` varchar(255) NOT NULL,
  `pg` varchar(255) NOT NULL,
  `ug` varchar(255) NOT NULL,
  `12th` varchar(255) NOT NULL,
  `10th` varchar(255) NOT NULL,
  `add` varchar(255) NOT NULL,
  PRIMARY KEY (`Application_Number`),
  UNIQUE KEY `Application_Number_UNIQUE` (`Application_Number`),
  CONSTRAINT `appzToDocs` FOREIGN KEY (`Application_Number`) REFERENCES `applications` (`Application_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_table`
--

LOCK TABLES `new_table` WRITE;
/*!40000 ALTER TABLE `new_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patents`
--

DROP TABLE IF EXISTS `patents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patents` (
  `Application_Number` int unsigned NOT NULL,
  `inventer` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `date_of_filings` date NOT NULL,
  `daye_of_publication` date DEFAULT NULL,
  `patent_number` int NOT NULL,
  `status` varchar(255) NOT NULL,
  KEY `ApplicationToPat` (`Application_Number`),
  CONSTRAINT `ApplicationToPat` FOREIGN KEY (`Application_Number`) REFERENCES `applications` (`Application_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patents`
--

LOCK TABLES `patents` WRITE;
/*!40000 ALTER TABLE `patents` DISABLE KEYS */;
INSERT INTO `patents` VALUES (3,'adf','vas','2024-05-10','2024-05-10',12,'svdsvv'),(5,'Officia vitae itaque nulla ea dignissimos quam asperiores.','Product Branding Administrator','2024-05-11','2024-05-10',123,'4'),(7,'Saepe iure magnam minima dolorum vero rerum voluptas.','Internal Mobility Analyst','2025-03-15','2024-09-21',651,'Montana'),(8,'Nesciunt dignissimos dicta dolores voluptatum hic sequi enim.','Corporate Directives Producer','2024-09-01','2023-06-05',3,'Illinois'),(9,'Nesciunt dignissimos dicta dolores voluptatum hic sequi enim.','Corporate Directives Producer','2024-05-14','2024-05-26',3,'Illinois');
/*!40000 ALTER TABLE `patents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_info`
--

DROP TABLE IF EXISTS `personal_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_info` (
  `Application_Number` int unsigned NOT NULL,
  `First_Name` varchar(45) NOT NULL,
  `Middle_Name` varchar(45) DEFAULT NULL,
  `Last_Name` varchar(45) DEFAULT NULL,
  `DOB` date NOT NULL,
  `Gender` varchar(45) NOT NULL,
  `Nationality` varchar(45) NOT NULL,
  `ID_type` varchar(45) NOT NULL,
  `ID_number` varchar(45) NOT NULL,
  `Category` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `MobileNumber` varchar(45) NOT NULL,
  `AddressLine1` varchar(45) NOT NULL,
  `AddressLine2` varchar(45) DEFAULT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  `Pincode` varchar(45) NOT NULL,
  PRIMARY KEY (`Application_Number`),
  UNIQUE KEY `Application Number_UNIQUE` (`Application_Number`),
  CONSTRAINT `Application_Number` FOREIGN KEY (`Application_Number`) REFERENCES `applications` (`Application_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_info`
--

LOCK TABLES `personal_info` WRITE;
/*!40000 ALTER TABLE `personal_info` DISABLE KEYS */;
INSERT INTO `personal_info` VALUES (1,'Coty O\'Hara','Donnie Kovacek','Efrain Ernser','2023-06-14','Other','Indian','AADHAR','473','PWD','your.email+fakedata30465@gmail.com','656','9272 Selmer Unions','39362 Harvey Valley','St. Paul','Delaware','88345-7267'),(2,'Misael Schmidt','Annabell Mills','Estel Prosacco','2024-07-31','Female','OCI','Passport','350','OBC','your.email+fakedata79337@gmail.com','394','59081 Littel Plaza','94496 Floy Hills','McKinney','Kentucky','83436'),(3,'Harsh','sfv','Kumar','2024-04-20','Female','Indian','AADHAR','123421','SC','harshkumar3.14@outlook.com','09354446927','34trdf','sfvsv','vfscad','agvs','avs'),(5,'Julian Cronin','Dewitt Bins','Nils Champlin','2024-07-12','Female','OCI','AADHAR','656','OBC','your.email+fakedata96864@gmail.com','637','6531 Orn Meadows','29951 Okuneva Cape','Burnsville','Ohio','17294335'),(7,'Lucie Anderson','Ernesto Prosacco-Franey','Alva Powlowski','2025-04-23','Other','OCI','AADHAR','166','PWD','your.email+fakedata38668@gmail.com','55','875 Buddy Roads','202 Dallas Ridge','Green Bay','West Virginia','75411-8246'),(8,'Louisa King','Antoinette Bashirian','Ambrose Schimmel','2024-08-01','Male','OCI','AADHAR','339','EWS','your.email+fakedata74376@gmail.com','506','182 Darren edb','56701 Imogene Radial','Twin Falls','Colorado','59313-9972'),(9,'Marlin Kirlin','Asia Larson','Britney DuBuque','2023-05-30','Other','Indian','AADHAR','246','EWS','your.email+fakedata29112@gmail.com','6557362','8019 Erdman Club','954 Reilly Point','Medford','Utah','37839');
/*!40000 ALTER TABLE `personal_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pg`
--

DROP TABLE IF EXISTS `pg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pg` (
  `Application_Number` int unsigned NOT NULL,
  `University` varchar(255) NOT NULL,
  `Degree` varchar(255) NOT NULL,
  `Branch` varchar(255) NOT NULL,
  `Year_Of_Joining` int NOT NULL,
  `Year_Of_Completion` int NOT NULL,
  `Duration` int NOT NULL,
  `Percentage` decimal(10,2) NOT NULL,
  `Division` varchar(255) NOT NULL,
  PRIMARY KEY (`Application_Number`),
  CONSTRAINT `ApplicationtoPg` FOREIGN KEY (`Application_Number`) REFERENCES `applications` (`Application_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pg`
--

LOCK TABLES `pg` WRITE;
/*!40000 ALTER TABLE `pg` DISABLE KEYS */;
INSERT INTO `pg` VALUES (1,'Quas eligendi nesciunt ratione qui modi quia maxime laborum.','Rem sed laudantium.','AVKJKBWQLO9HIE',1234,1234,0,90.00,'C'),(2,'Est est veritatis quasi eum quisquam.','Architecto voluptas sequi.','Enim exercitationem fuga harum. Eligendi aspernatur sunt deserunt commodi. Hic excepturi cumque occaecati eaque natus mollitia ad ullam aspernatur.',3685,2024,2,507.00,'Inventore sit eveniet magnam.'),(3,'iitp','detech','ece',2007,2000,7,7.60,'2'),(5,'Magni architecto placeat quos atque minus deleniti provident itaque fugiat.','Ad cupiditate beatae neque dolorum necessitatibus velit.','Rerum maiores quo. Commodi voluptatem necessitatibus porro veritatis nemo nemo molestias. Atque ratione dignissimos qui expedita necessitatibus.',2024,1234,3,275.00,'Consectetur aut atque hic.'),(7,'Accusamus officiis amet.','Vero deserunt commodi sapiente consectetur recusandae.','Doloribus officia hic iusto quidem adipisci culpa neque. Optio et ex temporibus libero in laboriosam error. Dolorem dolorum aliquam enim provident perspiciatis pariatur esse est impedit.',1234,2921,12,392.00,'Quaerat necessitatibus vel quisquam.');
/*!40000 ALTER TABLE `pg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phd`
--

DROP TABLE IF EXISTS `phd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phd` (
  `Application_Number` int unsigned NOT NULL,
  `Department` varchar(255) NOT NULL,
  `University` varchar(255) NOT NULL,
  `Supervisior_Name` varchar(255) NOT NULL,
  `Year_Of_Joining` int NOT NULL,
  `Date_Of_Success` date NOT NULL,
  `Title` varchar(255) NOT NULL,
  PRIMARY KEY (`Application_Number`),
  CONSTRAINT `ApplicationtoPhd` FOREIGN KEY (`Application_Number`) REFERENCES `applications` (`Application_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phd`
--

LOCK TABLES `phd` WRITE;
/*!40000 ALTER TABLE `phd` DISABLE KEYS */;
INSERT INTO `phd` VALUES (1,'aisndojbawd','asdfggl ','apowvpinaq',1234,'2024-04-29','srib[0IHJ3RNPAIHB[0IRJ3'),(3,'cse','lpu','matank',2004,'2024-05-11','hehe'),(5,'cse','lpu','harsh loomba',1234,'2024-05-14','Regional Accounts Producer'),(7,'635-939-0655','124-108-1362','667-055-4534',5044,'2024-03-11','Direct Infrastructure Administrator'),(9,'795-285-4436','229-907-7316','893-004-6417',1703,'2024-05-14','Product Paradigm Representative');
/*!40000 ALTER TABLE `phd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio`
--

DROP TABLE IF EXISTS `portfolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio` (
  `Application_Number` int unsigned NOT NULL,
  `research_contri` longtext,
  `teaching_contri` longtext,
  `professional_service` longtext,
  `additional` longtext,
  PRIMARY KEY (`Application_Number`),
  CONSTRAINT `ApplicationToAP` FOREIGN KEY (`Application_Number`) REFERENCES `applications` (`Application_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio`
--

LOCK TABLES `portfolio` WRITE;
/*!40000 ALTER TABLE `portfolio` DISABLE KEYS */;
INSERT INTO `portfolio` VALUES (3,'sfvc','adsfc','dcds','acda'),(5,'20408 Kutch Vista','Aut ipsam magni debitis corrupti ipsa. Tempora iste dicta. Ad eum in.\r\nQuia officiis voluptatum doloremque iste exercitationem. Culpa doloribus consequuntur itaque. Accusantium debitis natus illum quisquam hic recusandae.\r\nVoluptatum corporis ut unde odio illum distinctio architecto alias alias. Commodi consectetur assumenda voluptatem dolore nulla praesentium est maxime qui. Explicabo praesentium nihil vel debitis quos ut perspiciatis.','479','569 Eliza Springs'),(7,'164 Jerde Flat','Eius veniam deserunt maiores quos totam. Assumenda tempora totam accusantium. Enim exercitationem doloribus commodi cumque consectetur alias.\r\nRerum molestias nulla debitis. Blanditiis porro porro quam cupiditate. Deserunt dolorem eius tempore.\r\nPerferendis porro iure minima quo autem reiciendis possimus. Inventore in odio harum. Enim deserunt deserunt odio necessitatibus sunt ad doloremque placeat.','368','1982 Itzel Mill'),(8,'956 Lavon Mount','Reprehenderit nemo illo ad magni. Qui id sunt. Corporis magni ea corrupti perspiciatis maiores voluptas eos aliquam.\r\nEligendi omnis ratione earum ex in odio eum. Quis amet libero suscipit repellendus odit. Veritatis incidunt eum quibusdam facilis.\r\nSaepe vero quibusdam. Aspernatur quia illum est temporibus tempore numquam tempore neque fugit. Ea molestias libero minima quis suscipit repellendus.','71','356 Kunde Falls'),(9,'86907 Bauch Fall','Repellendus magnam tempore quisquam sequi. Expedita iusto autem modi impedit excepturi voluptatibus sint. Nulla doloremque voluptas.\r\nNobis deleniti autem similique. Eos totam nihil occaecati debitis voluptatem aut cumque amet praesentium. Facilis tempora voluptate nemo nobis.\r\nVoluptates similique consequatur enim eligendi quas similique. Numquam fugit corporis. Dolor voluptatum quidem rem est id voluptas minima atque.','600','7120 Breanne Shoal');
/*!40000 ALTER TABLE `portfolio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professional_society`
--

DROP TABLE IF EXISTS `professional_society`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professional_society` (
  `Application_Number` int unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `membership_status` varchar(255) DEFAULT NULL,
  KEY `ApplicationToPSS` (`Application_Number`),
  CONSTRAINT `ApplicationToPSS` FOREIGN KEY (`Application_Number`) REFERENCES `applications` (`Application_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professional_society`
--

LOCK TABLES `professional_society` WRITE;
/*!40000 ALTER TABLE `professional_society` DISABLE KEYS */;
INSERT INTO `professional_society` VALUES (3,'back tdf','sv n'),(5,'garfield','why tho'),(7,'back tdf','sv n'),(8,'Brett Schiller','Arkansas'),(9,'Orin Lindgren','Louisiana');
/*!40000 ALTER TABLE `professional_society` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_summary`
--

DROP TABLE IF EXISTS `publication_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_summary` (
  `Application_Number` int unsigned NOT NULL,
  `inter_journals` int NOT NULL,
  `inter_conference` int NOT NULL,
  `nat_journals` int NOT NULL,
  `nat_conference` int NOT NULL,
  `no_Of_patents` int NOT NULL,
  `no_of_books` int NOT NULL,
  PRIMARY KEY (`Application_Number`),
  CONSTRAINT `ApplicationTops` FOREIGN KEY (`Application_Number`) REFERENCES `applications` (`Application_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_summary`
--

LOCK TABLES `publication_summary` WRITE;
/*!40000 ALTER TABLE `publication_summary` DISABLE KEYS */;
INSERT INTO `publication_summary` VALUES (3,123,2,4,2,1,3),(5,2,4,6,89,301,600),(7,3,23,1,23,593,509),(9,123,4,4,3,463,455);
/*!40000 ALTER TABLE `publication_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications`
--

DROP TABLE IF EXISTS `publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publications` (
  `Application_Number` int unsigned NOT NULL,
  `type` varchar(45) NOT NULL,
  `author` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `year_of_publication` int NOT NULL,
  `document_id` varchar(45) NOT NULL,
  KEY `ApplicationTopub` (`Application_Number`),
  CONSTRAINT `ApplicationTopub` FOREIGN KEY (`Application_Number`) REFERENCES `applications` (`Application_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (3,'eFWE','WRGGR','RWGRW',1234,'1234'),(3,'F','R','W',2,'2'),(3,'W','G','G',3,'3'),(3,'E','G','R',4,'4'),(5,'Cgb','Anj','Pbdv',23,'113'),(7,'Forward Identity Designer','Aspernatur a vero.','Forward Division Representative',1234,'2023'),(8,'International Quality Consultant','Consectetur id dolore molestiae consectetur ex quo sit laboriosam.','Central Paradigm Executive',2342,'Neque natus sed similique.'),(9,'Customer Configuration Representative','Assumenda nulla nemo officiis.','Principal Markets Manager',1234,'1213');
/*!40000 ALTER TABLE `publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `research_supervision`
--

DROP TABLE IF EXISTS `research_supervision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `research_supervision` (
  `Application_Number` int unsigned NOT NULL,
  `name_of_student` varchar(255) DEFAULT NULL,
  `student_degree` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `starting_year` int DEFAULT NULL,
  `completion_year` int DEFAULT NULL,
  KEY `ApplicationToRS` (`Application_Number`),
  CONSTRAINT `ApplicationToRS` FOREIGN KEY (`Application_Number`) REFERENCES `applications` (`Application_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `research_supervision`
--

LOCK TABLES `research_supervision` WRITE;
/*!40000 ALTER TABLE `research_supervision` DISABLE KEYS */;
INSERT INTO `research_supervision` VALUES (3,'r','r','e','r',5,2),(5,'Bettye Macejkovic','Doloribus fugit quasi exercitationem at laborum quae voluptatem.','Direct Metrics Agent','Arizona',2023,1234),(5,'Rebekah Hegmann','Neque at dignissimos.','Internal Implementation Developer','Utah',2024,1234),(7,'Bettye Macejkovic','Doloribus fugit quasi exercitationem at laborum quae voluptatem.','Direct Metrics Agent','Arizona',2023,1234),(7,'Rebekah Hegmann','Neque at dignissimos.','Internal Implementation Developer','Utah',2024,1234),(8,'Elyssa Dibbert','Quibusdam suscipit ratione quam nisi totam minima assumenda totam.','Investor Interactions Liaison','1234',1234,2343),(8,'Marjorie Ryan','Ipsum odio voluptas quaerat voluptatum iure.','District Marketing Designer','2213',2321,2002),(9,'Bettye Macejkovic','Doloribus fugit quasi exercitationem at laborum quae voluptatem.','Direct Metrics Agent','Arizona',2023,1234);
/*!40000 ALTER TABLE `research_supervision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ug`
--

DROP TABLE IF EXISTS `ug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ug` (
  `Application_Number` int unsigned NOT NULL,
  `University` varchar(255) NOT NULL,
  `Degree` varchar(255) NOT NULL,
  `Branch` varchar(255) NOT NULL,
  `Year_Of_Joining` int NOT NULL,
  `Year_Of_Completion` int NOT NULL,
  `Duration` int NOT NULL,
  `Percentage` decimal(10,2) NOT NULL,
  `Division` varchar(255) NOT NULL,
  KEY `ApplicationtoUg` (`Application_Number`),
  CONSTRAINT `ApplicationtoUg` FOREIGN KEY (`Application_Number`) REFERENCES `applications` (`Application_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ug`
--

LOCK TABLES `ug` WRITE;
/*!40000 ALTER TABLE `ug` DISABLE KEYS */;
INSERT INTO `ug` VALUES (1,'Vel autem veritatis doloremque natus.','Fugiat corporis tempora praesentium repellat maiores hic alias eligendi.','Enim quos vero omnis fuga minus voluptatum occaecati libero.',1234,1234,1234,372.00,'Ad ipsam error consequatur laudantium fuga.'),(2,'Rerum nisi illum voluptatum autem asperiores necessitatibus.','Debitis deleniti veritatis sed maiores eaque dolore quia repellendus qui.','Est iure atque eum iure cupiditate facilis maxime.',2003,1234,3,205.00,'Sit eum delectus optio occaecati iste.'),(3,'iitp','kjnl','cse',2003,1243,5,7.00,'3'),(5,'Doloribus maiores atque laborum voluptatem fugit.','Quaerat modi earum molestias.','Error dignissimos occaecati ex asperiores.',2024,1234,5,475.00,'Ea corporis facere ea.'),(7,'Placeat numquam libero incidunt perferendis dolore nostrum sit nobis.','Commodi aspernatur nisi assumenda eveniet nostrum commodi consequuntur.','Fuga ipsum dolor illum.',2343,2024,1,561.00,'Amet magnam animi.'),(8,'Eum iusto eaque unde excepturi impedit officia maxime aperiam.','Repellendus nulla eius.','Nam quidem corrupti blanditiis eaque exercitationem voluptas.',2232,2234,12,509.00,'Nulla nulla quasi eligendi cum odit debitis.'),(9,'Eum iusto eaque unde excepturi impedit officia maxime aperiam.','Repellendus nulla eius.','Nam quidem corrupti blanditiis eaque exercitationem voluptas.',2232,2234,12,509.00,'Nulla nulla quasi eligendi cum odit debitis.');
/*!40000 ALTER TABLE `ug` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-05  2:03:35
