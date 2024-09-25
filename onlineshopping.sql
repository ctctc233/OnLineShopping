-- MySQL dump 10.13  Distrib 5.7.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: onlineshopping
-- ------------------------------------------------------
-- Server version	5.7.30-log

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
-- Table structure for table `cart_good`
--

DROP TABLE IF EXISTS `cart_good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_good` (
  `goods_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sp_cart_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`goods_id`,`sp_cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_good`
--

LOCK TABLES `cart_good` WRITE;
/*!40000 ALTER TABLE `cart_good` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `goods_detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES ('6500',1,'天选三','天选.jpg','白青天选三好看捏'),('3200',2,'Smartphone','智能手机.jpg','智能手机好看捏'),('9900',4,'Desktop Computer','台式电脑.jpg','台式电脑好看捏'),('14.99',5,'Monitor','monitor.jpg',NULL),('24.99',9,'External Hard Drive','harddrive.jpg',NULL),('4.99',10,'USB Flash Drive','flashdrive.jpg',NULL),('50',11,'三只松鼠 坚果','laptop.jpg','坚果零食'),('90',12,'猪肉铺 肉条','smartphone.jpg','肉条'),('80',13,'认养一头牛 牛奶','tablet.jpg','牛奶'),('999',17,'Ciallo～','1.jpg','354\r\n3'),('1',18,'辣条',NULL,'童年回忆'),('568',19,'佛跳墙',NULL,'特色食品'),('30',20,'烤八目鳗',NULL,'鲜美'),('1024',21,'格力空调',NULL,'海尔兄弟嗷');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `goods_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `goods_num` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`goods_id`,`order_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES ('1','2024062473F4D',NULL),('1','202406247488E',NULL),('1','202406248E487',NULL),('1','20240624B1144',NULL),('1','202406250D303','1'),('1','202406257CC94','5'),('1','20240625EB7C4',NULL),('1','20240625FE9F1','5'),('1','2024062628B69','1'),('1','202406263D3D9','1'),('1','20240626557F3','1'),('1','20240626C06BF','12'),('2','2024062473F4D',NULL),('2','202406247488E',NULL),('2','20240624B1144',NULL),('2','20240624E55B3',NULL),('2','202406257CC94','3'),('2','20240625EB7C4',NULL),('2','2024062628B69','1'),('2','20240626557F3','2'),('4','202406248E487',NULL),('4','20240624E55B3',NULL),('4','202406258F11B','4'),('4','20240625FE9F1','5'),('4','2024062628B69','29'),('4','20240626557F3','4'),('4','20240626682AC','9'),('5','202406248E487',NULL),('5','202406250D303','3'),('5','202406258F11B','4'),('5','20240625FE9F1','5'),('5','20240626682AC','34'),('5','20240626C06BF','6');
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_order`
--

DROP TABLE IF EXISTS `place_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `place_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `total_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_pay` tinyint(1) DEFAULT '0',
  `is_send` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_order`
--

LOCK TABLES `place_order` WRITE;
/*!40000 ALTER TABLE `place_order` DISABLE KEYS */;
INSERT INTO `place_order` VALUES (1,'202406247488E','admin002','2024-06-24 21:51:16',NULL,NULL,NULL),(2,'20240624B1144','admin002','2024-06-24 22:54:56',NULL,1,NULL),(3,'202406248E487','admin002','2024-06-24 23:45:14',NULL,NULL,NULL),(4,'20240625EB7C4','admin002','2024-06-25 01:15:01',NULL,NULL,NULL),(5,'202406258F11B','admin002','2024-06-25 12:02:43',NULL,0,NULL),(6,'202406250D303','admin002','2024-06-25 12:09:33',NULL,0,1),(7,'20240625FE9F1','admin002','2024-06-25 15:26:18','82074.95',1,1),(8,'202406257CC94','admin001','2024-06-25 19:23:26','42100.0',1,0),(9,'20240626557F3','admin001','2024-06-26 08:45:29','52500.0',0,1),(11,'2024062628B69','admin001','2024-06-26 09:15:30','296800.0',0,0),(12,'20240626C06BF','admin002','2024-06-26 09:19:34','39179.88',0,1),(13,'202406263D3D9','admin001','2024-06-26 11:44:39','6500.0',1,1);
/*!40000 ALTER TABLE `place_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping_cart` (
  `sp_cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sp_goods_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sp_cart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES (2,'admin002','2'),(4,NULL,'2'),(5,NULL,'4'),(8,'admin002','4'),(10,'admin002','5'),(11,'admin002','1'),(12,'admin001','2'),(13,'admin001','4'),(15,'admin001','5'),(16,'admin001','9'),(17,'admin001','11'),(18,'admin001','12'),(19,'admin001','13'),(20,'admin001','17'),(22,'admin001','19'),(23,'admin001','20'),(24,'admin001','21'),(26,'admin001','1');
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `account` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sp_cart_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `user_avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`account`),
  KEY `FK_管理` (`sp_cart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin001',NULL,'123456',1,'ctctc.jpg'),('admin002',NULL,'123456',0,'鏆楀奖鑺欏叞.png');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-22 16:29:49
