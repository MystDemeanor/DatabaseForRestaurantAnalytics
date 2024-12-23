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
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `food_name` varchar(100) NOT NULL,
  `country_of_origin` varchar(100) NOT NULL,
  PRIMARY KEY (`food_name`,`country_of_origin`),
  KEY `country_of_origin` (`country_of_origin`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`country_of_origin`) REFERENCES `country` (`country_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES ('Poke Bowl','afghanistan'),('Tortilla','albania'),('Curry','antigua-and-barbuda'),('Goulash','antigua-and-barbuda'),('Pho','antigua-and-barbuda'),('Tabbouleh','antigua-and-barbuda'),('Baguette','armenia'),('Fettuccine Alfredo','aruba'),('Moussaka','aruba'),('Quiche','aruba'),('Steamed Buns','australia'),('Falafel','austria'),('Gnocchi','austria'),('Bao','bahamas-the'),('Lasagna','bahamas-the'),('Satay','bahamas-the'),('Croissant','bangladesh'),('Tempura','barbados'),('Jambalaya','belgium'),('Pho','belgium'),('Omelette','benin'),('Fried Chicken','bermuda'),('Jambalaya','bermuda'),('Meatballs','bermuda'),('Risotto','bhutan'),('Vindaloo','bhutan'),('Satay','bolivia'),('Falafel','bosnia-and-herzegovina'),('Pierogi','bosnia-and-herzegovina'),('Hummus','botswana'),('Pozole','botswana'),('Salad','botswana'),('Sticky Rice','botswana'),('Salad','brazil'),('Baguette','brunei'),('Curry','burkina-faso'),('Falafel','burkina-faso'),('Lamb Roast','burkina-faso'),('Bento Box','burundi'),('Clam Chowder','burundi'),('Pancakes','burundi'),('French Fries','cabo-verde'),('Omelette','cabo-verde'),('Steamed Buns','cambodia'),('Samosa','cameroon'),('Cornbread','canada'),('Harira','canada'),('Carrot Cake','cayman-islands'),('Gelato','cayman-islands'),('Jambalaya','cayman-islands'),('Tempura','cayman-islands'),('Barbecue Ribs','central-african-republic'),('Gumbo','chad'),('Ratatouille','chad'),('Kimchi','chile'),('Borscht','china'),('Cheesecake','china'),('Cornbread','china'),('Miso Soup','china'),('Poke Bowl','china'),('Cheesecake','colombia'),('Pho','comoros'),('Baguette','congo-democratic-republic-of-the'),('Chow Mein','congo-democratic-republic-of-the'),('Goulash','congo-democratic-republic-of-the'),('Miso Soup','congo-democratic-republic-of-the'),('Roti','congo-republic-of-the'),('Bento Box','costa-rica'),('Burger','costa-rica'),('Coleslaw','costa-rica'),('Khachapuri','costa-rica'),('Tamales','costa-rica'),('Arepas','cote-divoire'),('Haggis','cote-divoire'),('Quiche','croatia'),('Hummus','curacao'),('Omelette','curacao'),('Paella','curacao'),('Pierogi','curacao'),('Borscht','cyprus'),('Spring Rolls','cyprus'),('Jambalaya','czechia'),('Pad Thai','czechia'),('Arepas','djibouti'),('Ramen','djibouti'),('Steamed Buns','djibouti'),('Crepes','dominican-republic'),('Kimchi','dominican-republic'),('Pad Thai','dominican-republic'),('Pizza','dominican-republic'),('Salad','ecuador'),('Tortilla','ecuador'),('Carrot Cake','egypt'),('Pancakes','egypt'),('Quiche','el-salvador'),('Macarons','equatorial-guinea'),('Risotto','equatorial-guinea'),('Tacos','eritrea'),('Biryani','estonia'),('Cornbread','estonia'),('Steak','estonia'),('Fish and Chips','eswatini'),('Ratatouille','eswatini'),('Gumbo','faroe-islands'),('Hotdog','fiji'),('Bratwurst','finland'),('Vindaloo','finland'),('Bratwurst','french-polynesia'),('Jambalaya','gabon'),('Pad Thai','gambia-the'),('Samosa','georgia'),('Lasagna','germany'),('Chow Mein','greenland'),('Moussaka','greenland'),('Churros','grenada'),('Ratatouille','guam'),('Curry','guernsey'),('Cornbread','guinea'),('Empanadas','guinea'),('Sushi','guinea'),('Quiche','guinea-bissau'),('Steak','guinea-bissau'),('Satay','guyana'),('Satay','haiti'),('Fufu','hong-kong'),('Pierogi','hong-kong'),('Spring Rolls','hungary'),('Plantains','india'),('Quiche','india'),('Miso Soup','iran'),('Pizza','iran'),('Plantains','iran'),('Barbecue Ribs','iraq'),('Coleslaw','ireland'),('Miso Soup','ireland'),('Pancakes','ireland'),('Gumbo','isle-of-man'),('Shepherd\'s Pie','isle-of-man'),('Barbecue Ribs','israel'),('Crepes','israel'),('Baguette','italy'),('Poke Bowl','italy'),('Nasi Goreng','jamaica'),('Jollof Rice','jersey'),('Fettuccine Alfredo','jordan'),('Salad','jordan'),('Arepas','kazakhstan'),('French Fries','kazakhstan'),('Gelato','kazakhstan'),('Laksa','kazakhstan'),('Arepas','kenya'),('Cassoulet','kenya'),('Cheesecake','kenya'),('Fish and Chips','kenya'),('French Fries','kenya'),('Plantains','korea-north'),('Churros','korea-south'),('Arepas','kuwait'),('Ratatouille','kuwait'),('Churros','latvia'),('Curry','lebanon'),('Moussaka','lesotho'),('French Fries','lithuania'),('Poke Bowl','lithuania'),('Steak','lithuania'),('Fufu','macau'),('Risotto','madagascar'),('Banoffee Pie','malawi'),('Burger','malawi'),('Clam Chowder','malawi'),('Meatballs','malawi'),('Omelette','malaysia'),('Pozole','malaysia'),('Risotto','malaysia'),('Salad','malaysia'),('Jollof Rice','maldives'),('Borscht','mali'),('Croissant','malta'),('Miso Soup','malta'),('Tacos','malta'),('Udon','malta'),('Fish and Chips','mauritania'),('Pozole','mauritania'),('Udon','mauritania'),('Bento Box','mexico'),('Lasagna','micronesia-federated-states-of'),('Falafel','moldova'),('Gumbo','mongolia'),('Banoffee Pie','montenegro'),('Pho','montenegro'),('Bratwurst','morocco'),('Goulash','mozambique'),('Salad','mozambique'),('Salad','namibia'),('Laksa','nepal'),('Shawarma','nepal'),('Udon','nepal'),('Fried Chicken','new-caledonia'),('Gnocchi','new-caledonia'),('Fish and Chips','new-zealand'),('Jollof Rice','new-zealand'),('Pierogi','nicaragua'),('Risotto','nicaragua'),('Shakshuka','nicaragua'),('Biryani','niger'),('Kimchi','nigeria'),('Pasta','northern-mariana-islands'),('Fried Chicken','oman'),('Lasagna','oman'),('Croissant','pakistan'),('Meatballs','pakistan'),('Sticky Rice','pakistan'),('Falafel','panama'),('Meatballs','panama'),('Tonkatsu','panama'),('Roti','papua-new-guinea'),('Borscht','paraguay'),('Shakshuka','peru'),('Bratwurst','philippines'),('Crepes','philippines'),('Nasi Goreng','philippines'),('Fish and Chips','poland'),('Harira','poland'),('Banoffee Pie','portugal'),('Pho','portugal'),('Harira','puerto-rico'),('Hotdog','puerto-rico'),('Dolma','qatar'),('Risotto','romania'),('Laksa','russia'),('Steak','russia'),('Bratwurst','rwanda'),('Laksa','rwanda'),('Arepas','saint-kitts-and-nevis'),('Bao','saint-kitts-and-nevis'),('Fish and Chips','saint-lucia'),('Laksa','saint-vincent-and-the-grenadines'),('Pizza','saint-vincent-and-the-grenadines'),('Tamales','samoa'),('Gnocchi','sao-tome-and-principe'),('Coleslaw','senegal'),('Tonkatsu','serbia'),('Ceviche','seychelles'),('Tempura','seychelles'),('Crepes','sierra-leone'),('Haggis','slovakia'),('Bratwurst','slovenia'),('Baklava','solomon-islands'),('Hummus','solomon-islands'),('Pasta','solomon-islands'),('Quiche','solomon-islands'),('Kebab','somalia'),('Pad Thai','somalia'),('Salad','somalia'),('Pierogi','south-sudan'),('Tamales','south-sudan'),('Bento Box','spain'),('Goulash','spain'),('Carrot Cake','sri-lanka'),('Dolma','sri-lanka'),('Haggis','sudan'),('Nasi Goreng','sudan'),('Borscht','sweden'),('Pad Thai','sweden'),('Pasta','switzerland'),('Ratatouille','syria'),('Sticky Rice','syria'),('Cornbread','tajikistan'),('Spring Rolls','tajikistan'),('Crepes','thailand'),('Tabbouleh','thailand'),('Harira','tonga'),('Samosa','trinidad-and-tobago'),('Lamb Roast','turkey-turkiye'),('Churros','turkmenistan'),('Crepes','turkmenistan'),('Lamb Roast','turks-and-caicos-islands'),('Curry','united-arab-emirates'),('Pierogi','united-kingdom'),('Falafel','united-states'),('Samosa','united-states'),('Vindaloo','united-states'),('Banoffee Pie','uruguay'),('Coleslaw','uruguay'),('Gnocchi','uzbekistan'),('Arepas','vanuatu'),('Gelato','vanuatu'),('Spring Rolls','venezuela'),('Arepas','vietnam'),('Croissant','vietnam'),('Biryani','virgin-islands'),('Shakshuka','virgin-islands'),('Barbecue Ribs','west-bank'),('Coleslaw','west-bank'),('Jambalaya','yemen'),('Khachapuri','yemen'),('Crepes','zambia'),('Fried Chicken','zambia'),('Miso Soup','zambia'),('Samosa','zimbabwe');
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
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
