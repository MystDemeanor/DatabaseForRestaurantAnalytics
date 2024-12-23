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
-- Table structure for table `research_query`
--

DROP TABLE IF EXISTS `research_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `research_query` (
  `queryid` int NOT NULL,
  `queryfunction` varchar(100) NOT NULL,
  `dateofquery` date NOT NULL,
  `timeofquery` time NOT NULL,
  `userid` varchar(10) NOT NULL,
  PRIMARY KEY (`queryid`),
  UNIQUE KEY `dateofquery` (`dateofquery`,`timeofquery`,`userid`),
  KEY `userid` (`userid`),
  CONSTRAINT `research_query_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `research_query`
--

LOCK TABLES `research_query` WRITE;
/*!40000 ALTER TABLE `research_query` DISABLE KEYS */;
INSERT INTO `research_query` VALUES (9491,'Generate Population Report','2022-05-06','21:00:48','U719547209'),(25414,'Generate Population Report','2022-07-04','03:02:34','U933654038'),(28400,'Generate Population Report','2021-08-22','11:19:26','U906475394'),(38709,'Predict Restaurant Trends','2021-12-13','09:57:51','U654833775'),(40764,'Predict Restaurant Trends','2021-02-12','06:43:01','U600077683'),(40857,'Study Cuisine Popularity','2022-04-19','18:35:17','U535000510'),(45146,'Compare Demographics','2021-11-17','01:23:20','U654833775'),(47285,'Study Cuisine Popularity','2022-07-18','04:39:43','U367822255'),(54103,'Generate Population Report','2022-07-03','17:30:40','U834545224'),(56125,'Estimate Housing Demand','2022-03-18','05:43:24','U413622950'),(71550,'Forecast Migration Rates','2020-09-15','16:08:25','U373633828'),(83951,'Forecast Migration Rates','2021-03-17','22:11:57','U413622950'),(102672,'Study Cuisine Popularity','2021-05-12','13:46:10','U446549091'),(102899,'Evaluate Regional Foot Traffic','2022-09-03','11:54:52','U719547209'),(110817,'Study Cuisine Popularity','2020-10-31','12:58:23','U701638904'),(112319,'Analyze Traffic Patterns','2020-06-03','02:27:45','U579362622'),(137580,'Estimate Housing Demand','2020-09-11','14:42:00','U856551731'),(139434,'Evaluate Regional Foot Traffic','2022-04-21','01:59:06','U183942414'),(240177,'Analyze Traffic Patterns','2022-05-10','09:17:15','U600077683'),(264149,'Predict Restaurant Trends','2021-06-30','23:22:17','U367822255'),(267976,'Generate Population Report','2022-03-08','07:06:21','U570328914'),(268042,'Analyze Traffic Patterns','2021-08-05','20:15:17','U183942414'),(344061,'Evaluate Regional Foot Traffic','2022-09-21','17:23:16','U211488868'),(381384,'Study Cuisine Popularity','2021-04-27','23:12:27','U720941051'),(406098,'Evaluate Regional Foot Traffic','2020-10-27','05:00:38','U492400767'),(410991,'Forecast Migration Rates','2021-04-03','00:25:50','U178446697'),(421646,'Generate Population Report','2021-06-25','05:05:12','U579362622'),(440218,'Evaluate Regional Foot Traffic','2021-07-23','01:48:11','U492400767'),(460098,'Analyze Traffic Patterns','2021-04-13','05:26:09','U388076615'),(469594,'Evaluate Regional Foot Traffic','2022-02-16','08:05:19','U600077683'),(500139,'Generate Population Report','2022-05-04','12:56:03','U549214358'),(541124,'Estimate Housing Demand','2022-08-19','16:24:14','U906475394'),(559590,'Predict Restaurant Trends','2020-05-18','23:30:24','U720941051'),(566979,'Analyze Traffic Patterns','2021-06-14','02:54:01','U570328914'),(580048,'Analyze Traffic Patterns','2022-07-06','16:17:56','U535000510'),(584809,'Forecast Migration Rates','2021-01-21','12:34:00','U579362622'),(588721,'Compare Demographics','2021-07-02','20:30:53','U786917100'),(594955,'Analyze Traffic Patterns','2022-08-08','10:14:28','U570328914'),(605963,'Study Cuisine Popularity','2020-12-01','14:48:45','U786917100'),(608402,'Analyze Traffic Patterns','2022-06-16','23:07:24','U549214358'),(613601,'Evaluate Regional Foot Traffic','2020-03-30','19:07:26','U221020388'),(616660,'Predict Restaurant Trends','2021-11-19','14:23:58','U933654038'),(619576,'Predict Restaurant Trends','2021-09-22','19:37:04','U446549091'),(621069,'Compare Demographics','2022-08-31','01:06:30','U178446697'),(622163,'Compare Demographics','2022-03-18','00:51:34','U640621448'),(624215,'Generate Population Report','2022-08-27','04:31:11','U413622950'),(637308,'Study Cuisine Popularity','2022-02-25','00:20:44','U694195181'),(637482,'Estimate Housing Demand','2022-04-22','13:55:35','U640621448'),(650522,'Study Cuisine Popularity','2020-10-29','04:40:02','U667424015'),(655845,'Predict Restaurant Trends','2021-11-08','23:41:43','U667424015'),(680097,'Predict Restaurant Trends','2021-08-03','04:55:35','U701638904'),(707495,'Evaluate Regional Foot Traffic','2021-12-10','16:49:14','U671115601'),(739096,'Evaluate Regional Foot Traffic','2021-04-25','21:53:40','U221020388'),(754649,'Predict Restaurant Trends','2021-03-16','19:21:43','U654833775'),(769531,'Generate Population Report','2020-08-27','23:13:44','U694195181'),(778275,'Generate Population Report','2020-06-05','03:08:48','U221020388'),(795938,'Generate Population Report','2022-06-27','06:50:04','U535000510'),(798366,'Compare Demographics','2022-09-21','08:43:24','U667424015'),(807917,'Generate Population Report','2022-07-13','08:52:04','U446549091'),(860902,'Analyze Traffic Patterns','2020-10-01','04:40:22','U701638904'),(864297,'Generate Population Report','2020-10-20','03:52:02','U818535007'),(881309,'Analyze Traffic Patterns','2021-03-22','13:21:51','U640621448'),(884681,'Forecast Migration Rates','2020-01-14','10:13:05','U465447843'),(889628,'Generate Population Report','2022-02-07','15:48:51','U211488868'),(893004,'Study Cuisine Popularity','2022-05-01','05:14:10','U906475394'),(915497,'Forecast Migration Rates','2020-09-24','04:27:56','U786917100'),(947971,'Analyze Traffic Patterns','2021-12-26','09:25:17','U694195181'),(950445,'Study Cuisine Popularity','2020-04-18','05:23:48','U178446697'),(953055,'Compare Demographics','2021-10-06','20:06:55','U933654038'),(975886,'Study Cuisine Popularity','2022-03-16','19:38:01','U720941051'),(982198,'Analyze Traffic Patterns','2022-05-29','05:11:57','U834545224'),(983473,'Generate Population Report','2022-09-26','13:05:38','U719547209');
/*!40000 ALTER TABLE `research_query` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-25 20:41:21
