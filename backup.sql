-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: localhost    Database: budget_laravel_db
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.22.04.3

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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `space_id` int unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `entity_id` int unsigned NOT NULL,
  `entity_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activities_space_id_foreign` (`space_id`),
  KEY `activities_user_id_foreign` (`user_id`),
  CONSTRAINT `activities_space_id_foreign` FOREIGN KEY (`space_id`) REFERENCES `spaces` (`id`),
  CONSTRAINT `activities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,4,1,1,'earning','transaction.created','2024-07-02 18:45:26','2024-07-02 18:45:26'),(2,4,2,2,'earning','transaction.created','2024-07-02 18:46:07','2024-07-02 18:46:07'),(3,4,1,1,'tag','tag.created','2024-07-03 03:05:10','2024-07-03 03:05:10'),(4,4,1,2,'tag','tag.created','2024-07-03 03:05:22','2024-07-03 03:05:22'),(5,4,1,1,'spending','transaction.created','2024-07-03 03:06:39','2024-07-03 03:06:39'),(6,4,1,2,'spending','transaction.created','2024-07-03 03:07:36','2024-07-03 03:07:36'),(7,4,1,3,'spending','transaction.created','2024-07-03 17:39:23','2024-07-03 17:39:23'),(8,4,2,3,'earning','transaction.created','2024-07-04 17:08:49','2024-07-04 17:08:49'),(9,4,2,3,'earning','transaction.deleted','2024-07-04 17:08:52','2024-07-04 17:08:52'),(10,4,2,4,'spending','transaction.created','2024-07-04 17:10:29','2024-07-04 17:10:29'),(11,4,2,5,'spending','transaction.created','2024-07-04 17:51:36','2024-07-04 17:51:36'),(12,4,2,4,'spending','transaction.deleted','2024-07-04 17:51:41','2024-07-04 17:51:41'),(13,4,2,3,'tag','tag.created','2024-07-04 17:52:30','2024-07-04 17:52:30'),(14,4,2,6,'spending','transaction.created','2024-07-04 17:53:47','2024-07-04 17:53:47'),(15,4,1,7,'spending','transaction.created','2024-07-05 18:07:45','2024-07-05 18:07:45'),(16,4,1,8,'spending','transaction.created','2024-07-05 18:08:18','2024-07-05 18:08:18'),(17,4,2,9,'spending','transaction.created','2024-07-06 15:27:55','2024-07-06 15:27:55'),(18,4,2,10,'spending','transaction.created','2024-07-06 15:29:26','2024-07-06 15:29:26'),(19,4,2,11,'spending','transaction.created','2024-07-08 17:59:51','2024-07-08 17:59:51'),(20,4,2,12,'spending','transaction.created','2024-07-08 18:00:41','2024-07-08 18:00:41'),(21,4,2,13,'spending','transaction.created','2024-07-08 18:04:25','2024-07-08 18:04:25'),(22,4,2,14,'spending','transaction.created','2024-07-08 18:06:45','2024-07-08 18:06:45'),(23,4,2,15,'spending','transaction.created','2024-07-08 18:07:29','2024-07-08 18:07:29'),(24,5,1,4,'earning','transaction.created','2024-07-08 18:09:15','2024-07-08 18:09:15'),(25,5,1,5,'earning','transaction.created','2024-07-08 18:09:42','2024-07-08 18:09:42'),(26,5,1,6,'earning','transaction.created','2024-07-08 18:10:34','2024-07-08 18:10:34'),(27,4,1,7,'earning','transaction.created','2024-07-08 18:18:50','2024-07-08 18:18:50');
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_keys`
--

DROP TABLE IF EXISTS `api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_keys` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_keys_token_unique` (`token`),
  KEY `api_keys_user_id_foreign` (`user_id`),
  CONSTRAINT `api_keys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_keys`
--

LOCK TABLES `api_keys` WRITE;
/*!40000 ALTER TABLE `api_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `transaction_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budgets`
--

DROP TABLE IF EXISTS `budgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `space_id` int unsigned NOT NULL,
  `tag_id` int unsigned NOT NULL,
  `period` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int unsigned NOT NULL,
  `starts_on` date NOT NULL,
  `ends_on` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budgets`
