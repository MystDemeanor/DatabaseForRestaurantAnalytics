-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: allinfo
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `business_affiliation`
--

DROP TABLE IF EXISTS `business_affiliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_affiliation` (
  `userid` varchar(10) NOT NULL,
  `affiliation` varchar(100) NOT NULL,
  PRIMARY KEY (`userid`,`affiliation`),
  CONSTRAINT `business_affiliation_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `business_owner` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_affiliation`
--

LOCK TABLES `business_affiliation` WRITE;
/*!40000 ALTER TABLE `business_affiliation` DISABLE KEYS */;
INSERT INTO `business_affiliation` VALUES ('U178446697','Fashion Forward'),('U388076615','Global Trade Co.'),('U413622950','Travel More'),('U492400767','Smart Homes Inc.'),('U535000510','Travel More'),('U570328914','FinTech Pioneers'),('U570328914','NextGen Mobility'),('U600077683','Health First'),('U640621448','EduWorld'),('U640621448','NextGen Mobility'),('U640621448','Urban Eats'),('U671115601','Digital Dynamics'),('U671115601','Eco Cleaners'),('U671115601','Foodies Delight'),('U786917100','Eco Cleaners'),('U786917100','Tech Innovators'),('U786917100','Urban Eats'),('U818535007','Global Trade Co.'),('U818535007','Travel More'),('U856551731','Urban Eats');
/*!40000 ALTER TABLE `business_affiliation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-25 20:41:20
