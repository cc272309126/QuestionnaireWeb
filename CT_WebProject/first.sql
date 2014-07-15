CREATE DATABASE  IF NOT EXISTS `webdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `webdb`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: webdb
-- ------------------------------------------------------
-- Server version	5.5.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `idAnswers` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) DEFAULT NULL,
  `answer` varchar(945) NOT NULL,
  `Questionare_idQuestionare` int(11) NOT NULL,
  `IPaddress` varchar(32) NOT NULL,
  PRIMARY KEY (`idAnswers`),
  KEY `fk_Answers_Questionare1_idx` (`Questionare_idQuestionare`),
  CONSTRAINT `fk_Answers_Questionare1` FOREIGN KEY (`Questionare_idQuestionare`) REFERENCES `questionaire` (`idQuestionare`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存放用户答案，userID不是外键，可谓空，为空';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionaire`
--

DROP TABLE IF EXISTS `questionaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionaire` (
  `idQuestionare` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `subject` varchar(45) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `launchdate` datetime NOT NULL,
  `isalive` tinyint(1) NOT NULL,
  `Users_idUsers` int(11) NOT NULL,
  PRIMARY KEY (`idQuestionare`),
  KEY `fk_Questionare_Users_idx` (`Users_idUsers`),
  CONSTRAINT `fk_Questionare_Users` FOREIGN KEY (`Users_idUsers`) REFERENCES `users` (`idUsers`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='调查表存放处，isa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionaire`
--

LOCK TABLES `questionaire` WRITE;
/*!40000 ALTER TABLE `questionaire` DISABLE KEYS */;
INSERT INTO `questionaire` VALUES (2,'closed','工资','生活','多少工资','2014-02-03 00:00:00','2014-05-07 00:00:00','2014-02-03 00:00:00',0,1),(5,'closed','怎么养生','Chanpinceshi','中国养生界',NULL,NULL,'2014-07-04 21:56:55',1,20),(6,'closed','我牛逼','Xueshujiaoyu','爆炸',NULL,NULL,'2014-07-04 22:05:07',1,21),(14,'closed','123','Manyidudiaocha','1223344',NULL,NULL,'2014-07-04 23:10:06',0,24),(15,'creating','123','Pinpaiyingxiao','1111',NULL,NULL,'2014-07-04 23:16:58',1,25),(17,'creating','123','Xiaofeizhefenxi','111111',NULL,NULL,'2014-07-04 23:41:25',1,25),(18,'creating','123','Xiaofeizhefenxi','111111',NULL,NULL,'2014-07-04 23:42:13',1,25),(19,'creating','123','Xiaofeizhefenxi','111111',NULL,NULL,'2014-07-04 23:42:20',1,25),(20,'creating','1','Pinpaiyingxiao','1111',NULL,NULL,'2014-07-04 23:42:47',1,25),(23,'creating','ff','Pinpaiyingxiao','',NULL,NULL,'2014-07-04 23:43:54',1,25),(24,'creating','ff','Pinpaiyingxiao','',NULL,NULL,'2014-07-04 23:44:04',1,25),(25,'creating','ff','Pinpaiyingxiao','',NULL,NULL,'2014-07-04 23:44:08',1,25),(26,'creating','ff','Pinpaiyingxiao','',NULL,NULL,'2014-07-04 23:44:36',1,25),(27,'creating','ff','Pinpaiyingxiao','',NULL,NULL,'2014-07-04 23:45:15',1,25),(28,'creating','ff','Pinpaiyingxiao','',NULL,NULL,'2014-07-04 23:45:17',1,25),(32,'creating','丰田','Pinpaiyingxiao','召回事件',NULL,NULL,'2014-07-05 08:50:36',1,26),(33,'creating','a','Pinpaiyingxiao','titlt',NULL,NULL,'2014-07-05 08:52:37',1,25),(34,'creating','1121','Pinpaiyingxiao','1231312',NULL,NULL,'2014-07-05 09:23:47',1,27),(35,'creating','23423','Pinpaiyingxiao','2342342',NULL,NULL,'2014-07-05 10:06:22',1,27),(36,'creating','sdfsdfsfdsfd','Chanpinceshi','sdfsfdadfsdfasdfadfasdf',NULL,NULL,'2014-07-05 10:12:53',1,27),(37,'creating','fsdf','Pinpaiyingxiao','sdfsdfs',NULL,NULL,'2014-07-05 10:18:33',1,27),(38,'creating','sddaaaa','Pinpaiyingxiao','aaaa',NULL,NULL,'2014-07-05 10:28:41',1,27),(39,'creating','aa','Pinpaiyingxiao','aa',NULL,NULL,'2014-07-05 10:30:11',1,27);
/*!40000 ALTER TABLE `questionaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `idQuestion` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `question` varchar(445) NOT NULL,
  `answers` varchar(445) DEFAULT NULL,
  `analysise` varchar(445) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `Questionare_idQuestionare` int(11) NOT NULL,
  PRIMARY KEY (`idQuestion`),
  KEY `fk_Questions_Questionare1_idx` (`Questionare_idQuestionare`),
  CONSTRAINT `fk_Questions_Questionare1` FOREIGN KEY (`Questionare_idQuestionare`) REFERENCES `questionaire` (`idQuestionare`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='存放问题，每一个表单的问题存放在此';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'多选','sdfsdfs','[1]sdfsdf[2]sdfsdf',NULL,1,36),(2,'多选','sdfsdfs','[1]sdfsdf[2]sdfsdf',NULL,1,36),(3,'单选','??','[1]?[2]?',NULL,1,39),(4,'多选','??','[1]?[2]?',NULL,2,39),(5,'判断','?','',NULL,3,39),(6,'问答','?','',NULL,4,39);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `idUsers` int(11) NOT NULL AUTO_INCREMENT,
  `usersname` varchar(45) DEFAULT NULL,
  `userAuthority` int(11) DEFAULT '1',
  `userpassword` varchar(45) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `address` varchar(145) DEFAULT NULL,
  `isonline` tinyint(1) NOT NULL,
  `isalive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idUsers`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='用户表，userauthority 存放用户权限，1为普通用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'hhl',2,'199281',1,22,'344',1,1),(3,'js',1,'199281',1,21,'244',0,0),(6,'rejohn1',1,'123456',1,22,'china',0,1),(19,'测试一下',1,'123456',1,22,'发现在哪里',0,1),(20,'黄海亮',1,'199281abc',1,22,'344',0,1),(21,'admin',1,'admin ',1,12,'123',0,1),(24,'10211071',1,'123456789zft',1,10,'北航北航',0,0),(25,'江山寒树',1,'111111',1,12,'11111',0,1),(26,'零下10度',1,'123456',0,21,'北京',0,1),(27,'11211071',1,'123456',1,22,'北航',0,1);
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

-- Dump completed on 2014-07-05 11:41:31