--

LOCK TABLES `budgets` WRITE;
/*!40000 ALTER TABLE `budgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `budgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversion_rates`
--

DROP TABLE IF EXISTS `conversion_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversion_rates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `base_currency_id` int unsigned NOT NULL,
  `target_currency_id` int unsigned NOT NULL,
  `rate` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversion_rates`
--

LOCK TABLES `conversion_rates` WRITE;
/*!40000 ALTER TABLE `conversion_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversion_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'Euro','&euro;','EUR'),(2,'US Dollar','&dollar;','USD'),(3,'British Pound','&pound;','GBP'),(4,'Libyan Dinar','LYD','LYD'),(5,'Tunisian Dinar','TND','TND'),(6,'Ghanaian Cedis','GHS','GHS'),(7,'Sudanese Pound','SDG','SDG'),(8,'Moroccan Dirham','MAD','MAD'),(9,'Botswana Pula','BWP','BWP'),(10,'South African Rand','ZAR','ZAR'),(11,'Egyptian Pound','EGP','EGP'),(12,'Eritrean Nakfa','ERN','ERN'),(13,'Zambian Kwacha','ZMW','ZMW'),(14,'Angolan Kwanza','AKZ','AKZ'),(15,'Argentine Peso','ARS','ARS'),(16,'Bolivian Boliviano','BOB','BOB'),(17,'Brazilian Real','BRL','BRL'),(18,'Chilean Peso','CLP','CLP'),(19,'Colombian Peso','COP','COP'),(20,'Paraguayan Guarani','PYG','PYG'),(21,'Peruvian Novo Sol','PEN','PEN'),(22,'Uruguayan Peso','UYU','UYU'),(23,'Venezuelan Bolivar','VES','VES'),(24,'Danish Krone','DKK','DKK'),(25,'Icelandic Krona','ISK','ISK'),(26,'Norwegian Krone','NOK','NOK'),(27,'Swedish Krona','SEK','SEK'),(28,'Albanian Lek','ALL','ALL'),(29,'Armenian Dram','AMD','AMD'),(30,'Azerbaijani Manat','AZN','AZN'),(31,'Bosnia and Herzegovina Convertible Mark','BAM','BAM'),(32,'Bulgarian Lev','BGN','BGN'),(33,'Belarusian Ruble','BYN','BYN'),(34,'Swiss Franc','CHF','CHF'),(35,'Czech Koruna','CZK','CZK'),(36,'Turkish lira','TRY','TRY'),(37,'Yuan','元','CNY'),(38,'Yen','&yen;','JPY'),(39,'Australian dollar','$','AUD'),(40,'Hong Kong dollar','HK$','HKD'),(41,'Indian rupee','₹','INR'),(42,'Rupiah','Rp','IDR'),(43,'Ringgit','RM','MYR'),(44,'South Korean won','₩','KRW'),(45,'Philippine peso','₱','PHP'),(46,'Singapore dollar','$','SGD'),(47,'New Taiwan dollar','NT$','TWD'),(48,'Baht','฿','THB'),(49,'đồng','₫','VND'),(50,'Bangladeshi taka','BDT','BDT');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `earnings`
--

DROP TABLE IF EXISTS `earnings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `earnings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `space_id` int unsigned NOT NULL,
  `recurring_id` int unsigned DEFAULT NULL,
  `happened_on` date NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `earnings_space_id_foreign` (`space_id`),
  KEY `earnings_recurring_id_foreign` (`recurring_id`),
  CONSTRAINT `earnings_recurring_id_foreign` FOREIGN KEY (`recurring_id`) REFERENCES `recurrings` (`id`),
  CONSTRAINT `earnings_space_id_foreign` FOREIGN KEY (`space_id`) REFERENCES `spaces` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `earnings`
--

LOCK TABLES `earnings` WRITE;
/*!40000 ALTER TABLE `earnings` DISABLE KEYS */;
INSERT INTO `earnings` VALUES (1,4,NULL,'2024-07-02','Parte Fabián-jULIO',35000000,'2024-07-02 18:45:26','2024-07-02 18:45:26',NULL),(2,4,NULL,'2024-07-02','Parte Eliana',35000000,'2024-07-02 18:46:07','2024-07-02 18:46:07',NULL),(3,4,NULL,'2024-07-04','Arepas-Chorizos',3200000,'2024-07-04 17:08:49','2024-07-04 17:08:52','2024-07-04 17:08:52'),(4,5,NULL,'2024-07-07','Microhondas',26500000,'2024-07-08 18:09:15','2024-07-08 18:09:15',NULL),(5,5,NULL,'2024-07-07','Televisor Challeger 43',95000000,'2024-07-08 18:09:42','2024-07-08 18:09:42',NULL),(6,5,NULL,'2024-07-06','Muebles y comedor',260500000,'2024-07-08 18:10:34','2024-07-08 18:10:34',NULL),(7,4,NULL,'2024-07-08','Ingreso Eliana y Fabian',10000000,'2024-07-08 18:18:50','2024-07-08 18:18:50',NULL);
/*!40000 ALTER TABLE `earnings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `space_id` int unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `column_happened_on` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `column_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `column_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `imports_space_id_foreign` (`space_id`),
  CONSTRAINT `imports_space_id_foreign` FOREIGN KEY (`space_id`) REFERENCES `spaces` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imports`
--

LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
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
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_attempts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login_attempts_user_id_foreign` (`user_id`),
  CONSTRAINT `login_attempts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempts`
--

LOCK TABLES `login_attempts` WRITE;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
INSERT INTO `login_attempts` VALUES (1,1,'200.91.210.193',0,'2024-06-28 16:39:58','2024-06-28 16:39:58'),(2,2,'191.156.59.111',0,'2024-07-02 18:40:36','2024-07-02 18:40:36'),(3,1,'191.156.252.145',1,'2024-07-02 18:41:10','2024-07-02 18:41:10'),(4,1,'191.156.252.145',0,'2024-07-02 18:41:21','2024-07-02 18:41:21'),(5,1,'191.156.246.1',0,'2024-07-03 03:04:32','2024-07-03 03:04:32'),(6,1,'191.156.61.222',0,'2024-07-03 17:38:55','2024-07-03 17:38:55'),(7,2,'191.156.62.99',0,'2024-07-04 17:08:25','2024-07-04 17:08:25'),(8,1,'200.91.210.193',0,'2024-07-04 21:27:44','2024-07-04 21:27:44'),(9,1,'191.156.247.231',0,'2024-07-05 18:03:57','2024-07-05 18:03:57'),(10,2,'191.156.63.71',0,'2024-07-06 15:26:50','2024-07-06 15:26:50'),(11,2,'191.156.253.193',0,'2024-07-08 17:58:19','2024-07-08 17:58:19'),(12,1,'191.156.254.66',0,'2024-07-08 18:02:28','2024-07-08 18:02:28');
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_11_000000_create_currencies_table',1),(2,'2014_10_12_000000_create_users_table',1),(3,'2014_10_12_100000_create_password_resets_table',1),(4,'2017_07_19_000000_create_tags_table',1),(5,'2017_07_20_000000_create_spendings_table',1),(6,'2017_07_21_000000_create_earnings_table',1),(7,'2018_09_12_150232_create_jobs_table',1),(8,'2018_09_13_112448_create_recurrings_table',1),(9,'2018_10_02_185825_create_spaces_table',1),(10,'2018_10_02_190502_create_user_space_table',1),(11,'2018_10_05_195046_add_overdue_foreign_keys',1),(12,'2018_10_10_150420_create_failed_jobs_table',1),(13,'2018_10_14_122724_create_imports_table',1),(14,'2018_10_14_132003_add_import_id_column_to_spendings_table',1),(15,'2018_10_24_062234_insert_major_western_currencies',1),(16,'2018_11_06_201307_create_ideas_table',1),(17,'2018_11_19_180234_insert_african_currencies',1),(18,'2018_11_23_161828_move_currency_id_column_to_spaces_table',1),(19,'2018_12_17_174821_create_activities_table',1),(20,'2019_01_02_230218_create_login_attempts_table',1),(21,'2020_06_05_153853_add_recurring_id_column_to_earnings_table',1),(22,'2020_06_05_160120_rename_type_column_to_interval_in_recurrings_table',1),(23,'2020_06_05_160648_add_type_column_to_recurrings_table',1),(24,'2020_06_13_151635_create_attachments_table',1),(25,'2020_06_16_184356_insert_south_american_currencies',1),(26,'2020_06_20_145102_insert_nordic_currencies',1),(27,'2020_06_22_151359_insert_remaining_european_currencies',1),(28,'2020_06_28_202633_create_conversion_rates_table',1),(29,'2020_06_30_204814_add_currency_id_column_to_recurrings_table',1),(30,'2020_07_01_181201_create_budgets_table',1),(31,'2020_07_01_230418_add_iso_column_to_currencies_table',1),(32,'2020_07_15_195639_create_space_invites_table',1),(33,'2020_07_21_184946_add_last_verification_mail_sent_at_column_to_users_table',1),(34,'2020_07_25_130850_add_plan_column_to_users_table',1),(35,'2020_07_26_162432_add_stripe_customer_id_column_to_users_table',1),(36,'2020_07_28_211805_create_widgets_table',1),(37,'2020_09_27_212734_insert_turkish_lira_into_currencies_table',1),(38,'2020_09_28_153744_add_default_transaction_type_column_to_users_table',1),(39,'2020_09_28_181541_insert_asian_currencies',1),(40,'2020_09_29_193515_add_first_day_of_week_column_to_users_table',1),(41,'2020_12_21_232350_add_uuid_column_to_failed_jobs_table',1),(42,'2020_12_21_232403_generate_missing_uuids_for_failed_jobs',1),(43,'2020_12_27_202727_create_default_widgets_for_existing_users',1),(44,'2021_01_15_124130_insert_bangladeshi_taka_into_currencies_table',1),(45,'2021_06_23_200708_delete_budgets_without_tags',1),(46,'2023_10_26_220756_change_column_type_to_unsigned_big_integer_for_id_in_users_table',1),(47,'2023_11_05_012524_create_api_keys_table',1),(48,'2023_12_24_210952_remove_stripe_and_plan_related_columns_from_users_table',1),(49,'2023_12_26_214729_drop_ideas_table',1),(50,'2024_06_27_203229_add_color_to_spaces_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recurrings`
--

DROP TABLE IF EXISTS `recurrings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recurrings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `space_id` int unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `starts_on` date NOT NULL,
  `ends_on` date DEFAULT NULL,
  `last_used_on` date DEFAULT NULL,
  `tag_id` int unsigned DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int NOT NULL,
  `currency_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recurrings_space_id_foreign` (`space_id`),
  KEY `recurrings_tag_id_foreign` (`tag_id`),
  CONSTRAINT `recurrings_space_id_foreign` FOREIGN KEY (`space_id`) REFERENCES `spaces` (`id`),
  CONSTRAINT `recurrings_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurrings`
--

LOCK TABLES `recurrings` WRITE;
/*!40000 ALTER TABLE `recurrings` DISABLE KEYS */;
/*!40000 ALTER TABLE `recurrings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `space_invites`
--

DROP TABLE IF EXISTS `space_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `space_invites` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `space_id` int unsigned NOT NULL,
  `invitee_user_id` int unsigned NOT NULL,
  `inviter_user_id` int unsigned NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accepted` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `space_invites`
--

LOCK TABLES `space_invites` WRITE;
/*!40000 ALTER TABLE `space_invites` DISABLE KEYS */;
INSERT INTO `space_invites` VALUES (1,3,2,1,'admin',1,'2024-07-02 18:42:03','2024-07-02 18:42:18'),(2,4,2,1,'admin',1,'2024-07-02 18:43:58','2024-07-02 18:44:11'),(3,5,2,1,'admin',1,'2024-07-08 18:23:01','2024-07-08 18:23:17');
/*!40000 ALTER TABLE `space_invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spaces`
--

DROP TABLE IF EXISTS `spaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spaces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `currency_id` int unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `spaces_currency_id_foreign` (`currency_id`),
  CONSTRAINT `spaces_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spaces`
--

LOCK TABLES `spaces` WRITE;
/*!40000 ALTER TABLE `spaces` DISABLE KEYS */;
INSERT INTO `spaces` VALUES (1,19,'Fabian Suarez\'s Space','0000FF','2024-06-28 16:39:56','2024-06-28 16:39:56',NULL),(2,19,'Eliana Galvis\'s Space','0000FF','2024-07-02 18:40:33','2024-07-02 18:40:33',NULL),(3,1,'MI AMORCITO','8c18e2','2024-07-02 18:41:48','2024-07-02 18:41:48',NULL),(4,19,'CASAA','8BFF00','2024-07-02 18:43:46','2024-07-02 18:43:46',NULL),(5,19,'DEUDA APARTAMENTO','8014DD','2024-07-08 18:05:18','2024-07-08 18:12:14',NULL);
/*!40000 ALTER TABLE `spaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spendings`
--

DROP TABLE IF EXISTS `spendings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spendings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `space_id` int unsigned NOT NULL,
  `import_id` int unsigned DEFAULT NULL,
  `recurring_id` int unsigned DEFAULT NULL,
  `tag_id` int unsigned DEFAULT NULL,
  `happened_on` date NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `spendings_space_id_foreign` (`space_id`),
  KEY `spendings_recurring_id_foreign` (`recurring_id`),
  KEY `spendings_tag_id_foreign` (`tag_id`),
  KEY `spendings_import_id_foreign` (`import_id`),
  CONSTRAINT `spendings_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`),
  CONSTRAINT `spendings_recurring_id_foreign` FOREIGN KEY (`recurring_id`) REFERENCES `recurrings` (`id`),
  CONSTRAINT `spendings_space_id_foreign` FOREIGN KEY (`space_id`) REFERENCES `spaces` (`id`),
  CONSTRAINT `spendings_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spendings`
--

LOCK TABLES `spendings` WRITE;
/*!40000 ALTER TABLE `spendings` DISABLE KEYS */;
INSERT INTO `spendings` VALUES (1,4,NULL,NULL,1,'2024-07-03','Compra D1 - útiles de aseo',8600000,'2024-07-03 03:06:39','2024-07-03 03:06:39',NULL),(2,4,NULL,NULL,1,'2024-07-03','Tienda',1260000,'2024-07-03 03:07:36','2024-07-03 03:07:36',NULL),(3,4,NULL,NULL,2,'2024-07-03','Almuerzo',1600000,'2024-07-03 17:39:23','2024-07-03 17:39:23',NULL),(4,4,NULL,NULL,1,'2024-07-04','Arepas-Chorizos',3200000,'2024-07-04 17:10:29','2024-07-04 17:51:41','2024-07-04 17:51:41'),(5,4,NULL,NULL,2,'2024-07-04','Almuerzo',1600000,'2024-07-04 17:51:36','2024-07-04 17:51:36',NULL),(6,4,NULL,NULL,3,'2024-07-03','Arepas-Chorizos',3200000,'2024-07-04 17:53:47','2024-07-04 17:53:47',NULL),(7,4,NULL,NULL,3,'2024-07-04','Comida - morrongo',2800000,'2024-07-05 18:07:45','2024-07-06 15:28:53',NULL),(8,4,NULL,NULL,2,'2024-07-05','Almuerzo',1800000,'2024-07-05 18:08:18','2024-07-06 15:29:41',NULL),(9,4,NULL,NULL,3,'2024-07-05','Hamburguesas',4200000,'2024-07-06 15:27:55','2024-07-06 15:27:55',NULL),(10,4,NULL,NULL,3,'2024-07-05','Gaseosa',500000,'2024-07-06 15:29:26','2024-07-06 15:29:26',NULL),(11,4,NULL,NULL,2,'2024-07-06','Almuerzo',1100000,'2024-07-08 17:59:51','2024-07-08 17:59:51',NULL),(12,4,NULL,NULL,3,'2024-07-06','Arepas de huevo',1500000,'2024-07-08 18:00:41','2024-07-08 18:00:41',NULL),(13,4,NULL,NULL,2,'2024-07-08','Almuerzo',2000000,'2024-07-08 18:04:25','2024-07-08 18:04:25',NULL),(14,4,NULL,NULL,1,'2024-07-07','Bom bom bum',1000000,'2024-07-08 18:06:45','2024-07-08 18:06:45',NULL),(15,4,NULL,NULL,1,'2024-07-07','Leches',3400000,'2024-07-08 18:07:29','2024-07-08 18:07:29',NULL);
/*!40000 ALTER TABLE `spendings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `space_id` int unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` char(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_space_id_foreign` (`space_id`),
  CONSTRAINT `tags_space_id_foreign` FOREIGN KEY (`space_id`) REFERENCES `spaces` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,4,'Mercado','C39000','2024-07-03 03:05:10','2024-07-03 03:05:10',NULL),(2,4,'Almuerzos','C9173B','2024-07-03 03:05:22','2024-07-03 03:05:22',NULL),(3,4,'Desayuno-Cena','7558CB','2024-07-04 17:52:30','2024-07-04 17:52:30',NULL);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_space`
--

DROP TABLE IF EXISTS `user_space`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_space` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `space_id` int unsigned NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'regular',
  PRIMARY KEY (`id`),
  KEY `user_space_space_id_foreign` (`space_id`),
  KEY `user_space_user_id_foreign` (`user_id`),
  CONSTRAINT `user_space_space_id_foreign` FOREIGN KEY (`space_id`) REFERENCES `spaces` (`id`),
  CONSTRAINT `user_space_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_space`
--

LOCK TABLES `user_space` WRITE;
/*!40000 ALTER TABLE `user_space` DISABLE KEYS */;
INSERT INTO `user_space` VALUES (1,1,1,'admin'),(2,2,2,'admin'),(3,1,3,'admin'),(4,2,3,'admin'),(5,1,4,'admin'),(6,2,4,'admin'),(7,1,5,'admin'),(8,2,5,'admin');
/*!40000 ALTER TABLE `user_space` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verification_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_verification_mail_sent_at` datetime DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'light',
  `weekly_report` tinyint(1) NOT NULL DEFAULT '1',
  `default_transaction_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'earning',
  `first_day_of_week` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'monday',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'Fabian Suarez','inge.fabiansuarez@gmail.com','$2y$10$pxi6LM1snHW9v9hloPl2veBnS7WC1zZSx6.9sZN1pM7Rp8AXUxjBi',NULL,'2024-06-28 16:39:58',NULL,'es','light',1,'earning','monday','2024-06-28 16:39:56','2024-07-02 18:44:42'),(2,NULL,'Eliana Galvis','elianafono22@gmail.com','$2y$10$QSG8iSldRSrQZGOsl5rC1untn1JZpUnky4xBmBwRH9cnBhT7iKLAS',NULL,'2024-07-02 18:41:19',NULL,'es','light',1,'earning','monday','2024-07-02 18:40:33','2024-07-02 18:46:55');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sorting_index` int unsigned NOT NULL,
  `properties` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `widgets_user_id_foreign` (`user_id`),
  CONSTRAINT `widgets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,1,'balance',0,'{}','2024-06-28 16:39:56','2024-06-28 16:39:56',NULL),(2,1,'spent',1,'{\"period\":\"today\"}','2024-06-28 16:39:56','2024-06-28 16:39:56',NULL),(3,1,'spent',2,'{\"period\":\"this_month\"}','2024-06-28 16:39:56','2024-06-28 16:39:56',NULL),(4,2,'balance',0,'{}','2024-07-02 18:40:33','2024-07-02 18:40:33',NULL),(5,2,'spent',1,'{\"period\":\"today\"}','2024-07-02 18:40:33','2024-07-02 18:40:33',NULL),(6,2,'spent',2,'{\"period\":\"this_month\"}','2024-07-02 18:40:33','2024-07-02 18:40:33',NULL);
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-08 20:32:08
