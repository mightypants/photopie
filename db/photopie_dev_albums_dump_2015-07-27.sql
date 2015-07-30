-- MySQL dump 10.13  Distrib 5.6.25, for osx10.8 (x86_64)
--
-- Host: localhost    Database: photopie_development
-- ------------------------------------------------------
-- Server version	5.6.25

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
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cover` int(11) NOT NULL DEFAULT '0',
  `visibility` varchar(255) DEFAULT 'private',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_pie_album` tinyint(1) DEFAULT '1',
  `subject_first` varchar(255) DEFAULT NULL,
  `subject_middle` varchar(255) DEFAULT NULL,
  `subject_last` varchar(255) DEFAULT NULL,
  `subject_dob` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_albums_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,'test album',1,0,'private','2015-07-20 13:06:48','2015-07-20 13:06:48',1,NULL,NULL,NULL,NULL),(6,'another test',1,0,'private','2015-07-22 00:11:38','2015-07-22 00:11:38',1,NULL,NULL,NULL,NULL),(7,'another test',1,0,'private','2015-07-22 00:15:11','2015-07-22 00:15:11',1,NULL,NULL,NULL,NULL),(8,'another test',1,0,'private','2015-07-22 00:19:38','2015-07-22 00:19:38',1,NULL,NULL,NULL,NULL),(9,'moooore test',1,0,'private','2015-07-22 00:30:29','2015-07-22 00:30:29',1,NULL,NULL,NULL,NULL),(10,'buuuu',1,0,'private','2015-07-22 01:22:46','2015-07-22 01:22:46',1,NULL,NULL,NULL,NULL),(11,'Mo',1,0,'private','2015-07-22 01:23:05','2015-07-22 01:23:05',1,NULL,NULL,NULL,NULL),(13,'',1,0,'0','2015-07-23 00:19:36','2015-07-23 00:19:36',1,'Morgan','Paul','Dredge','2014-09-03'),(14,'dddd',1,0,'0','2015-07-27 12:39:12','2015-07-27 12:39:12',1,'dddd','dddd','dddd','2015-07-27'),(15,'dd',1,0,'private','2015-07-27 12:41:01','2015-07-27 12:41:01',1,'dddd','ddddd','ddddd','2015-07-27'),(16,'eee',1,0,'private','2015-07-27 13:06:06','2015-07-27 13:06:06',1,'eeee','eee','rrrr','2015-07-27'),(17,'dddsafdsf',1,0,'private','2015-07-27 13:07:13','2015-07-27 13:07:13',1,'ss','sf','gg','2015-07-27'),(18,'eee',1,0,'private','2015-07-27 13:13:24','2015-07-27 13:13:24',1,'jkljk','tknkt','ntnt','2015-07-27'),(19,'rrrr',1,0,'private','2015-07-27 23:30:27','2015-07-27 23:30:27',1,'rrrrrrr','rrrwre','rewrew','2015-07-27');
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-27 21:43:32
