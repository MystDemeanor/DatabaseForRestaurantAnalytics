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
-- Table structure for table `food_preferences`
--

DROP TABLE IF EXISTS `food_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_preferences` (
  `userid` varchar(10) NOT NULL,
  `food` varchar(50) NOT NULL,
  PRIMARY KEY (`userid`,`food`),
  KEY `food` (`food`),
  CONSTRAINT `food_preferences_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `food_preferences_ibfk_2` FOREIGN KEY (`food`) REFERENCES `food` (`food_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_preferences`
--

LOCK TABLES `food_preferences` WRITE;
/*!40000 ALTER TABLE `food_preferences` DISABLE KEYS */;
INSERT INTO `food_preferences` VALUES ('U694195181','Arepas'),('U492400767','Borscht'),('U818535007','Borscht'),('U818535007','Bratwurst'),('U640621448','Ceviche'),('U492400767','Clam Chowder'),('U701638904','Coleslaw'),('U183942414','Cornbread'),('U570328914','Cornbread'),('U720941051','Cornbread'),('U834545224','Curry'),('U492400767','Fettuccine Alfredo'),('U373633828','Gnocchi'),('U413622950','Goulash'),('U906475394','Goulash'),('U579362622','Haggis'),('U671115601','Haggis'),('U856551731','Harira'),('U413622950','Hummus'),('U671115601','Jambalaya'),('U178446697','Laksa'),('U367822255','Laksa'),('U373633828','Laksa'),('U211488868','Lamb Roast'),('U667424015','Lamb Roast'),('U834545224','Lasagna'),('U465447843','Miso Soup'),('U818535007','Moussaka'),('U367822255','Nasi Goreng'),('U640621448','Nasi Goreng'),('U786917100','Omelette'),('U600077683','Pasta'),('U786917100','Plantains'),('U906475394','Poke Bowl'),('U719547209','Pozole'),('U373633828','Ratatouille'),('U446549091','Ratatouille'),('U654833775','Ratatouille'),('U413622950','Risotto'),('U570328914','Salad'),('U640621448','Salad'),('U671115601','Salad'),('U570328914','Samosa'),('U671115601','Satay'),('U671115601','Shakshuka'),('U579362622','Spring Rolls'),('U654833775','Tabbouleh'),('U570328914','Tamales'),('U492400767','Tempura'),('U640621448','Vindaloo');
/*!40000 ALTER TABLE `food_preferences` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-25 20:41:17
