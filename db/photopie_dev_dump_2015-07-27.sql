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
-- Table structure for table `albums_photos`
--

DROP TABLE IF EXISTS `albums_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums_photos` (
  `album_id` int(11) DEFAULT NULL,
  `photo_id` int(11) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  KEY `index_albums_photos_on_album_id_and_photo_id` (`album_id`,`photo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums_photos`
--

LOCK TABLES `albums_photos` WRITE;
/*!40000 ALTER TABLE `albums_photos` DISABLE KEYS */;
INSERT INTO `albums_photos` VALUES (11,1,NULL),(11,2,NULL),(11,3,NULL);
/*!40000 ALTER TABLE `albums_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums_users`
--

DROP TABLE IF EXISTS `albums_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums_users` (
  `album_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  KEY `index_albums_users_on_album_id_and_user_id` (`album_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums_users`
--

LOCK TABLES `albums_users` WRITE;
/*!40000 ALTER TABLE `albums_users` DISABLE KEYS */;
INSERT INTO `albums_users` VALUES (8,1),(9,1),(10,1),(11,1),(13,1),(15,1),(19,1);
/*!40000 ALTER TABLE `albums_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filepath` varchar(255) NOT NULL,
  `filetype` varchar(255) DEFAULT 'image',
  `user_id` int(11) NOT NULL,
  `meta_timestamp` date DEFAULT NULL,
  `user_timestamp` date DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `caption` text,
  `tags` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_photos_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,'10613056_10100589886938779_5282107778011036776_n.jpg','image',1,NULL,'2014-09-10',720,960,'Mo at one week old.',NULL,'2015-07-16 02:38:42','2015-07-16 02:38:42'),(2,'1800487_10100589886958739_933511704286604079_n.jpg','image',1,NULL,'2014-09-17',720,960,'Mo at two weeks',NULL,'2015-07-16 00:00:00','2015-07-16 00:00:00'),(3,'10615608_10100589886953749_8598423833627005820_n.jpg','image',1,NULL,'2014-09-24',720,960,'Mo at three weeks',NULL,'2015-07-16 00:00:00','2015-07-16 00:00:00');
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `birth_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `pie_album` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_subjects_on_user_id` (`user_id`),
  KEY `index_subjects_on_pie_album` (`pie_album`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Morgan','Paul','Dredge','2014-09-03',1,NULL,'2015-07-16 02:38:35','2015-07-16 02:38:35');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(40) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jslice','mrmightypants@gmail.com','Jonnie','Dredge','2015-07-15 15:24:04','2015-07-23 11:59:33','$2a$10$LIWvx89xm18STOYy71qf2uQJkgYpY2bJrmI/wtALujYTbNoIYfh6.',NULL),(2,'slappy','sarah.vincelett@gmail.com','Sarah','Dredge','2015-07-18 14:35:08','2015-07-18 14:35:08',NULL,NULL),(3,'someguy','sg@ss.com','some','duuude','2015-07-19 14:36:13','2015-07-19 15:32:46',NULL,NULL),(6,'slappy2','aa@bb.cc','fdkjk','fjkdfjl','2015-07-23 01:21:44','2015-07-23 01:21:44',NULL,NULL),(7,'slappy23','aa@bb.cc','fdkjk','fjkdfjl','2015-07-23 01:21:59','2015-07-23 01:21:59',NULL,NULL);
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

-- Dump completed on 2015-07-27 21:43:04
