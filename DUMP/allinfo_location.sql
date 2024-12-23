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
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_Size` int NOT NULL,
  `loc_Latitude` decimal(9,6) NOT NULL,
  `loc_Longitude` decimal(9,6) NOT NULL,
  `region` varchar(100) NOT NULL,
  PRIMARY KEY (`loc_Latitude`,`loc_Longitude`),
  KEY `region` (`region`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`region`) REFERENCES `region` (`region_Name`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (91,42.074769,-80.331700,'Guelph'),(402,42.086650,-81.000876,'London'),(630,42.178051,-81.253546,'Brampton'),(4,42.300920,-79.659085,'Hamilton'),(64,42.378597,-80.848284,'Oakville'),(56,42.490757,-81.886750,'Kitchener'),(56,42.525659,-79.881516,'Guelph'),(427,42.526220,-80.733885,'Mississauga'),(68,42.550438,-79.706379,'Mississauga'),(119,42.572854,-81.183293,'Guelph'),(67,42.634322,-79.433891,'Mississauga'),(403,42.652407,-81.902070,'Stratford'),(174,42.660316,-81.559373,'Oakville'),(260,42.681621,-79.577835,'Waterloo'),(41,42.684534,-81.702607,'Mississauga'),(16,42.696686,-81.761628,'Hamilton'),(181,42.719299,-81.811015,'Oakville'),(589,42.762376,-80.968839,'Waterloo'),(108,42.780416,-79.083087,'London'),(14,42.792292,-79.068859,'London'),(288,42.796500,-79.184964,'Waterloo'),(54,42.816136,-81.618908,'Mississauga'),(111,42.868551,-81.819438,'Guelph'),(557,42.885030,-80.725574,'Mississauga'),(159,42.922154,-80.401099,'Kitchener'),(356,42.924880,-81.201384,'Mississauga'),(78,42.936503,-79.765705,'Guelph'),(488,42.939283,-79.498154,'Waterloo'),(95,42.959716,-79.102158,'Toronto'),(293,42.964411,-79.739364,'Brampton'),(60,42.969899,-79.359725,'Stratford'),(416,43.082667,-79.441943,'Mississauga'),(76,43.166458,-79.373991,'Kitchener'),(180,43.201659,-79.956997,'London'),(264,43.234456,-80.914763,'Oakville'),(129,43.240440,-80.538678,'Stratford'),(430,43.299186,-79.088322,'Mississauga'),(292,43.313066,-80.308129,'Mississauga'),(105,43.342934,-81.936887,'Kitchener'),(269,43.352169,-80.230560,'Hamilton'),(74,43.424948,-80.718568,'Oakville'),(266,43.582744,-80.719690,'Kitchener'),(509,43.589186,-80.147774,'Stratford'),(148,43.606297,-79.997105,'Guelph'),(82,43.710330,-80.210179,'Toronto'),(615,43.755717,-81.353865,'Hamilton'),(199,43.801198,-79.230558,'Toronto'),(107,43.858905,-81.773884,'Brampton'),(148,43.871255,-81.244294,'Waterloo'),(469,43.903584,-79.778909,'London');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
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
