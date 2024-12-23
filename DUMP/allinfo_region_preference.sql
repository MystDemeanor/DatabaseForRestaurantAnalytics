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
-- Table structure for table `region_preference`
--

DROP TABLE IF EXISTS `region_preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region_preference` (
  `Users` varchar(10) NOT NULL,
  `Region` varchar(100) NOT NULL,
  PRIMARY KEY (`Users`,`Region`),
  KEY `Region` (`Region`),
  CONSTRAINT `region_preference_ibfk_1` FOREIGN KEY (`Users`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `region_preference_ibfk_2` FOREIGN KEY (`Region`) REFERENCES `region` (`region_Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region_preference`
--

LOCK TABLES `region_preference` WRITE;
/*!40000 ALTER TABLE `region_preference` DISABLE KEYS */;
INSERT INTO `region_preference` VALUES ('U178446697','Brampton'),('U211488868','Brampton'),('U413622950','Brampton'),('U446549091','Brampton'),('U818535007','Brampton'),('U570328914','Guelph'),('U786917100','Guelph'),('U906475394','Guelph'),('U367822255','Hamilton'),('U465447843','Hamilton'),('U600077683','Hamilton'),('U221020388','Kitchener'),('U367822255','Kitchener'),('U492400767','Kitchener'),('U701638904','Kitchener'),('U856551731','Kitchener'),('U178446697','London'),('U183942414','London'),('U221020388','London'),('U465447843','London'),('U549214358','London'),('U667424015','London'),('U856551731','London'),('U906475394','London'),('U211488868','Mississauga'),('U446549091','Mississauga'),('U492400767','Mississauga'),('U906475394','Mississauga'),('U933654038','Mississauga'),('U413622950','Oakville'),('U694195181','Oakville'),('U701638904','Oakville'),('U719547209','Oakville'),('U786917100','Oakville'),('U834545224','Oakville'),('U933654038','Oakville'),('U183942414','Stratford'),('U413622950','Stratford'),('U367822255','Toronto'),('U446549091','Toronto'),('U667424015','Toronto'),('U786917100','Toronto'),('U818535007','Toronto'),('U834545224','Toronto'),('U856551731','Toronto'),('U183942414','Waterloo'),('U413622950','Waterloo'),('U492400767','Waterloo'),('U570328914','Waterloo'),('U906475394','Waterloo');
/*!40000 ALTER TABLE `region_preference` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-25 20:41:19
