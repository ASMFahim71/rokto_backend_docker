-- MySQL dump 10.13  Distrib 8.4.7, for Linux (x86_64)
--
-- Host: localhost    Database: rokto
-- ------------------------------------------------------
-- Server version	8.4.7

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blood_groups`
--

DROP TABLE IF EXISTS `blood_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blood_groups` (
  `blood_group_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `blood_group_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`blood_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_groups`
--

LOCK TABLES `blood_groups` WRITE;
/*!40000 ALTER TABLE `blood_groups` DISABLE KEYS */;
INSERT INTO `blood_groups` VALUES (1,'A+',NULL,NULL),(2,'A-',NULL,NULL),(3,'B+',NULL,NULL),(4,'B-',NULL,NULL),(5,'AB+',NULL,NULL),(6,'AB-',NULL,NULL),(7,'O+',NULL,NULL),(8,'O-',NULL,NULL);
/*!40000 ALTER TABLE `blood_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blood_orders`
--

DROP TABLE IF EXISTS `blood_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blood_orders` (
  `order_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `requester_id` bigint unsigned NOT NULL,
  `blood_group_id` bigint unsigned NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `cause` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `place` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `blood_orders_user_id_foreign` (`user_id`),
  CONSTRAINT `blood_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_orders`
--

LOCK TABLES `blood_orders` WRITE;
/*!40000 ALTER TABLE `blood_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `blood_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blood_reports`
--

DROP TABLE IF EXISTS `blood_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blood_reports` (
  `report_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `glucose` double NOT NULL,
  `cholesterol` double NOT NULL,
  `bilirubin` double NOT NULL,
  `rbc` double NOT NULL,
  `mcv` double NOT NULL,
  `platelets` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`report_id`),
  KEY `blood_reports_user_id_foreign` (`user_id`),
  CONSTRAINT `blood_reports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_reports`
--

LOCK TABLES `blood_reports` WRITE;
/*!40000 ALTER TABLE `blood_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `blood_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bn_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = active, 0 = inactive',
  `division_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `districts_division_id_foreign` (`division_id`),
  KEY `districts_status_index` (`status`),
  CONSTRAINT `districts_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'Comilla','কুমিল্লা','23.4682747','91.1788135',1,1,NULL,NULL,NULL),(2,'Feni','ফেনী','23.023231','91.3840844',1,1,NULL,NULL,NULL),(3,'Brahmanbaria','ব্রাহ্মণবাড়িয়া','23.9570904','91.1119286',1,1,NULL,NULL,NULL),(4,'Rangamati','রাঙ্গামাটি','22.6175','92.1422',1,1,NULL,NULL,NULL),(5,'Noakhali','নোয়াখালী','22.869563','91.099398',1,1,NULL,NULL,NULL),(6,'Chandpur','চাঁদপুর','23.2332585','90.6712912',1,1,NULL,NULL,NULL),(7,'Lakshmipur','লক্ষ্মীপুর','22.942477','90.841184',1,1,NULL,NULL,NULL),(8,'Chattogram','চট্টগ্রাম','22.335109','91.834073',1,1,NULL,NULL,NULL),(9,'Coxsbazar','কক্সবাজার','21.4272','92.0058',1,1,NULL,NULL,NULL),(10,'Khagrachhari','খাগড়াছড়ি','23.119285','91.984663',1,1,NULL,NULL,NULL),(11,'Bandarban','বান্দরবান','22.1953275','92.2183773',1,1,NULL,NULL,NULL),(12,'Sirajganj','সিরাজগঞ্জ','24.4533978','89.7006815',1,2,NULL,NULL,NULL),(13,'Pabna','পাবনা','23.998524','89.233645',1,2,NULL,NULL,NULL),(14,'Bogura','বগুড়া','24.8465228','89.377755',1,2,NULL,NULL,NULL),(15,'Rajshahi','রাজশাহী','24.3740','88.6011',1,2,NULL,NULL,NULL),(16,'Natore','নাটোর','24.420556','89.000282',1,2,NULL,NULL,NULL),(17,'Joypurhat','জয়পুরহাট','25.1051','89.0289',1,2,NULL,NULL,NULL),(18,'Chapainawabganj','চাঁপাইনবাবগঞ্জ','24.5965034','88.2775122',1,2,NULL,NULL,NULL),(19,'Naogaon','নওগাঁ','24.9458','88.4502',1,2,NULL,NULL,NULL),(20,'Jashore','যশোর','23.16643','89.2081126',1,3,NULL,NULL,NULL),(21,'Satkhira','সাতক্ষীরা','22.35','89.15',1,3,NULL,NULL,NULL),(22,'Meherpur','মেহেরপুর','23.762213','88.631821',1,3,NULL,NULL,NULL),(23,'Narail','নড়াইল','23.172534','89.512672',1,3,NULL,NULL,NULL),(24,'Chuadanga','চুয়াডাঙ্গা','23.6401961','88.841841',1,3,NULL,NULL,NULL),(25,'Kushtia','কুষ্টিয়া','23.901258','89.120482',1,3,NULL,NULL,NULL),(26,'Magura','মাগুরা','23.487337','89.419956',1,3,NULL,NULL,NULL),(27,'Khulna','খুলনা','22.815774','89.568679',1,3,NULL,NULL,NULL),(28,'Bagerhat','বাগেরহাট','22.651568','89.785938',1,3,NULL,NULL,NULL),(29,'Jhenaidah','ঝিনাইদহ','23.5448176','89.1539213',1,3,NULL,NULL,NULL),(30,'Jhalakathi','ঝালকাঠি','22.45','90.17',1,4,NULL,NULL,NULL),(31,'Patuakhali','পটুয়াখালী','22.3596316','90.3298712',1,4,NULL,NULL,NULL),(32,'Pirojpur','পিরোজপুর','22.56','89.96',1,4,NULL,NULL,NULL),(33,'Barisal','বরিশাল','22.701','90.3535',1,4,NULL,NULL,NULL),(34,'Bhola','ভোলা','22.685923','90.648179',1,4,NULL,NULL,NULL),(35,'Barguna','বরগুনা','22.0886','90.079',1,4,NULL,NULL,NULL),(36,'Sylhet','সিলেট','24.8897956','91.8697894',1,5,NULL,NULL,NULL),(37,'Moulvibazar','মৌলভীবাজার','24.482934','91.777417',1,5,NULL,NULL,NULL),(38,'Habiganj','হবিগঞ্জ','24.374945','91.41553',1,5,NULL,NULL,NULL),(39,'Sunamganj','সুনামগঞ্জ','25.0658042','91.3950115',1,5,NULL,NULL,NULL),(40,'Narsingdi','নরসিংদী','23.932233','90.71541',1,6,NULL,NULL,NULL),(41,'Gazipur','গাজীপুর','24.0022858','90.4264283',1,6,NULL,NULL,NULL),(42,'Shariatpur','শরীয়তপুর','23.2083','90.7178',1,6,NULL,NULL,NULL),(43,'Narayanganj','নারায়ণগঞ্জ','23.63366','90.496482',1,6,NULL,NULL,NULL),(44,'Tangail','টাঙ্গাইল','24.249','89.9392',1,6,NULL,NULL,NULL),(45,'Kishoreganj','কিশোরগঞ্জ','24.444937','90.776575',1,6,NULL,NULL,NULL),(46,'Manikganj','মানিকগঞ্জ','23.8577','90.0807',1,6,NULL,NULL,NULL),(47,'Dhaka','ঢাকা','23.7115253','90.4111451',1,6,NULL,NULL,NULL),(48,'Munshiganj','মুন্সিগঞ্জ','23.6183','90.4971',1,6,NULL,NULL,NULL),(49,'Rajbari','রাজবাড়ী','23.7574305','89.6444665',1,6,NULL,NULL,NULL),(50,'Madaripur','মাদারীপুর','23.164102','90.1896805',1,6,NULL,NULL,NULL),(51,'Gopalganj','গোপালগঞ্জ','23.0050857','89.8266059',1,6,NULL,NULL,NULL),(52,'Faridpur','ফরিদপুর','23.6070822','89.8429406',1,6,NULL,NULL,NULL),(53,'Panchagarh','পঞ্চগড়','26.3411','88.5541606',1,7,NULL,NULL,NULL),(54,'Dinajpur','দিনাজপুর','25.6217061','88.6354504',1,7,NULL,NULL,NULL),(55,'Lalmonirhat','লালমনিরহাট','25.76','89.5354',1,7,NULL,NULL,NULL),(56,'Nilphamari','নীলফামারী','25.931794','88.856006',1,7,NULL,NULL,NULL),(57,'Gaibandha','গাইবান্ধা','25.328751','89.528088',1,7,NULL,NULL,NULL),(58,'Thakurgaon','ঠাকুরগাঁও','26.0336945','88.4616834',1,7,NULL,NULL,NULL),(59,'Rangpur','রংপুর','25.7558096','89.244462',1,7,NULL,NULL,NULL),(60,'Kurigram','কুড়িগ্রাম','25.805445','89.636174',1,7,NULL,NULL,NULL),(61,'Sherpur','শেরপুর','25.0204933','90.0152966',1,8,NULL,NULL,NULL),(62,'Mymensingh','ময়মনসিংহ','24.7474','90.411',1,8,NULL,NULL,NULL),(63,'Jamalpur','জামালপুর','24.937533','89.937775',1,8,NULL,NULL,NULL),(64,'Netrokona','নেত্রকোণা','24.870955','90.727887',1,8,NULL,NULL,NULL);
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisions`
--

DROP TABLE IF EXISTS `divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bn_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = active, 0 = inactive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `divisions_name_unique` (`name`),
  UNIQUE KEY `divisions_bn_name_unique` (`bn_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisions`
--

LOCK TABLES `divisions` WRITE;
/*!40000 ALTER TABLE `divisions` DISABLE KEYS */;
INSERT INTO `divisions` VALUES (1,1,'Chattogram','চট্টগ্রাম',1,NULL,NULL,NULL),(2,1,'Rajshahi','রাজশাহী',1,NULL,NULL,NULL),(3,1,'Khulna','খুলনা',1,NULL,NULL,NULL),(4,1,'Barishal','বরিশাল',1,NULL,NULL,NULL),(5,1,'Sylhet','সিলেট',1,NULL,NULL,NULL),(6,1,'Dhaka','ঢাকা',1,NULL,NULL,NULL),(7,1,'Rangpur','রংপুর',1,NULL,NULL,NULL),(8,1,'Mymensingh','ময়মনসিংহ',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `divisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donors`
--

DROP TABLE IF EXISTS `donors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donors` (
  `donor_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `last_donation_date` date DEFAULT NULL,
  `donation_count` int NOT NULL DEFAULT '0',
  `rating` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`donor_id`),
  UNIQUE KEY `donors_user_id_unique` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donors`
--

LOCK TABLES `donors` WRITE;
/*!40000 ALTER TABLE `donors` DISABLE KEYS */;
/*!40000 ALTER TABLE `donors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0000_01_01_161103_create_divisions_table',1),(2,'0000_01_02_161104_create_districts_table',1),(3,'0000_01_03_161104_create_upazilas_table',1),(4,'0001_01_01_000000_create_users_table',1),(5,'0001_01_01_000001_create_cache_table',1),(6,'0001_01_01_000002_create_jobs_table',1),(7,'2025_12_11_064028_create_personal_access_tokens_table',1),(8,'2025_12_11_101412_create_blood_groups_table',1),(9,'2025_12_11_101835_create_table_order',1),(10,'2025_12_11_132143_create_doners_table',1),(11,'2025_12_11_132315_create_blood_orders_table',1),(12,'2025_12_11_133125_create_order_matches_table',1),(13,'2025_12_11_133233_create_blood_reports_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_matches`
--

DROP TABLE IF EXISTS `order_matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_matches` (
  `match_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `donor_id` bigint unsigned NOT NULL,
  `status` enum('pending','accepted','rejected','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `matched_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`match_id`),
  KEY `order_matches_order_id_foreign` (`order_id`),
  KEY `order_matches_donor_id_foreign` (`donor_id`),
  CONSTRAINT `order_matches_donor_id_foreign` FOREIGN KEY (`donor_id`) REFERENCES `donors` (`donor_id`) ON DELETE CASCADE,
  CONSTRAINT `order_matches_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `blood_orders` (`order_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_matches`
--

LOCK TABLES `order_matches` WRITE;
/*!40000 ALTER TABLE `order_matches` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',2,'auth-token','8cab44e0b04916c0bf688bac4d31d5a167d36ac491f9bf39679318deeaf1102c','[\"*\"]',NULL,NULL,'2025-12-18 15:48:16','2025-12-18 15:48:16'),(2,'App\\Models\\User',3,'auth-token','b0c326f42d5edad7cea0fa32b22367ffe1cd126c0fea96c15a42d5b13c1cf663','[\"*\"]',NULL,NULL,'2025-12-18 16:18:36','2025-12-18 16:18:36'),(3,'App\\Models\\User',4,'auth-token','8162933805bde91fa38f6e245e057bf338109042e45f96c804d4f903a4466aef','[\"*\"]',NULL,NULL,'2025-12-18 16:37:22','2025-12-18 16:37:22'),(4,'App\\Models\\User',5,'auth-token','c31b2c9f1cc6c38a4ed920b0f1f4989f89fc851494a104f950ac5eacb24c0acb','[\"*\"]',NULL,NULL,'2025-12-18 16:39:53','2025-12-18 16:39:53'),(5,'App\\Models\\User',6,'auth-token','f9f7d0be358dd8f98f527edcdf830b9247b5e1bccb2df83de885b565a6f55ed7','[\"*\"]',NULL,NULL,'2025-12-18 16:43:47','2025-12-18 16:43:47'),(6,'App\\Models\\User',7,'auth-token','1770cf8e6b6fd9049fbf93046989c39949d66feb8f4c9ee9d569404800a96818','[\"*\"]',NULL,NULL,'2025-12-18 18:06:19','2025-12-18 18:06:19'),(7,'App\\Models\\User',8,'auth-token','e736d0d61905b56a7d0b24ad6be2b2bfdad0c062b97079dfe3fef46fa682409f','[\"*\"]',NULL,NULL,'2025-12-19 10:49:50','2025-12-19 10:49:50');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('3kvP7a0bK1TgjAxDNARFLbmnvBCGfHNhRvVkpKVR',NULL,'172.20.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWNIUzhwQklEVVk1MFRaUloza01lT3FFVTVUT2lQbk9xYnY5ZmUwTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTY6Imh0dHA6Ly9sb2NhbGhvc3QiO3M6NToicm91dGUiO047fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1766071919);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_order`
--

DROP TABLE IF EXISTS `table_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_order` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_order`
--

LOCK TABLES `table_order` WRITE;
/*!40000 ALTER TABLE `table_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upazilas`
--

DROP TABLE IF EXISTS `upazilas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upazilas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bn_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = active, 0 = inactive',
  `district_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upazilas_district_id_foreign` (`district_id`),
  KEY `upazilas_status_index` (`status`),
  CONSTRAINT `upazilas_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=569 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upazilas`
--

LOCK TABLES `upazilas` WRITE;
/*!40000 ALTER TABLE `upazilas` DISABLE KEYS */;
INSERT INTO `upazilas` VALUES (1,'Debidwar','দেবিদ্বার','23.3791','91.0578',1,1,NULL,NULL,NULL),(2,'Barura','বরুড়া','23.3628','91.0696',1,1,NULL,NULL,NULL),(3,'Brahmanpara','ব্রাহ্মণপাড়া','23.3895','91.0745',1,1,NULL,NULL,NULL),(4,'Chandina','চান্দিনা','23.3865','91.0512',1,1,NULL,NULL,NULL),(5,'Chauddagram','চৌদ্দগ্রাম','23.2483','91.0118',1,1,NULL,NULL,NULL),(6,'Daudkandi','দাউদকান্দি','23.5771','91.0293',1,1,NULL,NULL,NULL),(7,'Homna','হোমনা','23.5527','91.0747',1,1,NULL,NULL,NULL),(8,'Laksam','লাকসাম','23.4631','91.2598',1,1,NULL,NULL,NULL),(9,'Muradnagar','মুরাদনগর','23.5203','91.0285',1,1,NULL,NULL,NULL),(10,'Nangalkot','নাঙ্গলকোট','23.2746','91.0538',1,1,NULL,NULL,NULL),(11,'Comilla Sadar','কুমিল্লা সদর','23.4621','91.1791',1,1,NULL,NULL,NULL),(12,'Meghna','মেঘনা','23.2787','91.1395',1,1,NULL,NULL,NULL),(13,'Monohargonj','মনোহরগঞ্জ','23.3532','91.1792',1,1,NULL,NULL,NULL),(14,'Sadarsouth','সদর দক্ষিণ','23.4237','91.2418',1,1,NULL,NULL,NULL),(15,'Titas','তিতাস','23.4289','91.1623',1,1,NULL,NULL,NULL),(16,'Burichang','বুড়িচং','23.4643','91.1034',1,1,NULL,NULL,NULL),(17,'Lalmai','লালমাই','23.6164','91.1409',1,1,NULL,NULL,NULL),(18,'Chhagalnaiya','ছাগলনাইয়া','23.1365','91.4762',1,2,NULL,NULL,NULL),(19,'Feni Sadar','ফেনী সদর','23.0106','91.3965',1,2,NULL,NULL,NULL),(20,'Sonagazi','সোনাগাজী','23.1804','91.2744',1,2,NULL,NULL,NULL),(21,'Fulgazi','ফুলগাজী','23.2268','91.2151',1,2,NULL,NULL,NULL),(22,'Parshuram','পরশুরাম','23.1333','91.4715',1,2,NULL,NULL,NULL),(23,'Daganbhuiyan','দাগনভূঞা','23.2538','91.4210',1,2,NULL,NULL,NULL),(24,'Brahmanbaria Sadar','ব্রাহ্মণবাড়িয়া সদর','23.1665','91.0100',1,3,NULL,NULL,NULL),(25,'Kasba','কসবা','23.2223','91.0502',1,3,NULL,NULL,NULL),(26,'Nasirnagar','নাসিরনগর','23.3804','91.0490',1,3,NULL,NULL,NULL),(27,'Sarail','সরাইল','23.2068','91.1305',1,3,NULL,NULL,NULL),(28,'Ashuganj','আশুগঞ্জ','23.2179','91.0253',1,3,NULL,NULL,NULL),(29,'Akhaura','আখাউড়া','23.0502','91.0811',1,3,NULL,NULL,NULL),(30,'Nabinagar','নবীনগর','23.2826','91.0805',1,3,NULL,NULL,NULL),(31,'Bancharampur','বাঞ্ছারামপুর','23.3580','91.1875',1,3,NULL,NULL,NULL),(32,'Bijoynagar','বিজয়নগর','23.4180','91.1862',1,3,NULL,NULL,NULL),(33,'Rangamati Sadar','রাঙ্গামাটি সদর','23.1304','92.1739',1,4,NULL,NULL,NULL),(34,'Kaptai','কাপ্তাই','23.1500','92.1500',1,4,NULL,NULL,NULL),(35,'Kawkhali','কাউখালী','23.1490','92.2000',1,4,NULL,NULL,NULL),(36,'Baghaichari','বাঘাইছড়ি','23.2130','92.2200',1,4,NULL,NULL,NULL),(37,'Barkal','বরকল','23.2800','92.2300',1,4,NULL,NULL,NULL),(38,'Langadu','লংগদু','23.3160','92.2500',1,4,NULL,NULL,NULL),(39,'Rajasthali','রাজস্থলী','23.4090','92.1900',1,4,NULL,NULL,NULL),(40,'Belaichari','বিলাইছড়ি','23.4630','92.3000',1,4,NULL,NULL,NULL),(41,'Juraichari','জুরাছড়ি','23.5220','92.4000',1,4,NULL,NULL,NULL),(42,'Naniarchar','নানিয়ারচর','23.5630','92.3800',1,4,NULL,NULL,NULL),(43,'Noakhali Sadar','নোয়াখালী সদর','22.9500','91.1500',1,5,NULL,NULL,NULL),(44,'Companiganj','কোম্পানীগঞ্জ','22.9950','91.2000',1,5,NULL,NULL,NULL),(45,'Begumganj','বেগমগঞ্জ','23.0500','91.2500',1,5,NULL,NULL,NULL),(46,'Hatia','হাতিয়া','22.8650','91.4500',1,5,NULL,NULL,NULL),(47,'Subarnachar','সুবর্ণচর','22.9900','91.3900',1,5,NULL,NULL,NULL),(48,'Kabirhat','কবিরহাট','23.1000','91.3000',1,5,NULL,NULL,NULL),(49,'Senbug','সেনবাগ','23.0500','91.3500',1,5,NULL,NULL,NULL),(50,'Chatkhil','চাটখিল','23.1300','91.4200',1,5,NULL,NULL,NULL),(51,'Sonaimori','সোনাইমুড়ী','23.2100','91.4500',1,5,NULL,NULL,NULL),(52,'Haimchar','হাইমচর','23.3520','90.8330',1,6,NULL,NULL,NULL),(53,'Kachua','কচুয়া','23.5000','90.9500',1,6,NULL,NULL,NULL),(54,'Shahrasti','শাহরাস্তি','23.4150','90.6950',1,6,NULL,NULL,NULL),(55,'Chandpur Sadar','চাঁদপুর সদর','23.2330','90.6650',1,6,NULL,NULL,NULL),(56,'Matlab South','মতলব দক্ষিণ','23.0000','90.7500',1,6,NULL,NULL,NULL),(57,'Hajiganj','হাজীগঞ্জ','23.1600','90.7800',1,6,NULL,NULL,NULL),(58,'Matlab North','মতলব উত্তর','23.1100','90.7600',1,6,NULL,NULL,NULL),(59,'Faridgonj','ফরিদগঞ্জ','23.0800','90.7400',1,6,NULL,NULL,NULL),(60,'Lakshmipur Sadar','লক্ষ্মীপুর সদর','23.1400','91.1750',1,7,NULL,NULL,NULL),(61,'Kamalnagar','কমলনগর','23.1350','91.2300',1,7,NULL,NULL,NULL),(62,'Raipur','রায়পুর','23.0700','91.2200',1,7,NULL,NULL,NULL),(63,'Ramgati','রামগতি','23.1200','91.3200',1,7,NULL,NULL,NULL),(64,'Ramganj','রামগঞ্জ','23.1500','91.2800',1,7,NULL,NULL,NULL),(65,'Rangunia','রাঙ্গুনিয়া','22.9740','91.8100',1,8,NULL,NULL,NULL),(66,'Sitakunda','সীতাকুন্ড','22.7920','91.6600',1,8,NULL,NULL,NULL),(67,'Mirsharai','মীরসরাই','23.0150','91.5750',1,8,NULL,NULL,NULL),(68,'Patiya','পটিয়া','22.8130','91.8750',1,8,NULL,NULL,NULL),(69,'Sandwip','সন্দ্বীপ','22.6870','91.8000',1,8,NULL,NULL,NULL),(70,'Banshkhali','বাঁশখালী','22.4690','91.5000',1,8,NULL,NULL,NULL),(71,'Boalkhali','বোয়ালখালী','22.8350','91.8500',1,8,NULL,NULL,NULL),(72,'Anwara','আনোয়ারা','22.5040','91.9800',1,8,NULL,NULL,NULL),(73,'Chandanaish','চন্দনাইশ','22.8370','91.9400',1,8,NULL,NULL,NULL),(74,'Satkania','সাতকানিয়া','22.8460','91.6500',1,8,NULL,NULL,NULL),(75,'Lohagara','লোহাগাড়া','22.7540','91.7300',1,8,NULL,NULL,NULL),(76,'Hathazari','হাটহাজারী','22.8570','91.4330',1,8,NULL,NULL,NULL),(77,'Fatikchhari','ফটিকছড়ি','22.7450','91.6200',1,8,NULL,NULL,NULL),(78,'Raozan','রাউজান','22.8670','91.6900',1,8,NULL,NULL,NULL),(79,'Karnafuli','কর্ণফুলী','22.7550','91.8000',1,8,NULL,NULL,NULL),(80,'Coxsbazar Sadar','কক্সবাজার সদর','21.4500','92.0050',1,9,NULL,NULL,NULL),(81,'Chakaria','চকরিয়া','21.5400','92.0800',1,9,NULL,NULL,NULL),(82,'Kutubdia','কুতুবদিয়া','21.8250','91.9450',1,9,NULL,NULL,NULL),(83,'Ukhiya','উখিয়া','21.4090','92.0800',1,9,NULL,NULL,NULL),(84,'Moheshkhali','মহেশখালী','21.5200','92.2500',1,9,NULL,NULL,NULL),(85,'Pekua','পেকুয়া','21.7000','92.1600',1,9,NULL,NULL,NULL),(86,'Ramu','রামু','21.4254','92.0229',1,9,NULL,NULL,NULL),(87,'Teknaf','টেকনাফ','20.8716','92.2153',1,9,NULL,NULL,NULL),(88,'Khagrachhari Sadar','খাগড়াছড়ি সদর','23.1042','91.9730',1,10,NULL,NULL,NULL),(89,'Dighinala','দিঘীনালা','23.0204','91.8632',1,10,NULL,NULL,NULL),(90,'Panchari','পানছড়ি','23.2081','91.7323',1,10,NULL,NULL,NULL),(91,'Laxmichhari','লক্ষীছড়ি','23.1735','91.7861',1,10,NULL,NULL,NULL),(92,'Mohalchari','মহালছড়ি','23.0543','91.7582',1,10,NULL,NULL,NULL),(93,'Manikchari','মানিকছড়ি','23.1452','91.7596',1,10,NULL,NULL,NULL),(94,'Ramgarh','রামগড়','23.1490','91.8275',1,10,NULL,NULL,NULL),(95,'Matiranga','মাটিরাঙ্গা','23.2069','91.8832',1,10,NULL,NULL,NULL),(96,'Guimara','গুইমারা','23.2858','91.9255',1,10,NULL,NULL,NULL),(97,'Bandarban Sadar','বান্দরবান সদর','22.1789','92.2112',1,11,NULL,NULL,NULL),(98,'Alikadam','আলীকদম','22.3482','92.1406',1,11,NULL,NULL,NULL),(99,'Naikhongchhari','নাইক্ষ্যংছড়ি','22.6197','92.2124',1,11,NULL,NULL,NULL),(100,'Rowangchhari','রোয়াংছড়ি','22.5031','92.3805',1,11,NULL,NULL,NULL),(101,'Lama','লামা','22.2825','92.4633',1,11,NULL,NULL,NULL),(102,'Ruma','রুমা','22.8464','92.2318',1,11,NULL,NULL,NULL),(103,'Thanchi','থানচি','22.8151','92.1615',1,11,NULL,NULL,NULL),(104,'Belkuchi','বেলকুচি','24.3024','89.7529',1,12,NULL,NULL,NULL),(105,'Chauhali','চৌহালি','24.3485','89.9291',1,12,NULL,NULL,NULL),(106,'Kamarkhand','কামারখন্দ','24.3383','89.7621',1,12,NULL,NULL,NULL),(107,'Kazipur','কাজীপুর','24.2795','89.6885',1,12,NULL,NULL,NULL),(108,'Raigonj','রায়গঞ্জ','24.4272','89.7991',1,12,NULL,NULL,NULL),(109,'Shahjadpur','শাহজাদপুর','24.3461','89.7383',1,12,NULL,NULL,NULL),(110,'Sirajganj Sadar','সিরাজগঞ্জ সদর','24.4412','89.7065',1,12,NULL,NULL,NULL),(111,'Tarash','তাড়াশ','24.5337','89.6662',1,12,NULL,NULL,NULL),(112,'Ullapara','উল্লাপাড়া','24.5128','89.7321',1,12,NULL,NULL,NULL),(113,'Sujanagar','সুজানগর','24.0273','89.1471',1,13,NULL,NULL,NULL),(114,'Ishurdi','ঈশ্বরদী','24.3833','89.1916',1,13,NULL,NULL,NULL),(115,'Bhangura','ভাঙ্গুড়া','24.0167','89.1667',1,13,NULL,NULL,NULL),(116,'Pabna Sadar','পাবনা সদর','24.0040','89.2403',1,13,NULL,NULL,NULL),(117,'Bera','বেড়া','23.9414','89.3892',1,13,NULL,NULL,NULL),(118,'Atghoria','আটঘরিয়া','24.0365','89.3106',1,13,NULL,NULL,NULL),(119,'Chatmohar','চাটমোহর','23.9562','89.5120',1,13,NULL,NULL,NULL),(120,'Santhia','সাঁথিয়া','24.1833','89.0861',1,13,NULL,NULL,NULL),(121,'Faridpur','ফরিদপুর','24.4167','89.4000',1,13,NULL,NULL,NULL),(122,'Kahaloo','কাহালু','24.8677','89.3866',1,14,NULL,NULL,NULL),(123,'Bogra Sadar','বগুড়া সদর','24.8465','89.3442',1,14,NULL,NULL,NULL),(124,'Shariakandi','সারিয়াকান্দি','24.8531','89.4700',1,14,NULL,NULL,NULL),(125,'Shajahanpur','শাজাহানপুর','24.9252','89.2929',1,14,NULL,NULL,NULL),(126,'Dupchanchia','দুপচাচিঁয়া','24.9000','89.3167',1,14,NULL,NULL,NULL),(127,'Adamdighi','আদমদিঘি','24.9647','89.4517',1,14,NULL,NULL,NULL),(128,'Nondigram','নন্দিগ্রাম','24.8029','89.2256',1,14,NULL,NULL,NULL),(129,'Sonatala','সোনাতলা','24.8100','89.3144',1,14,NULL,NULL,NULL),(130,'Dhunot','ধুনট','24.8762','89.5333',1,14,NULL,NULL,NULL),(131,'Gabtali','গাবতলী','24.8107','89.4003',1,14,NULL,NULL,NULL),(132,'Sherpur','শেরপুর','24.8545','89.3077',1,14,NULL,NULL,NULL),(133,'Shibganj','শিবগঞ্জ','24.8254','89.3488',1,14,NULL,NULL,NULL),(134,'Paba','পবা','24.4262','88.8249',1,15,NULL,NULL,NULL),(135,'Durgapur','দুর্গাপুর','24.4484','88.9221',1,15,NULL,NULL,NULL),(136,'Mohonpur','মোহনপুর','24.3899','88.8522',1,15,NULL,NULL,NULL),(137,'Charghat','চারঘাট','24.4795','88.8621',1,15,NULL,NULL,NULL),(138,'Puthia','পুঠিয়া','24.4623','88.9530',1,15,NULL,NULL,NULL),(139,'Bagha','বাঘা','24.4652','88.9346',1,15,NULL,NULL,NULL),(140,'Godagari','গোদাগাড়ী','24.5010','88.9445',1,15,NULL,NULL,NULL),(141,'Tanore','তানোর','24.4965','88.9517',1,15,NULL,NULL,NULL),(142,'Bagmara','বাগমারা','24.4647','88.8994',1,15,NULL,NULL,NULL),(143,'Natore Sadar','নাটোর সদর','24.4511','88.6260',1,16,NULL,NULL,NULL),(144,'Singra','সিংড়া','24.4231','88.5287',1,16,NULL,NULL,NULL),(145,'Baraigram','বড়াইগ্রাম','24.4363','89.2278',1,16,NULL,NULL,NULL),(146,'Bagatipara','বাগাতিপাড়া','24.4637','89.2551',1,16,NULL,NULL,NULL),(147,'Lalpur','লালপুর','24.4239','89.2329',1,16,NULL,NULL,NULL),(148,'Gurudaspur','গুরুদাসপুর','24.5095','89.3048',1,16,NULL,NULL,NULL),(149,'Naldanga','নলডাঙ্গা','24.3682','89.3145',1,16,NULL,NULL,NULL),(150,'Akkelpur','আক্কেলপুর','25.0228','88.6544',1,17,NULL,NULL,NULL),(151,'Kalai','কালাই','25.0752','88.6965',1,17,NULL,NULL,NULL),(152,'Khetlal','ক্ষেতলাল','25.1397','88.7584',1,17,NULL,NULL,NULL),(153,'Panchbibi','পাঁচবিবি','25.0536','88.5618',1,17,NULL,NULL,NULL),(154,'Joypurhat Sadar','জয়পুরহাট সদর','25.3461','88.5364',1,17,NULL,NULL,NULL),(155,'Chapainawabganj Sadar','চাঁপাইনবাবগঞ্জ সদর','24.6961','88.2786',1,18,NULL,NULL,NULL),(156,'Gomostapur','গোমস্তাপুর','24.7631','88.2189',1,18,NULL,NULL,NULL),(157,'Nachol','নাচোল','24.7603','88.2738',1,18,NULL,NULL,NULL),(158,'Bholahat','ভোলাহাট','24.8093','88.3502',1,18,NULL,NULL,NULL),(159,'Shibganj','শিবগঞ্জ','24.7806','88.3126',1,18,NULL,NULL,NULL),(160,'Mohadevpur','মহাদেবপুর','24.9136','88.8665',1,19,NULL,NULL,NULL),(161,'Badalgachi','বদলগাছী','24.9182','88.7118',1,19,NULL,NULL,NULL),(162,'Patnitala','পত্নিতলা','24.8551','88.7977',1,19,NULL,NULL,NULL),(163,'Dhamoirhat','ধামইরহাট','24.8905','88.7802',1,19,NULL,NULL,NULL),(164,'Niamatpur','নিয়ামতপুর','24.8476','88.9143',1,19,NULL,NULL,NULL),(165,'Manda','মান্দা','24.8479','88.8008',1,19,NULL,NULL,NULL),(166,'Atrai','আত্রাই','24.9327','88.8324',1,19,NULL,NULL,NULL),(167,'Raninagar','রাণীনগর','24.8723','88.7523',1,19,NULL,NULL,NULL),(168,'Naogaon Sadar','নওগাঁ সদর','24.7472','88.6342',1,19,NULL,NULL,NULL),(169,'Porsha','পোরশা','24.9384','88.6769',1,19,NULL,NULL,NULL),(170,'Sapahar','সাপাহার','24.7803','88.6813',1,19,NULL,NULL,NULL),(171,'Manirampur','মণিরামপুর','23.1937','89.2289',1,20,NULL,NULL,NULL),(172,'Abhaynagar','অভয়নগর','23.3023','89.3301',1,20,NULL,NULL,NULL),(173,'Bagherpara','বাঘারপাড়া','23.2309','89.4079',1,20,NULL,NULL,NULL),(174,'Chougachha','চৌগাছা','23.1737','89.4416',1,20,NULL,NULL,NULL),(175,'Jhikargacha','ঝিকরগাছা','23.4022','89.1647',1,20,NULL,NULL,NULL),(176,'Keshabpur','কেশবপুর','23.4056','89.4819',1,20,NULL,NULL,NULL),(177,'Jessore Sadar','যশোর সদর','23.1707','89.2183',1,20,NULL,NULL,NULL),(178,'Sharsha','শার্শা','23.0637','89.4363',1,20,NULL,NULL,NULL),(179,'Assasuni','আশাশুনি','22.5646','89.0707',1,21,NULL,NULL,NULL),(180,'Debhata','দেবহাটা','22.6088','89.1641',1,21,NULL,NULL,NULL),(181,'Kalaroa','কলারোয়া','22.5338','89.0901',1,21,NULL,NULL,NULL),(182,'Satkhira Sadar','সাতক্ষীরা সদর','22.7106','89.0572',1,21,NULL,NULL,NULL),(183,'Shyamnagar','শ্যামনগর','22.4458','89.0476',1,21,NULL,NULL,NULL),(184,'Tala','তালা','22.4906','89.2012',1,21,NULL,NULL,NULL),(185,'Kaliganj','কালিগঞ্জ','22.6421','89.0655',1,21,NULL,NULL,NULL),(186,'Mujibnagar','মুজিবনগর','23.7384','88.7154',1,22,NULL,NULL,NULL),(187,'Meherpur Sadar','মেহেরপুর সদর','23.7753','88.6259',1,22,NULL,NULL,NULL),(188,'Gangni','গাংনী','23.7463','88.8019',1,22,NULL,NULL,NULL),(189,'Narail Sadar','নড়াইল সদর','23.1618','89.5385',1,23,NULL,NULL,NULL),(190,'Lohagara','লোহাগড়া','23.0101','89.5087',1,23,NULL,NULL,NULL),(191,'Kalia','কালিয়া','23.1149','89.5299',1,23,NULL,NULL,NULL),(192,'Chuadanga Sadar','চুয়াডাঙ্গা সদর','23.6458','88.7687',1,24,NULL,NULL,NULL),(193,'Alamdanga','আলমডাঙ্গা','23.5759','88.8662',1,24,NULL,NULL,NULL),(194,'Damurhuda','দামুড়হুদা','23.6667','88.7515',1,24,NULL,NULL,NULL),(195,'Jibannagar','জীবননগর','23.6733','88.7139',1,24,NULL,NULL,NULL),(196,'Kushtia Sadar','কুষ্টিয়া সদর','23.8698','89.1304',1,25,NULL,NULL,NULL),(197,'Kumarkhali','কুমারখালী','23.7963','89.1766',1,25,NULL,NULL,NULL),(198,'Khoksa','খোকসা','23.8107','89.0249',1,25,NULL,NULL,NULL),(199,'Mirpur','মিরপুর','23.9037','89.1535',1,25,NULL,NULL,NULL),(200,'Daulatpur','দৌলতপুর','23.7863','89.1761',1,25,NULL,NULL,NULL),(201,'Bheramara','ভেড়ামারা','23.8244','89.1124',1,25,NULL,NULL,NULL),(202,'Shalikha','শালিখা','23.4983','89.4218',1,26,NULL,NULL,NULL),(203,'Sreepur','শ্রীপুর','23.5039','89.4501',1,26,NULL,NULL,NULL),(204,'Magura Sadar','মাগুরা সদর','23.5415','89.3653',1,26,NULL,NULL,NULL),(205,'Mohammadpur','মহম্মদপুর','23.5802','89.4853',1,26,NULL,NULL,NULL),(206,'Paikgasa','পাইকগাছা','22.7197','89.3415',1,27,NULL,NULL,NULL),(207,'Fultola','ফুলতলা','22.7602','89.4161',1,27,NULL,NULL,NULL),(208,'Digholia','দিঘলিয়া','22.8198','89.3750',1,27,NULL,NULL,NULL),(209,'Rupsha','রূপসা','22.8560','89.4527',1,27,NULL,NULL,NULL),(210,'Terokhada','তেরখাদা','22.8010','89.2600',1,27,NULL,NULL,NULL),(211,'Dumuria','ডুমুরিয়া','22.6701','89.4056',1,27,NULL,NULL,NULL),(212,'Botiaghata','বটিয়াঘাটা','22.6891','89.4664',1,27,NULL,NULL,NULL),(213,'Dakop','দাকোপ','22.6994','89.3291',1,27,NULL,NULL,NULL),(214,'Koyra','কয়রা','22.5962','89.3047',1,27,NULL,NULL,NULL),(215,'Fakirhat','ফকিরহাট','22.6781','89.6620',1,28,NULL,NULL,NULL),(216,'Bagerhat Sadar','বাগেরহাট সদর','22.6750','89.8160',1,28,NULL,NULL,NULL),(217,'Mollahat','মোল্লাহাট','22.7012','89.7714',1,28,NULL,NULL,NULL),(218,'Sarankhola','শরণখোলা','22.5609','89.7330',1,28,NULL,NULL,NULL),(219,'Rampal','রামপাল','22.6073','89.8197',1,28,NULL,NULL,NULL),(220,'Morrelganj','মোড়েলগঞ্জ','22.7678','89.8673',1,28,NULL,NULL,NULL),(221,'Kachua','কচুয়া','22.7366','89.8074',1,28,NULL,NULL,NULL),(222,'Mongla','মোংলা','22.3485','89.5689',1,28,NULL,NULL,NULL),(223,'Chitalmari','চিতলমারী','22.7012','89.8583',1,28,NULL,NULL,NULL),(224,'Jhenaidah Sadar','ঝিনাইদহ সদর','23.6061','89.1649',1,29,NULL,NULL,NULL),(225,'Shailkupa','শৈলকুপা','23.5687','89.2510',1,29,NULL,NULL,NULL),(226,'Harinakundu','হরিণাকুন্ডু','23.5139','89.1063',1,29,NULL,NULL,NULL),(227,'Kaliganj','কালীগঞ্জ','23.5105','89.2541',1,29,NULL,NULL,NULL),(228,'Kotchandpur','কোটচাঁদপুর','23.4452','89.1549',1,29,NULL,NULL,NULL),(229,'Moheshpur','মহেশপুর','23.2960','89.1298',1,29,NULL,NULL,NULL),(230,'Jhalakathi Sadar','ঝালকাঠি সদর','22.6567','90.1869',1,30,NULL,NULL,NULL),(231,'Kathalia','কাঠালিয়া','22.7320','90.2753',1,30,NULL,NULL,NULL),(232,'Nalchity','নলছিটি','22.6626','90.2799',1,30,NULL,NULL,NULL),(233,'Rajapur','রাজাপুর','22.7502','90.3113',1,30,NULL,NULL,NULL),(234,'Bauphal','বাউফল','22.5568','90.3295',1,31,NULL,NULL,NULL),(235,'Patuakhali Sadar','পটুয়াখালী সদর','22.3513','90.3445',1,31,NULL,NULL,NULL),(236,'Dumki','দুমকি','22.4191','90.2510',1,31,NULL,NULL,NULL),(237,'Dashmina','দশমিনা','22.5413','90.2512',1,31,NULL,NULL,NULL),(238,'Kalapara','কলাপাড়া','22.2242','90.3230',1,31,NULL,NULL,NULL),(239,'Mirzaganj','মির্জাগঞ্জ','22.5796','90.2499',1,31,NULL,NULL,NULL),(240,'Galachipa','গলাচিপা','22.3430','90.4096',1,31,NULL,NULL,NULL),(241,'Rangabali','রাঙ্গাবালী','22.3145','90.3506',1,31,NULL,NULL,NULL),(242,'Pirojpur Sadar','পিরোজপুর সদর','22.6232','90.1943',1,32,NULL,NULL,NULL),(243,'Nazirpur','নাজিরপুর','22.7413','90.3050',1,32,NULL,NULL,NULL),(244,'Kawkhali','কাউখালী','22.7452','90.1478',1,32,NULL,NULL,NULL),(245,'Zianagar','জিয়ানগর','22.7579','90.1721',1,32,NULL,NULL,NULL),(246,'Bhandaria','ভান্ডারিয়া','22.5711','90.2225',1,32,NULL,NULL,NULL),(247,'Mathbaria','মঠবাড়ীয়া','22.7800','90.1712',1,32,NULL,NULL,NULL),(248,'Nesarabad','নেছারাবাদ','22.6182','90.2726',1,32,NULL,NULL,NULL),(249,'Barisal Sadar','বরিশাল সদর','22.7010','90.3535',1,33,NULL,NULL,NULL),(250,'Bakerganj','বাকেরগঞ্জ','22.8689','90.2244',1,33,NULL,NULL,NULL),(251,'Babuganj','বাবুগঞ্জ','22.7341','90.2930',1,33,NULL,NULL,NULL),(252,'Wazirpur','উজিরপুর','22.6965','90.3478',1,33,NULL,NULL,NULL),(253,'Banaripara','বানারীপাড়া','22.6700','90.3799',1,33,NULL,NULL,NULL),(254,'Gournadi','গৌরনদী','22.8417','90.3413',1,33,NULL,NULL,NULL),(255,'Agailjhara','আগৈলঝাড়া','22.8340','90.4356',1,33,NULL,NULL,NULL),(256,'Mehendiganj','মেহেন্দিগঞ্জ','22.8442','90.3228',1,33,NULL,NULL,NULL),(257,'Muladi','মুলাদী','22.6656','90.4929',1,33,NULL,NULL,NULL),(258,'Hizla','হিজলা','22.8517','90.5232',1,33,NULL,NULL,NULL),(259,'Bhola Sadar','ভোলা সদর','22.6851','90.6611',1,34,NULL,NULL,NULL),(260,'Borhan Sddin','বোরহান উদ্দিন','22.8182','90.6019',1,34,NULL,NULL,NULL),(261,'Charfesson','চরফ্যাশন','22.7301','90.6978',1,34,NULL,NULL,NULL),(262,'Doulatkhan','দৌলতখান','22.7786','90.7242',1,34,NULL,NULL,NULL),(263,'Monpura','মনপুরা','22.4472','90.7243',1,34,NULL,NULL,NULL),(264,'Tazumuddin','তজুমদ্দিন','22.5819','90.6167',1,34,NULL,NULL,NULL),(265,'Lalmohan','লালমোহন','22.7498','90.6333',1,34,NULL,NULL,NULL),(266,'Amtali','আমতলী','22.2803','90.1104',1,35,NULL,NULL,NULL),(267,'Barguna Sadar','বরগুনা সদর','22.1102','90.0609',1,35,NULL,NULL,NULL),(268,'Betagi','বেতাগী','22.1534','90.1550',1,35,NULL,NULL,NULL),(269,'Bamna','বামনা','22.1839','90.2281',1,35,NULL,NULL,NULL),(270,'Pathorghata','পাথরঘাটা','22.1677','90.2060',1,35,NULL,NULL,NULL),(271,'Taltali','তালতলি','22.1449','90.1304',1,35,NULL,NULL,NULL),(272,'Balaganj','বালাগঞ্জ','24.8939','91.8285',1,36,NULL,NULL,NULL),(273,'Beanibazar','বিয়ানীবাজার','24.9127','91.6914',1,36,NULL,NULL,NULL),(274,'Bishwanath','বিশ্বনাথ','24.7163','91.8092',1,36,NULL,NULL,NULL),(275,'Companiganj','কোম্পানীগঞ্জ','24.9756','91.7211',1,36,NULL,NULL,NULL),(276,'Fenchuganj','ফেঞ্চুগঞ্জ','24.9393','91.6812',1,36,NULL,NULL,NULL),(277,'Golapganj','গোলাপগঞ্জ','24.8083','91.8262',1,36,NULL,NULL,NULL),(278,'Gowainghat','গোয়াইনঘাট','25.0082','91.8425',1,36,NULL,NULL,NULL),(279,'Jaintiapur','জৈন্তাপুর','25.0871','91.7471',1,36,NULL,NULL,NULL),(280,'Kanaighat','কানাইঘাট','25.1141','91.8431',1,36,NULL,NULL,NULL),(281,'Sylhet Sadar','সিলেট সদর','24.8949','91.8687',1,36,NULL,NULL,NULL),(282,'Zakiganj','জকিগঞ্জ','25.0601','91.7356',1,36,NULL,NULL,NULL),(283,'Dakshinsurma','দক্ষিণ সুরমা','24.8902','91.8354',1,36,NULL,NULL,NULL),(284,'Osmaninagar','ওসমানী নগর','24.9548','91.7015',1,36,NULL,NULL,NULL),(285,'Barlekha','বড়লেখা','24.2987','91.7660',1,37,NULL,NULL,NULL),(286,'Kamolganj','কমলগঞ্জ','24.3712','91.8721',1,37,NULL,NULL,NULL),(287,'Kulaura','কুলাউড়া','24.6531','91.8009',1,37,NULL,NULL,NULL),(288,'Moulvibazar Sadar','মৌলভীবাজার সদর','24.4648','91.7532',1,37,NULL,NULL,NULL),(289,'Rajnagar','রাজনগর','24.6256','91.7582',1,37,NULL,NULL,NULL),(290,'Sreemangal','শ্রীমঙ্গল','24.3032','91.7222',1,37,NULL,NULL,NULL),(291,'Juri','জুড়ী','24.6127','91.7075',1,37,NULL,NULL,NULL),(292,'Nabiganj','নবীগঞ্জ','24.5322','91.4532',1,38,NULL,NULL,NULL),(293,'Bahubal','বাহুবল','24.7267','91.3345',1,38,NULL,NULL,NULL),(294,'Ajmiriganj','আজমিরীগঞ্জ','24.5798','91.4229',1,38,NULL,NULL,NULL),(295,'Baniachong','বানিয়াচং','24.7599','91.5245',1,38,NULL,NULL,NULL),(296,'Lakhai','লাখাই','24.4179','91.5122',1,38,NULL,NULL,NULL),(297,'Chunarughat','চুনারুঘাট','24.5711','91.4551',1,38,NULL,NULL,NULL),(298,'Habiganj Sadar','হবিগঞ্জ সদর','24.3782','91.4129',1,38,NULL,NULL,NULL),(299,'Madhabpur','মাধবপুর','24.4316','91.5796',1,38,NULL,NULL,NULL),(300,'Sunamganj Sadar','সুনামগঞ্জ সদর','25.0721','91.4022',1,39,NULL,NULL,NULL),(301,'South Sunamganj','দক্ষিণ সুনামগঞ্জ','25.0627','91.4650',1,39,NULL,NULL,NULL),(302,'Bishwambarpur','বিশ্বম্ভরপুর','25.0330','91.5578',1,39,NULL,NULL,NULL),(303,'Chhatak','ছাতক','25.0386','91.3581',1,39,NULL,NULL,NULL),(304,'Jagannathpur','জগন্নাথপুর','25.1406','91.2810',1,39,NULL,NULL,NULL),(305,'Dowarabazar','দোয়ারাবাজার','25.0952','91.4315',1,39,NULL,NULL,NULL),(306,'Tahirpur','তাহিরপুর','25.1017','91.2663',1,39,NULL,NULL,NULL),(307,'Dharmapasha','ধর্মপাশা','25.0093','91.4771',1,39,NULL,NULL,NULL),(308,'Jamalganj','জামালগঞ্জ','24.9755','91.4832',1,39,NULL,NULL,NULL),(309,'Shalla','শাল্লা','25.0267','91.4083',1,39,NULL,NULL,NULL),(310,'Derai','দিরাই','25.0163','91.4789',1,39,NULL,NULL,NULL),(311,'Belabo','বেলাবো','23.9924','90.7751',1,40,NULL,NULL,NULL),(312,'Monohardi','মনোহরদী','23.9468','90.7231',1,40,NULL,NULL,NULL),(313,'Narsingdi Sadar','নরসিংদী সদর','23.9026','90.7169',1,40,NULL,NULL,NULL),(314,'Palash','পলাশ','23.9565','90.7629',1,40,NULL,NULL,NULL),(315,'Raipura','রায়পুরা','23.9174','90.7358',1,40,NULL,NULL,NULL),(316,'Shibpur','শিবপুর','23.9080','90.8032',1,40,NULL,NULL,NULL),(317,'Kapasia','কাপাসিয়া','23.9992','90.4180',1,41,NULL,NULL,NULL),(318,'Kaliganj','কালীগঞ্জ','23.9992','90.4180',1,41,NULL,NULL,NULL),(319,'Kaliakair','কালিয়াকৈর','23.9992','90.4180',1,41,NULL,NULL,NULL),(320,'Gazipur Sadar','গাজীপুর সদর','23.9992','90.4180',1,41,NULL,NULL,NULL),(321,'Sreepur','শ্রীপুর','23.9992','90.418',1,41,NULL,NULL,NULL),(322,'Shariatpur Sadar','শরিয়তপুর সদর','23.6090','90.6364',1,42,NULL,NULL,NULL),(323,'Naria','নড়িয়া','23.6462','90.7819',1,42,NULL,NULL,NULL),(324,'Zajira','জাজিরা','23.5937','90.7365',1,42,NULL,NULL,NULL),(325,'Gosairhat','গোসাইরহাট','23.6463','90.5974',1,42,NULL,NULL,NULL),(326,'Bhedarganj','ভেদরগঞ্জ','23.5878','90.6345',1,42,NULL,NULL,NULL),(327,'Damudya','ডামুড্যা','23.5883','90.7059',1,42,NULL,NULL,NULL),(328,'Araihazar','আড়াইহাজার','23.7594','90.6810',1,43,NULL,NULL,NULL),(329,'Bandar','বন্দর','23.6021','90.5852',1,43,NULL,NULL,NULL),(330,'Narayanganj Sadar','নারায়নগঞ্জ সদর','23.6228','90.5010',1,43,NULL,NULL,NULL),(331,'Rupganj','রূপগঞ্জ','23.7463','90.6361',1,43,NULL,NULL,NULL),(332,'Sonargaon','সোনারগাঁ','23.6215','90.7054',1,43,NULL,NULL,NULL),(333,'Basail','বাসাইল','24.2633','90.2715',1,44,NULL,NULL,NULL),(334,'Bhuapur','ভুয়াপুর','24.2360','90.2325',1,44,NULL,NULL,NULL),(335,'Delduar','দেলদুয়ার','24.2752','90.1271',1,44,NULL,NULL,NULL),(336,'Ghatail','ঘাটাইল','24.1317','90.1819',1,44,NULL,NULL,NULL),(337,'Gopalpur','গোপালপুর','24.2311','90.2619',1,44,NULL,NULL,NULL),(338,'Madhupur','মধুপুর','24.4091','90.2232',1,44,NULL,NULL,NULL),(339,'Mirzapur','মির্জাপুর','24.0842','90.2171',1,44,NULL,NULL,NULL),(340,'Nagarpur','নাগরপুর','24.1267','90.3460',1,44,NULL,NULL,NULL),(341,'Sakhipur','সখিপুর','24.0932','90.2628',1,44,NULL,NULL,NULL),(342,'Tangail Sadar','টাঙ্গাইল সদর','24.2524','90.2289',1,44,NULL,NULL,NULL),(343,'Kalihati','কালিহাতী','24.1668','90.2504',1,44,NULL,NULL,NULL),(344,'Dhanbari','ধনবাড়ী','24.2666','90.3653',1,44,NULL,NULL,NULL),(345,'Itna','ইটনা','24.1230','90.9175',1,45,NULL,NULL,NULL),(346,'Katiadi','কটিয়াদী','24.1184','91.0854',1,45,NULL,NULL,NULL),(347,'Bhairab','ভৈরব','24.0294','91.1730',1,45,NULL,NULL,NULL),(348,'Tarail','তাড়াইল','24.1717','91.1010',1,45,NULL,NULL,NULL),(349,'Hossainpur','হোসেনপুর','24.0471','91.0382',1,45,NULL,NULL,NULL),(350,'Pakundia','পাকুন্দিয়া','24.0780','91.1881',1,45,NULL,NULL,NULL),(351,'Kuliarchar','কুলিয়ারচর','24.1464','91.0293',1,45,NULL,NULL,NULL),(352,'Kishoreganj Sadar','কিশোরগঞ্জ সদর','24.4412','90.9744',1,45,NULL,NULL,NULL),(353,'Karimgonj','করিমগঞ্জ','24.1902','91.1603',1,45,NULL,NULL,NULL),(354,'Bajitpur','বাজিতপুর','24.2733','91.1084',1,45,NULL,NULL,NULL),(355,'Austagram','অষ্টগ্রাম','24.5006','91.0722',1,45,NULL,NULL,NULL),(356,'Mithamoin','মিঠামইন','24.3986','91.0503',1,45,NULL,NULL,NULL),(357,'Nikli','নিকলী','24.1583','91.2348',1,45,NULL,NULL,NULL),(358,'Harirampur','হরিরামপুর','23.8721','90.2264',1,46,NULL,NULL,NULL),(359,'Saturia','সাটুরিয়া','23.9334','90.2832',1,46,NULL,NULL,NULL),(360,'Manikganj Sadar','মানিকগঞ্জ সদর','23.8539','90.2865',1,46,NULL,NULL,NULL),(361,'Gior','ঘিওর','23.8998','90.4254',1,46,NULL,NULL,NULL),(362,'Shibaloy','শিবালয়','23.9369','90.3336',1,46,NULL,NULL,NULL),(363,'Doulatpur','দৌলতপুর','23.9076','90.3590',1,46,NULL,NULL,NULL),(364,'Singiar','সিংগাইর','23.8703','90.4023',1,46,NULL,NULL,NULL),(365,'Savar','সাভার','23.8200','90.3628',1,47,NULL,NULL,NULL),(366,'Dhamrai','ধামরাই','23.7951','90.2547',1,47,NULL,NULL,NULL),(367,'Keraniganj','কেরাণীগঞ্জ','23.6667','90.5000',1,47,NULL,NULL,NULL),(368,'Nawabganj','নবাবগঞ্জ','23.7242','90.4243',1,47,NULL,NULL,NULL),(369,'Dohar','দোহার','23.7256','90.2918',1,47,NULL,NULL,NULL),(370,'Munshiganj Sadar','মুন্সিগঞ্জ সদর','23.8475','90.4566',1,48,NULL,NULL,NULL),(371,'Sreenagar','শ্রীনগর','23.7723','90.5167',1,48,NULL,NULL,NULL),(372,'Sirajdikhan','সিরাজদিখান','23.7689','90.4584',1,48,NULL,NULL,NULL),(373,'Louhajanj','লৌহজং','23.7520','90.4356',1,48,NULL,NULL,NULL),(374,'Gajaria','গজারিয়া','23.6621','90.5721',1,48,NULL,NULL,NULL),(375,'Tongibari','টংগীবাড়ি','23.8581','90.5911',1,48,NULL,NULL,NULL),(376,'Rajbari Sadar','রাজবাড়ী সদর','23.6349','89.2380',1,49,NULL,NULL,NULL),(377,'Goalanda','গোয়ালন্দ','23.7425','89.4041',1,49,NULL,NULL,NULL),(378,'Pangsa','পাংশা','23.6871','89.3458',1,49,NULL,NULL,NULL),(379,'Baliakandi','বালিয়াকান্দি','23.7273','89.2112',1,49,NULL,NULL,NULL),(380,'Kalukhali','কালুখালী','23.7285','89.2567',1,49,NULL,NULL,NULL),(381,'Madaripur Sadar','মাদারীপুর সদর','23.2014','90.2115',1,50,NULL,NULL,NULL),(382,'Shibchar','শিবচর','23.2952','90.2656',1,50,NULL,NULL,NULL),(383,'Kalkini','কালকিনি','23.2310','90.2068',1,50,NULL,NULL,NULL),(384,'Rajoir','রাজৈর','23.2643','90.1834',1,50,NULL,NULL,NULL),(385,'Gopalganj Sadar','গোপালগঞ্জ সদর','23.2404','89.8349',1,51,NULL,NULL,NULL),(386,'Kashiani','কাশিয়ানী','23.3647','89.8995',1,51,NULL,NULL,NULL),(387,'Tungipara','টুংগীপাড়া','23.3584','89.7420',1,51,NULL,NULL,NULL),(388,'Kotalipara','কোটালীপাড়া','23.2568','89.6933',1,51,NULL,NULL,NULL),(389,'Muksudpur','মুকসুদপুর','23.2430','89.7716',1,51,NULL,NULL,NULL),(390,'Faridpur Sadar','ফরিদপুর সদর','23.6028','89.8276',1,52,NULL,NULL,NULL),(391,'Alfadanga','আলফাডাঙ্গা','23.4889','89.8279',1,52,NULL,NULL,NULL),(392,'Boalmari','বোয়ালমারী','23.4901','89.9520',1,52,NULL,NULL,NULL),(393,'Sadarpur','সদরপুর','23.5378','89.8689',1,52,NULL,NULL,NULL),(394,'Nagarkanda','নগরকান্দা','23.4712','89.8924',1,52,NULL,NULL,NULL),(395,'Bhanga','ভাঙ্গা','23.5067','89.8727',1,52,NULL,NULL,NULL),(396,'Charbhadrasan','চরভদ্রাসন','23.3478','89.9153',1,52,NULL,NULL,NULL),(397,'Madhukhali','মধুখালী','23.4691','89.8824',1,52,NULL,NULL,NULL),(398,'Saltha','সালথা','23.3648','89.8149',1,52,NULL,NULL,NULL),(399,'Panchagarh Sadar','পঞ্চগড় সদর','26.3292','88.6349',1,53,NULL,NULL,NULL),(400,'Debiganj','দেবীগঞ্জ','26.3537','88.5974',1,53,NULL,NULL,NULL),(401,'Boda','বোদা','26.3374','88.5405',1,53,NULL,NULL,NULL),(402,'Atwari','আটোয়ারী','26.2605','88.5292',1,53,NULL,NULL,NULL),(403,'Tetulia','তেতুলিয়া','26.3012','88.4385',1,53,NULL,NULL,NULL),(404,'Nawabganj','নবাবগঞ্জ','25.5812','88.6067',1,54,NULL,NULL,NULL),(405,'Birganj','বীরগঞ্জ','25.5267','88.5884',1,54,NULL,NULL,NULL),(406,'Ghoraghat','ঘোড়াঘাট','25.2685','88.5521',1,54,NULL,NULL,NULL),(407,'Birampur','বিরামপুর','25.6244','88.8013',1,54,NULL,NULL,NULL),(408,'Parbatipur','পার্বতীপুর','25.5895','88.6654',1,54,NULL,NULL,NULL),(409,'Bochaganj','বোচাগঞ্জ','25.5562','88.6560',1,54,NULL,NULL,NULL),(410,'Kaharol','কাহারোল','25.4396','88.6451',1,54,NULL,NULL,NULL),(411,'Fulbari','ফুলবাড়ী','25.5333','88.5121',1,54,NULL,NULL,NULL),(412,'Dinajpur Sadar','দিনাজপুর সদর','25.6312','88.6303',1,54,NULL,NULL,NULL),(413,'Hakimpur','হাকিমপুর','25.8767','88.8191',1,54,NULL,NULL,NULL),(414,'Khansama','খানসামা','25.5092','88.4823',1,54,NULL,NULL,NULL),(415,'Birol','বিরল','25.6618','88.7167',1,54,NULL,NULL,NULL),(416,'Chirirbandar','চিরিরবন্দর','25.5671','88.5250',1,54,NULL,NULL,NULL),(417,'Lalmonirhat Sadar','লালমনিরহাট সদর','25.7394','88.8571',1,55,NULL,NULL,NULL),(418,'Kaliganj','কালীগঞ্জ','25.7283','88.6583',1,55,NULL,NULL,NULL),(419,'Hatibandha','হাতীবান্ধা','25.7136','88.7889',1,55,NULL,NULL,NULL),(420,'Patgram','পাটগ্রাম','26.0808','88.6163',1,55,NULL,NULL,NULL),(421,'Aditmari','আদিতমারী','25.9278','88.7071',1,55,NULL,NULL,NULL),(422,'Syedpur','সৈয়দপুর','25.7619','88.6150',1,56,NULL,NULL,NULL),(423,'Domar','ডোমার','25.7564','88.7473',1,56,NULL,NULL,NULL),(424,'Dimla','ডিমলা','25.9600','88.7862',1,56,NULL,NULL,NULL),(425,'Jaldhaka','জলঢাকা','26.0573','88.7134',1,56,NULL,NULL,NULL),(426,'Kishorganj','কিশোরগঞ্জ','25.9134','88.6539',1,56,NULL,NULL,NULL),(427,'Nilphamari Sadar','নীলফামারী সদর','25.8974','88.5723',1,56,NULL,NULL,NULL),(428,'Sadullapur','সাদুল্লাপুর','25.3755','89.2762',1,57,NULL,NULL,NULL),(429,'Gaibandha Sadar','গাইবান্ধা সদর','25.3482','89.5356',1,57,NULL,NULL,NULL),(430,'Palashbari','পলাশবাড়ী','25.3621','89.4379',1,57,NULL,NULL,NULL),(431,'Saghata','সাঘাটা','25.4835','89.5952',1,57,NULL,NULL,NULL),(432,'Gobindaganj','গোবিন্দগঞ্জ','25.4162','89.6463',1,57,NULL,NULL,NULL),(433,'Sundarganj','সুন্দরগঞ্জ','25.5389','89.3698',1,57,NULL,NULL,NULL),(434,'Phulchari','ফুলছড়ি','25.4026','89.4765',1,57,NULL,NULL,NULL),(435,'Thakurgaon Sadar','ঠাকুরগাঁও সদর','25.5879','88.4792',1,58,NULL,NULL,NULL),(436,'Pirganj','পীরগঞ্জ','25.7286','88.5398',1,58,NULL,NULL,NULL),(437,'Ranisankail','রাণীশংকৈল','25.6497','88.5661',1,58,NULL,NULL,NULL),(438,'Haripur','হরিপুর','25.5673','88.6179',1,58,NULL,NULL,NULL),(439,'Baliadangi','বালিয়াডাঙ্গী','25.5291','88.5865',1,58,NULL,NULL,NULL),(440,'Rangpur Sadar','রংপুর সদর','25.7574','89.2510',1,59,NULL,NULL,NULL),(441,'Gangachara','গংগাচড়া','25.7119','89.2955',1,59,NULL,NULL,NULL),(442,'Taragonj','তারাগঞ্জ','25.6932','89.1762',1,59,NULL,NULL,NULL),(443,'Badargonj','বদরগঞ্জ','25.7137','89.3289',1,59,NULL,NULL,NULL),(444,'Mithapukur','মিঠাপুকুর','25.7416','89.3441',1,59,NULL,NULL,NULL),(445,'Pirgonj','পীরগঞ্জ','25.7264','89.2288',1,59,NULL,NULL,NULL),(446,'Kaunia','কাউনিয়া','25.7422','89.2005',1,59,NULL,NULL,NULL),(447,'Pirgacha','পীরগাছা','25.6305','89.3460',1,59,NULL,NULL,NULL),(448,'Kurigram Sadar','কুড়িগ্রাম সদর','25.7261','89.6611',1,60,NULL,NULL,NULL),(449,'Nageshwari','নাগেশ্বরী','25.6141','89.6817',1,60,NULL,NULL,NULL),(450,'Bhurungamari','ভুরুঙ্গামারী','25.8457','89.7646',1,60,NULL,NULL,NULL),(451,'Phulbari','ফুলবাড়ী','25.7032','89.7205',1,60,NULL,NULL,NULL),(452,'Rajarhat','রাজারহাট','25.7133','89.7301',1,60,NULL,NULL,NULL),(453,'Ulipur','উলিপুর','25.7382','89.7578',1,60,NULL,NULL,NULL),(454,'Chilmari','চিলমারী','25.7456','89.8902',1,60,NULL,NULL,NULL),(455,'Rowmari','রৌমারী','25.7969','89.9092',1,60,NULL,NULL,NULL),(456,'Charrajibpur','চর রাজিবপুর','25.6841','89.9809',1,60,NULL,NULL,NULL),(457,'Sherpur Sadar','শেরপুর সদর','25.0264','90.2000',1,61,NULL,NULL,NULL),(458,'Nalitabari','নালিতাবাড়ী','25.0533','90.2808',1,61,NULL,NULL,NULL),(459,'Sreebordi','শ্রীবরদী','25.1805','90.2554',1,61,NULL,NULL,NULL),(460,'Nokla','নকলা','25.2125','90.3284',1,61,NULL,NULL,NULL),(461,'Jhenaigati','ঝিনাইগাতী','25.2264','90.3920',1,61,NULL,NULL,NULL),(462,'Fulbaria','ফুলবাড়ীয়া','24.7385','90.2367',1,62,NULL,NULL,NULL),(463,'Trishal','ত্রিশাল','24.7481','90.3030',1,62,NULL,NULL,NULL),(464,'Bhaluka','ভালুকা','24.8347','90.3667',1,62,NULL,NULL,NULL),(465,'Muktagacha','মুক্তাগাছা','24.8693','90.4822',1,62,NULL,NULL,NULL),(466,'Mymensingh Sadar','ময়মনসিংহ সদর','24.7511','90.4118',1,62,NULL,NULL,NULL),(467,'Dhobaura','ধোবাউড়া','24.9271','90.4620',1,62,NULL,NULL,NULL),(468,'Phulpur','ফুলপুর','24.9123','90.5109',1,62,NULL,NULL,NULL),(469,'Haluaghat','হালুয়াঘাট','24.8299','90.6048',1,62,NULL,NULL,NULL),(470,'Gouripur','গৌরীপুর','24.9085','90.6010',1,62,NULL,NULL,NULL),(471,'Gafargaon','গফরগাঁও','24.9871','90.6111',1,62,NULL,NULL,NULL),(472,'Iswarganj','ঈশ্বরগঞ্জ','25.0150','90.6234',1,62,NULL,NULL,NULL),(473,'Nandail','নান্দাইল','24.8389','90.5280',1,62,NULL,NULL,NULL),(474,'Tarakanda','তারাকান্দা','24.8324','90.5545',1,62,NULL,NULL,NULL),(475,'Jamalpur Sadar','জামালপুর সদর','24.9292','89.9505',1,63,NULL,NULL,NULL),(476,'Melandah','মেলান্দহ','24.9419','89.8822',1,63,NULL,NULL,NULL),(477,'Islampur','ইসলামপুর','24.9883','89.9145',1,63,NULL,NULL,NULL),(478,'Dewangonj','দেওয়ানগঞ্জ','24.9956','89.8873',1,63,NULL,NULL,NULL),(479,'Sarishabari','সরিষাবাড়ী','25.0436','89.9789',1,63,NULL,NULL,NULL),(480,'Madarganj','মাদারগঞ্জ','25.0821','89.9526',1,63,NULL,NULL,NULL),(481,'Bokshiganj','বকশীগঞ্জ','24.9187','89.6963',1,63,NULL,NULL,NULL),(482,'Barhatta','বারহাট্টা','24.7384','90.9901',1,64,NULL,NULL,NULL),(483,'Durgapur','দুর্গাপুর','24.8776','91.1372',1,64,NULL,NULL,NULL),(484,'Kendua','কেন্দুয়া','24.8481','91.1400',1,64,NULL,NULL,NULL),(485,'Atpara','আটপাড়া','24.7368','91.1826',1,64,NULL,NULL,NULL),(486,'Madan','মদন','24.7562','91.1597',1,64,NULL,NULL,NULL),(487,'Khaliajuri','খালিয়াজুরী','24.7562','91.3457',1,64,NULL,NULL,NULL),(488,'Kalmakanda','কলমাকান্দা','24.8167','91.3155',1,64,NULL,NULL,NULL),(489,'Mohongonj','মোহনগঞ্জ','24.8095','91.2043',1,64,NULL,NULL,NULL),(490,'Purbadhala','পূর্বধলা','24.7771','91.2860',1,64,NULL,NULL,NULL),(491,'Netrokona Sadar','নেত্রকোণা সদর','24.8716','91.2760',1,64,NULL,NULL,NULL),(492,'Adabar Thana','আদাবর থানা','23.7833','90.3675',1,47,NULL,NULL,NULL),(493,'Azampur Thana','আজমপুর থানা','23.7649','90.3676',1,47,NULL,NULL,NULL),(494,'Badda Thana','বাড্ডা থানা','23.7985','90.4007',1,47,NULL,NULL,NULL),(495,'Bangsal Thana','বংশাল থানা','23.7558','90.3964',1,47,NULL,NULL,NULL),(496,'Bimanbandar Thana (Dhaka)','বিমানবন্দর থানা','23.8351','90.4027',1,47,NULL,NULL,NULL),(497,'Cantonment Thana','ক্যান্টনমেন্ট থানা','23.8103','90.4140',1,47,NULL,NULL,NULL),(498,'Chowkbazar Thana','চকবাজার থানা','23.7325','90.4000',1,47,NULL,NULL,NULL),(499,'Darus Salam Thana','দারুস সালাম থানা','23.7565','90.3900',1,47,NULL,NULL,NULL),(500,'Demra Thana','ডেমরা থানা','23.7767','90.4784',1,47,NULL,NULL,NULL),(501,'Dhanmondi Thana','ধানমন্ডি থানা','23.7475','90.3690',1,47,NULL,NULL,NULL),(502,'Gendaria Thana','গেন্ডারিয়া থানা','23.7432','90.4041',1,47,NULL,NULL,NULL),(503,'Hazaribagh Thana','হাজারিবাঘ থানা','23.7460','90.3470',1,47,NULL,NULL,NULL),(504,'Kadamtali Thana','কদমতলি থানা','23.7461','90.3341',1,47,NULL,NULL,NULL),(505,'Kafrul Thana','কাফরুল থানা','23.8354','90.3967',1,47,NULL,NULL,NULL),(506,'Kalabagan Thana','কলাবাগান থানা','23.7489','90.3847',1,47,NULL,NULL,NULL),(507,'Kamrangirchar Thana','কামরাংগিচর থানা','23.7390','90.4565',1,47,NULL,NULL,NULL),(508,'Khilgaon Thana','খিলগাঁ থানা','23.7825','90.4600',1,47,NULL,NULL,NULL),(509,'Khilkhet Thana','খিলখেত থানা','23.8456','90.4095',1,47,NULL,NULL,NULL),(510,'Kotwali Thana (Dhaka)','কতোয়াখালি থানা','23.8118','90.4056',1,47,NULL,NULL,NULL),(511,'Lalbagh Thana','লালবাঘ থানা','23.7281','90.3689',1,47,NULL,NULL,NULL),(512,'Mirpur Model Thana','মিরপুর থানা','23.8043','90.3569',1,47,NULL,NULL,NULL),(513,'Mohammadpur Thana','মুহাম্মাদপুর থানা','23.7547','90.3502',1,47,NULL,NULL,NULL),(514,'Motijheel Thana','মতিঝিল থানা','23.7417','90.3765',1,47,NULL,NULL,NULL),(515,'New Market Thana','নিউ মার্কেট থানা','23.7469','90.3832',1,47,NULL,NULL,NULL),(516,'Pallabi Thana','পল্লবি থানা','23.7976','90.3444',1,47,NULL,NULL,NULL),(517,'Paltan Thana','পল্টন থানা','23.7436','90.3757',1,47,NULL,NULL,NULL),(518,'Panthapath Thana','পান্থপথ থানা','23.7472','90.3963',1,47,NULL,NULL,NULL),(519,'Ramna Thana','রমনা থানা','23.7425','90.3921',1,47,NULL,NULL,NULL),(520,'Rampura Thana','রামপুরা থানা','23.7769','90.4587',1,47,NULL,NULL,NULL),(521,'Sabujbagh Thana','সবুজবাঘ থানা','23.7862','90.4064',1,47,NULL,NULL,NULL),(522,'Shah Ali Thana','সাহ্‌ আলী থানা','23.7667','90.3753',1,47,NULL,NULL,NULL),(523,'Shahbag Thana','শাহ্‌বাগ থানা','23.7375','90.3812',1,47,NULL,NULL,NULL),(524,'Sher-e-Bangla Nagar','শেরে-ই-বাংলা নগর থানা','23.7749','90.3688',1,47,NULL,NULL,NULL),(525,'Shyampur Thana','শ্যামপুর থানা','23.7563','90.4705',1,47,NULL,NULL,NULL),(526,'Sutrapur Thana','সুত্রাপুর থানা','23.7431','90.3840',1,47,NULL,NULL,NULL),(527,'Tejgaon Industrial Area Thana','তেজগাঁও ইন্ডাস্ট্রিয়াল থানা','23.8179','90.3862',1,47,NULL,NULL,NULL),(528,'Tejgaon Thana','তেজগাঁও থানা','23.7958','90.4092',1,47,NULL,NULL,NULL),(529,'Turag Thana','তুরাগ থানা','23.8600','90.3640',1,47,NULL,NULL,NULL),(530,'Uttar Khan Thana','উত্তর খান থানা','23.8751','90.3960',1,47,NULL,NULL,NULL),(531,'Uttara West Thana','উত্তরা পশ্চিম থানা','23.8841','90.4002',1,47,NULL,NULL,NULL),(532,'Vatara Thana','ভাটারা থানা','23.7973','90.4001',1,47,NULL,NULL,NULL),(533,'Wari Thana','ওয়ারি থানা','23.7462','90.3764',1,47,NULL,NULL,NULL),(534,'Uttara East Thana','উত্তরা পূর্ব থানা','23.8769','90.3976',1,47,NULL,NULL,NULL),(535,'Dakshinkhan Thana','দক্ষিনখান থানা','23.8662','90.3834',1,47,NULL,NULL,NULL),(536,'Akbarshah Thana','আকবরশাহ থানা','22.3620','91.7812',1,8,NULL,NULL,NULL),(537,'Bakoliya Thana','বাকোলিয়া থানা','22.3553','91.7911',1,8,NULL,NULL,NULL),(538,'Bandar Thana','বন্দর থানা','22.3227','91.8152',1,8,NULL,NULL,NULL),(539,'Bayazid Thana','বায়জিদ থানা','22.3637','91.8059',1,8,NULL,NULL,NULL),(540,'Bhujpur Thana','ভুজপুর থানা','22.3145','91.7738',1,8,NULL,NULL,NULL),(541,'Chandgaon Thana','চন্দগন থানা','22.3394','91.7855',1,8,NULL,NULL,NULL),(542,'Chaowkbazar Thana','চকবাজার থানা','22.3312','91.7733',1,8,NULL,NULL,NULL),(543,'Chittagong Kotwali Thana','চিটাগাং থানা','22.3534','91.8030',1,8,NULL,NULL,NULL),(544,'Double Mooring Thana','ডাবল মর্নিং থানা','22.3249','91.8136',1,8,NULL,NULL,NULL),(545,'EPZ Thana Thana','ইপিজেড থানা','22.2874','91.8363',1,8,NULL,NULL,NULL),(546,'Halishahar Thana','হালিশাহার থানা','22.3280','91.8088',1,8,NULL,NULL,NULL),(547,'Karnaphuli Thana','কর্ণফুলি থানা','22.3004','91.8039',1,8,NULL,NULL,NULL),(548,'Khulshi Thana','খুলসি থানা','22.3485','91.7992',1,8,NULL,NULL,NULL),(549,'Kotwali Thana (Chittagong)','কতোয়াখালি থানা','22.3551','91.8045',1,8,NULL,NULL,NULL),(550,'Pahartali Thana','পাহারতলি থানা','22.3661','91.7932',1,8,NULL,NULL,NULL),(551,'Panchlaish Thana','পাঞ্চলাইস থানা','22.3177','91.7868',1,8,NULL,NULL,NULL),(552,'Patenga Thana','পতেংগা থানা','22.2345','91.7834',1,8,NULL,NULL,NULL),(553,'Gulshan Thana','গুলশান থানা','23.8103','90.3943',1,47,NULL,NULL,NULL),(554,'Banani Thana','বনানী থানা','23.8174','90.4060',1,47,NULL,NULL,NULL),(555,'Sadar Thana','সদর/জয়দেবপুর থানা','23.8250','90.3861',1,41,NULL,NULL,NULL),(556,'Bason Thana','বাসন থানা','23.8723','90.3684',1,41,NULL,NULL,NULL),(557,'Konabari Thana','কোনাবাড়ী থানা','23.8041','90.3963',1,41,NULL,NULL,NULL),(558,'Kashimpur Thana','কাশিমপুর থানা','23.8352','90.4025',1,41,NULL,NULL,NULL),(559,'Gacha Thana','গাছা থানা','23.8680','90.3972',1,41,NULL,NULL,NULL),(560,'Pubail Thana','পূবাইল থানা','23.8573','90.3817',1,41,NULL,NULL,NULL),(561,'Tongi West Thana','টঙ্গী পশ্চিম থানা','23.8711','90.3856',1,41,NULL,NULL,NULL),(562,'Tongi East Thana','টঙ্গী পূর্ব থানা','23.8668','90.3895',1,41,NULL,NULL,NULL),(563,'Eidgaon','ঈদগাঁও','21.4729','92.0245',1,9,NULL,NULL,NULL),(564,'Madhyanagar','মধ্যনগর','24.8278','90.9778',1,39,NULL,NULL,NULL),(565,'Dasar','ডাসার','23.1381','90.1703',1,50,NULL,NULL,NULL),(566,'Shayestaganj','শায়েস্তাগঞ্জ','24.2682','91.4525',1,38,NULL,NULL,NULL),(567,'Shantiganj','শান্তিগঞ্জ','24.9395','91.4136',1,39,NULL,NULL,NULL),(568,'Borhan Uddin','বোরহান উদ্দিন','22.4753','90.7153',1,34,NULL,NULL,NULL);
/*!40000 ALTER TABLE `upazilas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `division_id` bigint unsigned DEFAULT NULL,
  `district_id` bigint unsigned DEFAULT NULL,
  `upazila_id` bigint unsigned DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  KEY `users_division_id_foreign` (`division_id`),
  KEY `users_district_id_foreign` (`district_id`),
  KEY `users_upazila_id_foreign` (`upazila_id`),
  CONSTRAINT `users_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `users_upazila_id_foreign` FOREIGN KEY (`upazila_id`) REFERENCES `upazilas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (8,'asm fahim','asmfahim@gmail.com',NULL,'01612345678','$2y$12$zIBzlkQ7JXvwZzKIuGzJJuZTgJ9J/gCNahA7eFIRikaHPrOxVfZqy',NULL,NULL,NULL,NULL,NULL,NULL,'2025-12-19 10:49:50','2025-12-19 10:49:50');
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

-- Dump completed on 2025-12-22 15:57:28
