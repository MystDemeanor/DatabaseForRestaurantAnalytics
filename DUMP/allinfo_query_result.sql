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
-- Table structure for table `query_result`
--

DROP TABLE IF EXISTS `query_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `query_result` (
  `queryid` int NOT NULL,
  `result` varchar(100) NOT NULL,
  PRIMARY KEY (`queryid`,`result`),
  CONSTRAINT `query_result_ibfk_1` FOREIGN KEY (`queryid`) REFERENCES `research_query` (`queryid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_result`
--

LOCK TABLES `query_result` WRITE;
/*!40000 ALTER TABLE `query_result` DISABLE KEYS */;
INSERT INTO `query_result` VALUES (9491,'Further Review Needed'),(25414,'Further Review Needed'),(28400,'Needs More Data'),(28400,'Result Delayed'),(38709,'Partial Success'),(40764,'Failure'),(40857,'Needs More Data'),(45146,'Failure'),(47285,'Needs More Data'),(54103,'Result Delayed'),(56125,'Failure'),(71550,'Failure'),(83951,'Partial Success'),(102672,'Analysis Pending'),(102899,'Partial Success'),(102899,'Result Delayed'),(110817,'Data Error'),(110817,'Result Delayed'),(112319,'Failure'),(137580,'Needs More Data'),(139434,'Data Error'),(240177,'Result Delayed'),(264149,'Result Delayed'),(267976,'Needs More Data'),(268042,'Result Delayed'),(344061,'Needs More Data'),(381384,'Success'),(406098,'Needs More Data'),(410991,'Further Review Needed'),(421646,'Further Review Needed'),(421646,'Partial Success'),(440218,'Success'),(460098,'Analysis Pending'),(469594,'Result Delayed'),(500139,'Failure'),(541124,'Result Delayed'),(559590,'Further Review Needed'),(566979,'Needs More Data'),(580048,'Data Error'),(584809,'Further Review Needed'),(588721,'Failure'),(594955,'Failure'),(605963,'Needs More Data'),(608402,'Needs More Data'),(613601,'Success'),(616660,'Partial Success'),(619576,'Failure'),(621069,'Further Review Needed'),(622163,'Analysis Pending'),(622163,'Failure'),(624215,'Needs More Data'),(637308,'Needs More Data'),(637482,'Data Error'),(650522,'Further Review Needed'),(655845,'Success'),(680097,'Result Delayed'),(707495,'Success'),(739096,'Further Review Needed'),(754649,'Needs More Data'),(769531,'Analysis Pending'),(778275,'Success'),(795938,'Failure'),(798366,'Needs More Data'),(807917,'Analysis Pending'),(807917,'Result Delayed'),(860902,'Needs More Data'),(864297,'Needs More Data'),(881309,'Analysis Pending'),(884681,'Data Error'),(889628,'Analysis Pending'),(889628,'Further Review Needed'),(893004,'Partial Success'),(915497,'Success'),(947971,'Further Review Needed'),(950445,'Analysis Pending'),(953055,'Success'),(975886,'Analysis Pending'),(982198,'Failure'),(982198,'Success'),(983473,'Partial Success');
/*!40000 ALTER TABLE `query_result` ENABLE KEYS */;
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
