-- MyS44444QL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: superleague
-- ------------------------------------------------------
-- Server version	8.0.25teamscards
DROP SCHEMA IF EXISTS mydb;
CREATE SCHEMA mydb;
USE mydb;

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
-- Table structure for table `achievements`
--

DROP TABLE IF EXISTS `achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievements` (
  `Achievement_ID` int NOT NULL AUTO_INCREMENT,
  `Competition` enum('SuperLeague','Greek Cup') DEFAULT NULL,
  `Season` enum('2018-19','2019-20','2020-21','2021-22','2022-23') DEFAULT NULL,
  `Team_ID` int NOT NULL,
  PRIMARY KEY (`Achievement_ID`),
  KEY `fk_Achievements_Teams1_idx` (`Team_ID`),
  CONSTRAINT `fk_Achievements_Teams1` FOREIGN KEY (`Team_ID`) REFERENCES `teams` (`Team_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievements`
--

LOCK TABLES `achievements` WRITE;
/*!40000 ALTER TABLE `achievements` DISABLE KEYS */;
INSERT INTO `achievements` VALUES (1,'SuperLeague','2018-19',800435593),(2,'Greek Cup','2018-19',800435593),(3,'SuperLeague','2019-20',997350594),(4,'Greek Cup','2020-21',800435593),(5,'Greek Cup','2021-22',997350594);
/*!40000 ALTER TABLE `achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appearances`
--

DROP TABLE IF EXISTS `appearances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appearances` (
  `From_Minute` int DEFAULT NULL,
  `To_Minute` int DEFAULT NULL,
  `ApPlayer_ID` int NOT NULL,
  `ApGame_ID` int NOT NULL,
  PRIMARY KEY (`ApPlayer_ID`,`ApGame_ID`),
  KEY `fk_Player_Plays_Match_Matches1_idx` (`ApGame_ID`),
  CONSTRAINT `fk_Player_Plays_Match_Matches1` FOREIGN KEY (`ApGame_ID`) REFERENCES `games` (`Game_ID`),
  CONSTRAINT `fk_Player_Plays_Match_Players1` FOREIGN KEY (`ApPlayer_ID`) REFERENCES `players` (`Player_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appearances`
--

LOCK TABLES `appearances` WRITE;
/*!40000 ALTER TABLE `appearances` DISABLE KEYS */;
INSERT INTO `appearances` VALUES (0,90,1,1),(81,90,1,2),(0,90,1,3),(0,66,1,6),(0,74,1,7),(0,90,1,8),(0,81,2,2),(0,19,2,7),(59,90,3,1),(0,90,3,2),(0,90,3,3),(67,90,3,6),(0,66,3,7),(0,90,3,8),(63,90,4,1),(0,51,4,6),(0,90,5,1),(0,90,5,2),(0,90,5,6),(0,90,5,7),(0,90,6,2),(83,90,6,10),(0,81,7,1),(0,85,7,2),(0,67,7,3),(0,90,7,9),(0,84,7,10),(0,61,7,11),(0,63,8,2),(0,74,8,3),(0,83,8,10),(0,79,8,11),(46,90,9,1),(0,90,9,9),(0,90,10,10),(82,90,11,6),(0,82,11,7),(89,90,11,9),(46,90,11,10),(0,60,11,11),(0,90,12,6),(0,56,12,7),(0,86,12,8),(0,89,12,9),(0,90,12,10),(60,90,12,11),(0,90,13,6),(0,56,13,7),(0,60,13,8),(0,90,13,9),(0,85,13,10),(0,77,13,11),(0,89,14,6),(0,90,14,7),(0,90,14,8),(0,90,14,9),(0,90,14,10),(78,90,14,11),(89,90,15,6),(0,90,15,10),(0,71,15,11),(0,82,16,6),(0,80,16,9),(0,83,17,6),(0,80,17,9);
/*!40000 ALTER TABLE `appearances` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `appearances_BEFORE_INSERT` BEFORE INSERT ON `appearances` FOR EACH ROW BEGIN
 IF( NEW.From_Minute > 90 OR NEW.From_Minute < 0) THEN
 SIGNAL sqlstate '45000' SET  MESSAGE_TEXT = 'Invalid Data';
 END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `appearances_BEFORE_INSERT_1` BEFORE INSERT ON `appearances` FOR EACH ROW BEGIN
 IF( NEW.To_Minute > 90 OR NEW.To_Minute < 0) THEN
 SIGNAL sqlstate '45000' SET  MESSAGE_TEXT = 'Invalid Data';
 END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `appearances_BEFORE_UPDATE` BEFORE UPDATE ON `appearances` FOR EACH ROW BEGIN
 IF( NEW.To_Minute > 90 OR NEW.To_Minute < 0) THEN
 SIGNAL sqlstate '45000' SET  MESSAGE_TEXT = 'Invalid Data';
 END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `appearances_BEFORE_UPDATE_1` BEFORE UPDATE ON `appearances` FOR EACH ROW BEGIN
 IF( NEW.From_Minute > 90 OR NEW.From_Minute < 0) THEN
 SIGNAL sqlstate '45000' SET  MESSAGE_TEXT = 'Invalid Data';
 END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cards` (
  `Card_ID` int NOT NULL AUTO_INCREMENT,
  `Type` enum('Yellow','Second_Yellow/Red','Red') DEFAULT NULL,
  `Minute` int DEFAULT NULL,
  `OnPlayer_ID` int NOT NULL,
  `OnGame_ID` int NOT NULL,
  PRIMARY KEY (`Card_ID`),
  KEY `fk_Cards_Players1_idx` (`OnPlayer_ID`),
  KEY `fk_Cards_Matches1_idx` (`OnGame_ID`),
  CONSTRAINT `fk_Cards_Matches1` FOREIGN KEY (`OnGame_ID`) REFERENCES `games` (`Game_ID`),
  CONSTRAINT `fk_Cards_Players1` FOREIGN KEY (`OnPlayer_ID`) REFERENCES `players` (`Player_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
INSERT INTO `cards` VALUES (1,'Yellow',90,1,1),(2,'Yellow',90,5,1),(3,'Yellow',75,9,1),(4,'Yellow',83,1,3),(5,'Yellow',51,4,6),(6,'Yellow',63,16,6),(7,'Yellow',81,17,6),(8,'Yellow',11,13,7),(9,'Yellow',73,9,9),(10,'Yellow',54,14,9),(11,'Yellow',54,11,11),(12,'Second_Yellow/Red',90,9,1),(13,'Red',19,2,7);
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cards_BEFORE_INSERT` BEFORE INSERT ON `cards` FOR EACH ROW BEGIN
 IF( NEW.minute > 90 OR NEW.minute < 0) THEN
 SIGNAL sqlstate '45000' SET  MESSAGE_TEXT = 'Invalid Data';
 END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cards_BEFORE_UPDATE` BEFORE UPDATE ON `cards` FOR EACH ROW BEGIN
 IF( NEW.minute > 90 OR NEW.minute < 0) THEN
 SIGNAL sqlstate '45000' SET  MESSAGE_TEXT = 'Invalid Data';
 END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `coaches`
--

DROP TABLE IF EXISTS `coaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coaches` (
  `Coach_ID` int NOT NULL,
  `Name` varchar(25) DEFAULT NULL,
  `Birth_Date` date DEFAULT NULL,
  `Nationality` varchar(25) DEFAULT NULL,
  `Team_ID` int NOT NULL,
  PRIMARY KEY (`Coach_ID`),
  KEY `fk_Coaches_Teams1_idx` (`Team_ID`),
  CONSTRAINT `fk_Coaches_Teams1` FOREIGN KEY (`Team_ID`) REFERENCES `teams` (`Team_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches`
--

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;
INSERT INTO `coaches` VALUES (1,'Razvan Lucescu','1978-11-28','Romania',800435593),(2,'Alan Pardew','1961-07-18','England',997350594),(3,'Matías Almeyda','1973-12-21','Argentina',997364193);
/*!40000 ALTER TABLE `coaches` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `coaches_BEFORE_INSERT` BEFORE INSERT ON `coaches` FOR EACH ROW BEGIN
 IF(New.Birth_Date > '2022-12-20') THEN
 SIGNAL sqlstate '45000' SET  MESSAGE_TEXT = 'Invalid Data';
 END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `coaches_BEFORE_UPDATE` BEFORE UPDATE ON `coaches` FOR EACH ROW BEGIN
 IF(New.Birth_Date > '2022-12-20') THEN
 SIGNAL sqlstate '45000' SET  MESSAGE_TEXT = 'Invalid Data';
 END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts` (
  `Contract_ID` int NOT NULL AUTO_INCREMENT,
  `ConPlayer_ID` int NOT NULL,
  `ConTeam_ID` int NOT NULL,
  `From_Date` date DEFAULT NULL,
  `To_Date` date DEFAULT NULL,
  `Shirt_Number` int DEFAULT NULL,
  PRIMARY KEY (`Contract_ID`),
  KEY `fk_Player_has_Team_Team1_idx` (`ConTeam_ID`),
  KEY `fk_Player_has_Team_Player1_idx` (`ConPlayer_ID`),
  CONSTRAINT `fk_Player_has_Team_Player1` FOREIGN KEY (`ConPlayer_ID`) REFERENCES `players` (`Player_ID`),
  CONSTRAINT `fk_Player_has_Team_Team1` FOREIGN KEY (`ConTeam_ID`) REFERENCES `teams` (`Team_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts`
--

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
INSERT INTO `contracts` VALUES (1,1,800435593,'2021-07-18',NULL,27),(2,2,800435593,NULL,'2022-09-01',51),(3,3,800435593,'2016-07-01',NULL,21),(4,4,800435593,'2021-07-09',NULL,9),(5,4,997364193,'2019-07-20','2021-07-09',9),(6,5,800435593,'2019-01-31',NULL,4),(7,6,997350594,'2020-08-05','2022-07-01',66),(8,7,997350594,'2019-08-27',NULL,7),(9,8,997350594,'2021-07-22','2022-07-01',17),(10,9,997350594,'2022-05-07',NULL,6),(11,10,997350594,'2021-07-30','2022-07-01',15),(12,11,997364193,'2014-07-01',NULL,20),(13,12,997364193,'2020-09-16',NULL,7),(14,13,997364193,'2020-06-30','2020-07-01',4),(15,14,997364193,'2020-01-31',NULL,11),(16,15,997364193,'2021-07-01',NULL,24),(17,16,997364193,'2021-07-01',NULL,8),(18,17,997364193,'2022-08-29',NULL,19);
/*!40000 ALTER TABLE `contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `Game_ID` int NOT NULL AUTO_INCREMENT,
  `Season` enum('2018-19','2019-20','2020-21','2021-22','2022-23') DEFAULT NULL,
  `MatchWeek` int DEFAULT NULL,
  `DateTime` datetime DEFAULT NULL,
  `Home_Team_ID` int NOT NULL,
  `Away_Team_ID` int NOT NULL,
  PRIMARY KEY (`Game_ID`),
  KEY `fk_Matches_Teams1_idx` (`Home_Team_ID`),
  KEY `fk_Matches_Teams2_idx` (`Away_Team_ID`),
  CONSTRAINT `fk_Matches_Teams1` FOREIGN KEY (`Home_Team_ID`) REFERENCES `teams` (`Team_ID`),
  CONSTRAINT `fk_Matches_Teams2` FOREIGN KEY (`Away_Team_ID`) REFERENCES `teams` (`Team_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,'2022-23',3,'2022-09-04 21:30:00',997350594,800435593),(2,'2021-22',24,'2022-02-20 19:30:00',997350594,800435593),(3,'2021-22',11,'2021-11-28 19:30:00',800435593,997350594),(4,'2022-23',16,'2023-01-04 19:00:00',800435593,997350594),(5,'2022-23',23,'2023-02-18 19:00:00',800435593,997364193),(6,'2022-23',10,'2022-10-30 19:00:00',997364193,800435593),(7,'2021-22',17,'2022-03-02 20:30:00',997364193,800435593),(8,'2021-22',4,'2021-09-26 20:30:00',800435593,997364193),(9,'2022-23',7,'2022-10-09 21:15:00',997350594,997364193),(10,'2021-22',21,'2022-02-02 19:30:00',997350594,997364193),(11,'2021-22',8,'2021-10-31 19:30:00',997364193,997350594),(12,'2022-23',20,'2023-01-28 19:00:00',997364193,997350594);
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `gameteams`
--

DROP TABLE IF EXISTS `gameteams`;
/*!50001 DROP VIEW IF EXISTS `gameteams`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `gameteams` AS SELECT 
 1 AS `GAME`,
 1 AS `HOME`,
 1 AS `AWAY`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `goals`
--

DROP TABLE IF EXISTS `goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goals` (
  `Goal_ID` int NOT NULL AUTO_INCREMENT,
  `Minute` int DEFAULT NULL,
  `ForTeam` enum('HomeTeam','AwayTeam') DEFAULT NULL,
  `Scorer_ID` int NOT NULL,
  `Assister_ID` int DEFAULT NULL,
  `OnGame_ID` int NOT NULL,
  `Type` enum('Goal','Penalty_Goal','Own_Goal') DEFAULT NULL,
  PRIMARY KEY (`Goal_ID`),
  KEY `fk_Goals_Players1_idx` (`Scorer_ID`),
  KEY `fk_Goals_Players2_idx` (`Assister_ID`),
  KEY `fk_Goals_Matches1_idx` (`OnGame_ID`),
  CONSTRAINT `fk_Goals_Matches1` FOREIGN KEY (`OnGame_ID`) REFERENCES `games` (`Game_ID`),
  CONSTRAINT `fk_Goals_Players1` FOREIGN KEY (`Scorer_ID`) REFERENCES `players` (`Player_ID`),
  CONSTRAINT `fk_Goals_Players2` FOREIGN KEY (`Assister_ID`) REFERENCES `players` (`Player_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goals`
--

LOCK TABLES `goals` WRITE;
/*!40000 ALTER TABLE `goals` DISABLE KEYS */;
INSERT INTO `goals` VALUES (1,41,'AwayTeam',7,8,3,'Goal'),(2,36,'HomeTeam',12,17,6,'Penalty_Goal'),(3,61,'HomeTeam',16,17,6,'Penalty_Goal'),(4,28,'HomeTeam',12,11,7,'Goal'),(5,36,'AwayTeam',1,NULL,7,'Goal'),(6,42,'HomeTeam',3,1,8,'Goal'),(7,79,'HomeTeam',1,NULL,8,'Penalty_Goal'),(8,28,'AwayTeam',13,16,9,'Goal'),(9,50,'AwayTeam',12,NULL,9,'Goal'),(10,44,'HomeTeam',8,NULL,10,'Goal'),(11,85,'AwayTeam',14,NULL,10,'Goal'),(12,90,'HomeTeam',6,NULL,10,'Goal'),(13,15,'HomeTeam',15,11,11,'Goal'),(14,37,'HomeTeam',11,NULL,11,'Goal'),(15,73,'AwayTeam',8,NULL,11,'Goal');
/*!40000 ALTER TABLE `goals` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `goals_BEFORE_INSERT` BEFORE INSERT ON `goals` FOR EACH ROW BEGIN
 IF( NEW.minute > 90 OR NEW.minute < 0) THEN
 SIGNAL sqlstate '45000' SET  MESSAGE_TEXT = 'Invalid Data';
 END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `goals_BEFORE_UPDATE` BEFORE UPDATE ON `goals` FOR EACH ROW BEGIN
 IF( NEW.minute > 90 OR NEW.minute < 0) THEN
 SIGNAL sqlstate '45000' SET  MESSAGE_TEXT = 'Invalid Data';
 END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `goalteam`
--

DROP TABLE IF EXISTS `goalteam`;
/*!50001 DROP VIEW IF EXISTS `goalteam`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `goalteam` AS SELECT 
 1 AS `Team`,
 1 AS `GOAL`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `Player_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) DEFAULT NULL,
  `Birth_Date` date DEFAULT NULL,
  `Nationality` varchar(25) DEFAULT NULL,
  `Main_Position` enum('ST','MD','DE','GK') DEFAULT NULL,
  PRIMARY KEY (`Player_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Jasmin Kurtic','1998-01-10','Slovenia','MD'),(2,'Theocharis Tsingaras','2000-08-20','Greece','MD'),(3,'Diego Biseswar','1998-03-08','Suriname','MD'),(4,'Oliveira Nelson','1991-08-08','Portugal','ST'),(5,'Sverrir Ingi Ingason','1993-08-05','Iceland','DE'),(6,'Emanuel Sakic','1991-01-25','Austria','DE'),(7,'Daniel Mancini','1996-11-11','Argentina','MD'),(8,'Badou Ndiaye','1990-10-27','Senegal','MD'),(9,'Bryan Dabo','1192-02-18','Burkina Faso','MD'),(10,'Lumor Agbenyenu','1996-08-15','Ghana','DE'),(11,'Petros Mantalos','1991-08-31','Greece','MD'),(12,'Levi Garcia','1197-11-20','Trinidad and Tobago','ST'),(13,'Damian Szymanski','1995-06-16','Poland','MD'),(14,'Sergio Araujo','1992-01-28','Argentina','ST'),(15,'Gerasimos Mitoglou','1999-10-20','Greece','DE'),(16,'Mijat Gacinovic','1995-02-08','Serbia','MD'),(17,'Niclas Eliasson','1995-12-07','Sweden','MD');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `players_BEFORE_INSERT` BEFORE INSERT ON `players` FOR EACH ROW BEGIN
IF(New.Birth_Date > '2022-12-20') THEN
 SIGNAL sqlstate '45000' SET  MESSAGE_TEXT = 'Invalid Data';
 END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `players_BEFORE_UPDATE` BEFORE UPDATE ON `players` FOR EACH ROW BEGIN
IF(New.Birth_Date > '2022-12-20') THEN
 SIGNAL sqlstate '45000' SET  MESSAGE_TEXT = 'Invalid Data';
 END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `playerteam`
--

DROP TABLE IF EXISTS `playerteam`;
/*!50001 DROP VIEW IF EXISTS `playerteam`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `playerteam` AS SELECT 
 1 AS `Pl_ID`,
 1 AS `Player`,
 1 AS `T_ID`,
 1 AS `Team`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `stadiums`
--

DROP TABLE IF EXISTS `stadiums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadiums` (
  `Name` varchar(25) NOT NULL,
  `Capacity` int DEFAULT NULL,
  `Street` varchar(25) DEFAULT NULL,
  `City` varchar(25) DEFAULT NULL,
  `ZIP` int DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadiums`
--

LOCK TABLES `stadiums` WRITE;
/*!40000 ALTER TABLE `stadiums` DISABLE KEYS */;
INSERT INTO `stadiums` VALUES ('Γήπεδο Τούμπας',28000,'Μικράς Ασίας 1','Θεσσαλονίκη',54454),('Ολυμπιακό Στάδιο Ο.Α.Κ.Α.',70000,'Κηφισίας 37','Αθήνα',15123),('Στάδιο Κλεάνθης Βικελίδης',23000,'Αλ. Παπαναστασίου 154','Θεσσαλονίκη',54249);
/*!40000 ALTER TABLE `stadiums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `Team_ID` int NOT NULL,
  `Full_Name` varchar(60) DEFAULT NULL,
  `Short_Name` char(4) DEFAULT NULL,
  `Year_Founded` int DEFAULT NULL,
  `City` varchar(25) DEFAULT NULL,
  `Stadium_Name` varchar(25) NOT NULL,
  PRIMARY KEY (`Team_ID`),
  KEY `fk_Teams_Stadiums1_idx` (`Stadium_Name`),
  CONSTRAINT `fk_Teams_Stadiums1` FOREIGN KEY (`Stadium_Name`) REFERENCES `stadiums` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (800435593,'Πανθεσσαλονίκειος Αθλητικός Όμιλος Κωνσταντινουπολιτών','ΠΑΟΚ',1926,'Θεσσαλονίκη','Γήπεδο Τούμπας'),(997350594,'Άρης Θεσσαλονίκης','ΑΡΗΣ',2016,'Θεσσαλονίκη','Στάδιο Κλεάνθης Βικελίδης'),(997364193,'Αθλητική Ένωσις Κωνσταντινουπόλεως','ΑΕΚ',2014,'Νέα Φιλαδέλφεια','Ολυμπιακό Στάδιο Ο.Α.Κ.Α.');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `gameteams`
--

/*!50001 DROP VIEW IF EXISTS `gameteams`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `gameteams` AS select `games`.`Game_ID` AS `GAME`,`teams`.`Short_Name` AS `HOME`,`d`.`Short_Name` AS `AWAY` from ((`games` join `teams` on((`games`.`Home_Team_ID` = `teams`.`Team_ID`))) join `teams` `d` on((`games`.`Away_Team_ID` = `d`.`Team_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `goalteam`
--

/*!50001 DROP VIEW IF EXISTS `goalteam`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `goalteam` AS select `teams`.`Short_Name` AS `Team`,`goals`.`Goal_ID` AS `GOAL` from ((`games` join `goals` on((`goals`.`OnGame_ID` = `games`.`Game_ID`))) join `teams` on((`games`.`Home_Team_ID` = `teams`.`Team_ID`))) where (`goals`.`ForTeam` = 'HomeTeam') union select `teams`.`Short_Name` AS `Short_Name`,`goals`.`Goal_ID` AS `Goal_ID` from ((`games` join `goals` on((`goals`.`OnGame_ID` = `games`.`Game_ID`))) join `teams` on((`games`.`Away_Team_ID` = `teams`.`Team_ID`))) where (`goals`.`ForTeam` = 'AwayTeam') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `playerteam`
--

/*!50001 DROP VIEW IF EXISTS `playerteam`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `playerteam` AS select `players`.`Player_ID` AS `Pl_ID`,`players`.`Name` AS `Player`,`teams`.`Team_ID` AS `T_ID`,`teams`.`Short_Name` AS `Team` from ((`players` join `contracts` on((`players`.`Player_ID` = `contracts`.`ConPlayer_ID`))) join `teams` on((`teams`.`Team_ID` = `contracts`.`ConTeam_ID`))) where `contracts`.`Contract_ID` in (select `contracts`.`Contract_ID` from `contracts` where (`contracts`.`To_Date` < now())) is false */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-20 14:53:10
