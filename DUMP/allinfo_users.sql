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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userid` varchar(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `date_joined` date NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('U178446697','Bradley','Torres','2020-08-14'),('U183942414','James','Rose','2021-09-28'),('U211488868','Charles','Baker','2023-03-06'),('U221020388','Pamela','Long','2023-08-22'),('U367822255','Casey','Humphrey','2023-08-20'),('U373633828','Lori','Adams','2020-02-20'),('U388076615','Jasmine','Jackson','2022-02-21'),('U413622950','Marcia','Cox','2024-05-29'),('U446549091','Melanie','Robinson','2020-09-04'),('U465447843','Andrew','Jackson','2024-10-22'),('U492400767','Samuel','Garcia','2023-10-30'),('U535000510','Amanda','Perez','2023-01-22'),('U549214358','Veronica','Willis','2023-08-07'),('U570328914','Susan','Jenkins','2023-04-24'),('U579362622','John','Mendez','2023-11-02'),('U600077683','Justin','Mueller','2022-07-18'),('U640621448','Melissa','Castillo','2024-07-23'),('U654833775','Russell','Dominguez','2020-12-17'),('U667424015','Henry','Kim','2022-12-12'),('U671115601','Danielle','Pena','2024-03-05'),('U694195181','Denise','Schmitt','2023-12-13'),('U701638904','Elizabeth','Juarez','2024-05-01'),('U719547209','Tony','Mayo','2020-02-26'),('U720941051','Billy','Fowler','2023-02-10'),('U786917100','Todd','Alvarez','2021-09-14'),('U818535007','Diana','Lucas','2023-11-28'),('U834545224','Cody','Cox','2020-01-14'),('U856551731','Adam','Knight','2021-10-26'),('U906475394','Benjamin','Sherman','2023-10-08'),('U933654038','James','Graves','2020-09-04');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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
