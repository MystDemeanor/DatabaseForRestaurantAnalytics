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
-- Table structure for table `religion`
--

DROP TABLE IF EXISTS `religion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `religion` (
  `religion_name` varchar(100) NOT NULL,
  `dietary_permittance` varchar(100) DEFAULT NULL,
  `vegetarian` tinyint(1) NOT NULL DEFAULT '0',
  `vegan` tinyint(1) NOT NULL DEFAULT '0',
  `Alcohol` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`religion_name`),
  CONSTRAINT `religion_chk_1` CHECK (((0 = `vegan`) or (0 <> `vegetarian`)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `religion`
--

LOCK TABLES `religion` WRITE;
/*!40000 ALTER TABLE `religion` DISABLE KEYS */;
INSERT INTO `religion` VALUES ('Agnosticism','All Foods',0,0,1),('Animism','All Foods',0,0,1),('Atheism','All Foods',0,0,1),('Bahá\'í','All Foods',0,0,0),('Buddhism','Vegetarian Preferred',1,0,1),('Cao Dai','Vegetarian Preferred',1,0,1),('Christianity','All Foods',0,0,1),('Confucianism','All Foods',0,0,1),('Druze','All Foods',0,0,1),('Falun Gong','Vegetarian Preferred',1,0,0),('Hinduism','Vegetarian Preferred',1,0,1),('Islam','Halal Only',0,0,0),('Jainism','Strictly Vegetarian',1,1,0),('Judaism','Kosher Only',0,0,1),('Native American Religions','All Foods',0,0,1),('Paganism','All Foods',0,0,1),('Rastafarianism','Vegetarian Preferred',1,0,0),('Scientology','All Foods',0,0,1),('Shinto','All Foods',0,0,1),('Sikhism','Vegetarian Preferred',1,0,1),('Spiritism','All Foods',0,0,1),('Taoism','Vegetarian Preferred',1,0,1),('Unitarian Universalism','All Foods',0,0,1),('Wicca','All Foods',0,0,1),('Zoroastrianism','Vegetarian Preferred',1,0,1);
/*!40000 ALTER TABLE `religion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-25 20:41:18
