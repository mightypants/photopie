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
-- Table structure for table `album_photos`
--

DROP TABLE IF EXISTS `album_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) DEFAULT NULL,
  `photo_id` int(11) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_album_photos_on_album_id_and_photo_id` (`album_id`,`photo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_photos`
--

LOCK TABLES `album_photos` WRITE;
/*!40000 ALTER TABLE `album_photos` DISABLE KEYS */;
INSERT INTO `album_photos` VALUES (1,1,1,0,'2015-07-30 13:47:17','2015-07-30 13:47:17'),(2,1,2,0,'2015-07-30 13:47:23','2015-07-30 13:47:23'),(3,1,3,0,'2015-07-30 13:47:29','2015-07-30 13:47:29');
/*!40000 ALTER TABLE `album_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album_users`
--

DROP TABLE IF EXISTS `album_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `access_type` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_album_users_on_album_id_and_user_id` (`album_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_users`
--

LOCK TABLES `album_users` WRITE;
/*!40000 ALTER TABLE `album_users` DISABLE KEYS */;
INSERT INTO `album_users` VALUES (1,1,1,2,'2015-07-30 13:24:27','2015-07-30 13:24:27'),(2,2,1,2,'2015-07-31 11:50:42','2015-07-31 11:50:42'),(3,3,1,2,'2015-07-31 12:11:33','2015-07-31 12:11:33'),(4,4,1,2,'2015-07-31 12:12:37','2015-07-31 12:12:37');
/*!40000 ALTER TABLE `album_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `cover` int(11) NOT NULL DEFAULT '0',
  `visibility` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_pie_album` tinyint(1) DEFAULT '1',
  `subject_first` varchar(255) DEFAULT NULL,
  `subject_middle` varchar(255) DEFAULT NULL,
  `subject_last` varchar(255) DEFAULT NULL,
  `subject_dob` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,'booorb',0,0,'2015-07-30 13:24:26','2015-07-30 13:24:26',1,'Morgan','Paul','Dredge','2015-07-30'),(2,'dddd',0,0,'2015-07-31 11:50:42','2015-07-31 11:50:42',1,'dfdfs','gfdg','fgdfgf','2015-07-31'),(3,'sdfdd',0,0,'2015-07-31 12:11:33','2015-07-31 12:11:33',1,'sdfdsf','fdsffdsf','ddddd','2015-07-31'),(4,'dfdfs',0,0,'2015-07-31 12:12:37','2015-07-31 12:12:37',1,'eeee','eeee','444wwfe','2015-07-31');
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `image_file_name` varchar(255) DEFAULT NULL,
  `image_content_type` varchar(255) DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_photos_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,'image',1,NULL,'2014-09-10',720,960,'Mo at one week old.',NULL,'2015-07-16 02:38:42','2015-07-16 02:38:42',NULL,NULL,NULL,NULL),(2,'image',1,NULL,'2014-09-17',720,960,'Mo at two weeks',NULL,'2015-07-16 00:00:00','2015-07-16 00:00:00',NULL,NULL,NULL,NULL),(3,'image',1,NULL,'2014-09-24',720,960,'Mo at three weeks',NULL,'2015-07-16 00:00:00','2015-07-16 00:00:00',NULL,NULL,NULL,NULL),(4,'image',1,NULL,NULL,NULL,NULL,'test photo',NULL,'2015-08-01 01:07:07','2015-08-01 01:07:07',NULL,NULL,NULL,NULL),(5,'image',1,NULL,NULL,NULL,NULL,'lalalalalla',NULL,'2015-08-01 01:12:12','2015-08-01 01:12:12',NULL,NULL,NULL,NULL),(6,'image',1,NULL,NULL,NULL,NULL,'lalalalalla',NULL,'2015-08-01 01:14:41','2015-08-01 01:14:41',NULL,NULL,NULL,NULL),(7,'image',1,NULL,NULL,NULL,NULL,'sdfdfdasdf',NULL,'2015-08-01 01:17:10','2015-08-01 01:17:10',NULL,NULL,NULL,NULL),(8,'image',1,NULL,NULL,NULL,NULL,NULL,NULL,'2015-08-01 23:19:37','2015-08-01 23:19:37',NULL,NULL,NULL,NULL),(9,'image',1,NULL,NULL,NULL,NULL,'fdfasdfda',NULL,'2015-08-01 23:27:52','2015-08-01 23:27:52',NULL,NULL,NULL,NULL),(10,'image',1,NULL,NULL,NULL,NULL,'fdsafsdfa',NULL,'2015-08-01 23:38:17','2015-08-01 23:38:17','Photo_on_7-31-15_at_8.13_PM.jpg','image/jpeg',170225,'2015-08-01 23:38:17');
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20150715141244'),('20150715143114'),('20150715234841'),('20150722125346'),('20150723022631'),('20150728021104'),('20150728021129'),('20150801003631');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jslice','mrmightypants@gmail.com','Jonnie','Dredge','2015-07-15 15:24:04','2015-07-31 12:32:27','$2a$10$bOQ.Wmj2o9WLaR6nNoJdpOUv92Wd6viaszp9WsA0VCtAvhbbPe3oy',NULL),(2,'slappy','sarah.vincelett@gmail.com','Sarah','Dredge','2015-07-18 14:35:08','2015-07-18 14:35:08',NULL,NULL),(3,'someguy','sg@ss.com','some','duuude','2015-07-19 14:36:13','2015-07-19 15:32:46',NULL,NULL),(6,'slappy2','aa@bb.cc','fdkjk','fjkdfjl','2015-07-23 01:21:44','2015-07-23 01:21:44',NULL,NULL),(7,'slappy23','aa@bb.cc','fdkjk','fjkdfjl','2015-07-23 01:21:59','2015-07-23 01:21:59',NULL,NULL),(8,'buuuuuh','uuuh@nnn.ccc','stinky','weasel','2015-07-31 12:39:11','2015-07-31 12:39:11','$2a$10$TPEaW9GpG0kEGc7FR2V8IeYlGGYzNZS6.yLzjTfdosmXIBf.zRVUW',NULL);
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

-- Dump completed on 2015-08-01 19:41:56
