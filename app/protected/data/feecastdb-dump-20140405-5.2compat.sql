CREATE DATABASE  IF NOT EXISTS `feecastdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `feecastdb`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: feecastdb
-- ------------------------------------------------------
-- Server version	5.6.16-log

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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient` int(11) NOT NULL,
  `center` int(11) NOT NULL,
  `physician` int(11) DEFAULT NULL,
  `cpt` int(11) DEFAULT NULL,
  `highLevelDesc` varchar(256) DEFAULT NULL,
  `estFee` double NOT NULL DEFAULT '0',
  `dateReq` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateClosed` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_idx` (`patient`),
  KEY `center_idx` (`center`),
  KEY `physician_idx` (`physician`),
  KEY `cpt_idx` (`cpt`),
  CONSTRAINT `APPT_patient` FOREIGN KEY (`patient`) REFERENCES `patient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `APPT_center` FOREIGN KEY (`center`) REFERENCES `center` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `APPT_physician` FOREIGN KEY (`physician`) REFERENCES `physician` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `APPT_cpt` FOREIGN KEY (`cpt`) REFERENCES `cpt` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `body_part`
--

DROP TABLE IF EXISTS `body_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `body_part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bpName` varchar(45) NOT NULL,
  `bpNote` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `body_part`
--

LOCK TABLES `body_part` WRITE;
/*!40000 ALTER TABLE `body_part` DISABLE KEYS */;
INSERT INTO `body_part` VALUES (1,'MRI',''),(2,'Knee',''),(3,'Shoulder',''),(4,'Head',''),(5,'Nose','');
/*!40000 ALTER TABLE `body_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `center`
--

DROP TABLE IF EXISTS `center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `center` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TIN` int(11) NOT NULL,
  `centLogin` varchar(45) NOT NULL,
  `centPwd` varchar(40) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `addrNum` int(11) DEFAULT NULL,
  `addrRoad` varchar(128) DEFAULT NULL,
  `addrCity` varchar(128) DEFAULT NULL,
  `addrState` varchar(2) DEFAULT NULL,
  `addrZip` int(11) DEFAULT NULL,
  `logoLoc` varchar(200) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateUpdated` timestamp NULL DEFAULT NULL,
  `phone` char(10) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `desc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `TIN_UNIQUE` (`TIN`),
  UNIQUE KEY `centLogin_UNIQUE` (`centLogin`),
  UNIQUE KEY `Name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `center`
--

LOCK TABLES `center` WRITE;
/*!40000 ALTER TABLE `center` DISABLE KEYS */;
/*!40000 ALTER TABLE `center` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `center_amenities`
--

DROP TABLE IF EXISTS `center_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `center_amenities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center` int(11) NOT NULL,
  `amenity` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CENTAMEN_center` (`center`),
  CONSTRAINT `CENTAMEN_center` FOREIGN KEY (`center`) REFERENCES `center` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `center_amenities`
--

LOCK TABLES `center_amenities` WRITE;
/*!40000 ALTER TABLE `center_amenities` DISABLE KEYS */;
/*!40000 ALTER TABLE `center_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `center_hours`
--

DROP TABLE IF EXISTS `center_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `center_hours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center` int(11) NOT NULL,
  `workdaysSame` bit(1) NOT NULL DEFAULT b'0',
  `monSt` int(11) NOT NULL,
  `monFin` int(11) NOT NULL,
  `satSt` int(11) NOT NULL,
  `satFin` int(11) NOT NULL,
  `satOpen` bit(1) NOT NULL DEFAULT b'1',
  `sunSt` int(11) NOT NULL,
  `sunFin` int(11) NOT NULL,
  `sunOpen` bit(1) NOT NULL DEFAULT b'0',
  `notes` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CENTHOURS_center` (`center`),
  CONSTRAINT `CENTHOURS_center` FOREIGN KEY (`center`) REFERENCES `center` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `center_hours`
--

LOCK TABLES `center_hours` WRITE;
/*!40000 ALTER TABLE `center_hours` DISABLE KEYS */;
/*!40000 ALTER TABLE `center_hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `center_ins`
--

DROP TABLE IF EXISTS `center_ins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `center_ins` (
  `center` int(11) NOT NULL,
  `insurance` int(11) NOT NULL,
  PRIMARY KEY (`center`,`insurance`),
  KEY `insurance_idx` (`insurance`),
  CONSTRAINT `CENTINS_center` FOREIGN KEY (`center`) REFERENCES `center` (`id`),
  CONSTRAINT `CENTINS_insurance` FOREIGN KEY (`insurance`) REFERENCES `ins_provider` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `center_ins`
--

LOCK TABLES `center_ins` WRITE;
/*!40000 ALTER TABLE `center_ins` DISABLE KEYS */;
/*!40000 ALTER TABLE `center_ins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `center_msg`
--

DROP TABLE IF EXISTS `center_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `center_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center` int(11) NOT NULL,
  `patient` int(11) NOT NULL,
  `dateAsked` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cpt` int(11) DEFAULT NULL,
  `oper` varchar(256) DEFAULT NULL,
  `question` varchar(500) NOT NULL,
  `replyTo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_idx` (`patient`),
  KEY `cpt_idx` (`cpt`),
  KEY `CENTMSG_center` (`center`),
  KEY `CENTMSG_reply_idx` (`replyTo`),
  CONSTRAINT `CENTMSG_center` FOREIGN KEY (`center`) REFERENCES `center` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CENTMSG_patient` FOREIGN KEY (`patient`) REFERENCES `patient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CENTMSG_cpt` FOREIGN KEY (`cpt`) REFERENCES `cpt` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CENTMSG_reply` FOREIGN KEY (`replyTo`) REFERENCES `center_msg` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `center_msg`
--

LOCK TABLES `center_msg` WRITE;
/*!40000 ALTER TABLE `center_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `center_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `center_phys`
--

DROP TABLE IF EXISTS `center_phys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `center_phys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `physician` int(11) NOT NULL,
  `center` int(11) NOT NULL,
  `rateEst` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `centphys_uniq` (`center`,`physician`),
  KEY `center_idx` (`center`),
  KEY `CENTPHYS_physician` (`physician`),
  CONSTRAINT `CENTPHYS_physician` FOREIGN KEY (`physician`) REFERENCES `physician` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CENTPHYS_center` FOREIGN KEY (`center`) REFERENCES `center` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `center_phys`
--

LOCK TABLES `center_phys` WRITE;
/*!40000 ALTER TABLE `center_phys` DISABLE KEYS */;
/*!40000 ALTER TABLE `center_phys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `center_pricing`
--

DROP TABLE IF EXISTS `center_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `center_pricing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center` int(11) NOT NULL,
  `insurance` int(11) NOT NULL,
  `cpt` int(11) NOT NULL,
  `year` year(4) NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `dateEntered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateUpdated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `centerinscptyear_uniq` (`center`,`insurance`,`cpt`,`year`),
  KEY `insurance_idx` (`insurance`),
  KEY `cpt_idx` (`cpt`),
  KEY `CENTPRIC_center` (`center`),
  CONSTRAINT `CENTPRIC_center` FOREIGN KEY (`center`) REFERENCES `center` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CENTPRIC_insurance` FOREIGN KEY (`insurance`) REFERENCES `ins_provider` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CENTPRIC_cpt` FOREIGN KEY (`cpt`) REFERENCES `cpt` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `center_pricing`
--

LOCK TABLES `center_pricing` WRITE;
/*!40000 ALTER TABLE `center_pricing` DISABLE KEYS */;
/*!40000 ALTER TABLE `center_pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `center_review`
--

DROP TABLE IF EXISTS `center_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `center_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateMod` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `centeruser_uniq` (`center`,`user`),
  KEY `user_idx` (`user`),
  KEY `CENTREV_center` (`center`),
  CONSTRAINT `CENTREV_center` FOREIGN KEY (`center`) REFERENCES `center` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CENTREV_user` FOREIGN KEY (`user`) REFERENCES `patient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `center_review`
--

LOCK TABLES `center_review` WRITE;
/*!40000 ALTER TABLE `center_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `center_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `center_services`
--

DROP TABLE IF EXISTS `center_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `center_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center` int(11) NOT NULL,
  `cpt` int(11) DEFAULT NULL,
  `highLevelDesc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cpt_idx` (`cpt`),
  KEY `CENTSRV_center` (`center`),
  CONSTRAINT `CENTSRV_center` FOREIGN KEY (`center`) REFERENCES `center` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CENTSRV_cpt` FOREIGN KEY (`cpt`) REFERENCES `cpt` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `center_services`
--

LOCK TABLES `center_services` WRITE;
/*!40000 ALTER TABLE `center_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `center_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cpt`
--

DROP TABLE IF EXISTS `cpt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cpt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cptCode` char(6) NOT NULL,
  `cptLongDesc` varchar(100) NOT NULL,
  `cptShortDesc` varchar(45) NOT NULL,
  `cptAddNotes` varchar(200) DEFAULT NULL,
  `cptBodyPart` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cptCode_UNIQUE` (`cptCode`),
  UNIQUE KEY `cptID_UNIQUE` (`id`),
  KEY `cpt_bodypart_fk_idx` (`cptBodyPart`),
  CONSTRAINT `cpt_bodypart_fk` FOREIGN KEY (`cptBodyPart`) REFERENCES `body_part` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpt`
--

LOCK TABLES `cpt` WRITE;
/*!40000 ALTER TABLE `cpt` DISABLE KEYS */;
/*!40000 ALTER TABLE `cpt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ins_plan`
--

DROP TABLE IF EXISTS `ins_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ins_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `insurance` int(11) NOT NULL,
  `planName` varchar(45) DEFAULT NULL,
  `planDesc` varchar(200) DEFAULT NULL,
  `planLogo` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `insurance_idx` (`insurance`),
  CONSTRAINT `INSPLAN_insurance` FOREIGN KEY (`insurance`) REFERENCES `ins_provider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ins_plan`
--

LOCK TABLES `ins_plan` WRITE;
/*!40000 ALTER TABLE `ins_plan` DISABLE KEYS */;
INSERT INTO `ins_plan` VALUES (1,1,'Choice POS II','medical','aetna-choiceposii'),(2,1,'Choice PPO','medical','aetna-choiceppo'),(3,1,'Dental PPO','dental','aetna-dentalppo'),(4,1,'HMO','medical','aetna-hmo'),(5,2,'51-99 Employee Elect','medical','anthem-5199employeeelect'),(6,2,'Advantage HMO','medical','anthem-advantagehmo'),(7,2,'Blue Access PPO','medical','anthem-blueaccessppo'),(8,2,'Blue Card PPO','medical','anthem-bluecardppo'),(9,2,'Blue Cross HMO (CaliforniaCare)','medical','anthem-bluecrosshmocaliforniacare'),(10,2,'Blue Cross POS - HMO Network','medical','anthem-bluecrossposhmonetwork'),(11,2,'Blue Cross PPO (Prudent Buyer)','medical','anthem-bluecrossppoprudentbuyer'),(12,2,'Blue Preferred HMO','medical','anthem-bluepreferredhmo'),(13,2,'Blue Preferred Plus POS','medical','anthem-bluepreferredpluspos'),(14,2,'Blue View Vision','vision','anthem-blueviewvision'),(15,2,'Dental PPO','dental','anthem-dentalppo'),(16,2,'Freedom Blue PPO','medical','anthem-freedomblueppo'),(17,2,'Lumenos Plans','medical','anthem-lumenosplans'),(18,2,'Select Plus HMO','medical','anthem-selectplushmo'),(19,3,'Blue Card PPO','medical','bcbs-bluecardppo'),(20,3,'Blue Cross California PPO','medical','bcbs-bluecrosscaliforniappo'),(21,3,'Blue Shield Access+ HMO','medical','bcbs-blueshieldaccesshmo'),(22,3,'Blue Shield Active Choice','medical','bcbs-blueshieldactivechoice'),(23,3,'Blue Shield Active Start','medical','bcbs-blueshieldactivestart'),(24,3,'Blue Shield Balance','medical','bcbs-blueshieldbalance'),(25,3,'Blue Shield Base PPO','medical','bcbs-blueshieldbaseppo'),(26,3,'Blue Shield California Choice PPO','medical','bcbs-blueshieldcaliforniachoiceppo'),(27,3,'Blue Shield California PPO','medical','bcbs-blueshieldcaliforniappo'),(28,3,'Blue Shield Core Flex','medical','bcbs-blueshieldcoreflex'),(29,3,'Blue Shield Savings','medical','bcbs-blueshieldsavings'),(30,3,'Blue Shield Spectrum PPO','medical','bcbs-blueshieldspectrumppo'),(31,3,'Florida Blue Preferred Patient Care PPO','medical','bcbs-floridabluepreferredpatientcareppo'),(32,3,'Illinois PPO','medical','bcbs-illinoisppo'),(33,3,'Texas Blue Choice','medical','bcbs-texasbluechoice'),(34,4,'Dental EPO','dental','cigna-dentalepo'),(35,4,'Dental HMO','dental','cigna-dentalhmo'),(36,4,'Dental PPO','dental','cigna-dentalppo'),(37,4,'HMO','medical','cigna-hmo'),(38,4,'Open Access','medical','cigna-openaccess'),(39,4,'PPO','medical','cigna-ppo'),(40,4,'Vision','vision','cigna-vision'),(41,5,'Carelink Health Plans PPO','medical','coventry-carelinkhealthplansppo'),(42,5,'Coventry of Delaware - HMO','medical','coventry-coventryofdelawarehmo'),(43,5,'Coventry of Florida - HMO','medical','coventry-coventryoffloridahmo'),(44,5,'Coventry of Florida - PPO','medical','coventry-coventryoffloridappo'),(45,5,'Coventry of Georgia - HMO','medical','coventry-coventryofgeorgiahmo'),(46,5,'Coventry of Missouri - HMO/POS','medical','coventry-coventryofmissourihmopos'),(47,5,'Coventry of Virginia - HMO','medical','coventry-coventryofvirginiahmo'),(48,5,'First Health Network PPO','medical','coventry-firsthealthnetworkppo'),(49,5,'HealthAmerica HealthAssurance PPO','medical','coventry-healthamericahealthassuranceppo'),(50,5,'Health America PPO','medical','coventry-healthamericappo'),(51,5,'PPO Platinum','medical','coventry-ppoplatinum'),(52,6,'PPO','dental','delta-ppo'),(53,6,'Premier','dental','delta-premier'),(54,7,'Delta Network of America','dental','dentalnetwork-deltanetworkofamerica'),(55,8,'DenteMax Dental','dental','dentemax-dentemaxdental'),(56,9,'Guardian DentalGuard Preferred','dental','guardiandental-guardiandentalguardpreferred'),(57,10,'Arizona HMO','medical','healthnet-arizonahmo'),(58,10,'Arizona HMO ExcelCare Network','medical','healthnet-arizonahmoexcelcarenetwork'),(59,10,'Arizona PPO/POS','medical','healthnet-arizonappopos'),(60,10,'California Large Group PPO','medical','healthnet-californialargegroupppo'),(61,10,'HMO Employer Group','medical','healthnet-hmoemployergroup'),(62,10,'National PPO (First Health)','medical','healthnet-nationalppofirsthealth'),(63,10,'Oregon CommunityCare','medical','healthnet-oregoncommunitycare'),(64,10,'Oregon PPO','medical','healthnet-oregonppo'),(65,11,'ChoiceCare Network PPO','medical','humana-choicecarenetworkppo'),(66,11,'Dental PPO','dental','humana-dentalppo'),(67,12,'Kaiser','medical,dental','kaiser-kaiser'),(68,13,'Multiplan PPO','medical','multiplan-multiplanppo'),(69,13,'PHCS PPO','medical','multiplan-phcsppo'),(70,13,'PHCS PPO - Kaiser','medical','multiplan-phcsppokaiser'),(71,14,'Choice Plus POS','medical','uhc-choicepluspos'),(72,14,'Dental PPO','dental','uhc-dentalppo'),(73,14,'Options PPO','medical','uhc-optionsppo'),(74,15,'VSP','vision','vsp-vsp');
/*!40000 ALTER TABLE `ins_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ins_provider`
--

DROP TABLE IF EXISTS `ins_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ins_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `insName` varchar(45) NOT NULL,
  `insNote` varchar(45) DEFAULT NULL,
  `insLogo` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ins_provider`
--

LOCK TABLES `ins_provider` WRITE;
/*!40000 ALTER TABLE `ins_provider` DISABLE KEYS */;
INSERT INTO `ins_provider` VALUES (1,'Aetna',NULL,'aetna'),(2,'Anthem (Blue Cross)',NULL,'anthem'),(3,'Blue Cross Blue Shield',NULL,'bcbs'),(4,'Cigna',NULL,'cigna'),(5,'Coventry Health Care',NULL,'coventry'),(6,'Delta Dental',NULL,'delta'),(7,'Dental Network of America',NULL,'dentalnetwork'),(8,'DenteMax',NULL,'dentemax'),(9,'Guardian Dental',NULL,'guardiandental'),(10,'Health Net',NULL,'healthnet'),(11,'Humana',NULL,'humana'),(12,'Kaiser Permanente',NULL,'kaiser'),(13,'Multiplan',NULL,'multiplan'),(14,'UnitedHealthcare',NULL,'uhc'),(15,'VSP',NULL,'vsp'),(16,'Blue Shield of California',NULL,'bsc'),(17,'Hill Physicians Group','IPA','hpg'),(18,'Beech Street Multiplan',NULL,'bsm'),(19,'Corvel Health Network',NULL,'corvel'),(20,'Affinity Health Plan','IPA','affinity'),(21,'Sutter Health Plan','IPA with a new PPO/HMO product','sutter'),(22,'Muir IPA','IPA','muir');
/*!40000 ALTER TABLE `ins_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patLogin` varchar(45) DEFAULT NULL,
  `patPwd` varchar(40) DEFAULT NULL,
  `patName` varchar(45) DEFAULT NULL,
  `patFamName` varchar(45) DEFAULT NULL,
  `patMidName` varchar(15) DEFAULT NULL,
  `patEmail` varchar(128) DEFAULT NULL,
  `patInsurance` int(11) DEFAULT NULL,
  `patInsPlan` int(11) DEFAULT NULL,
  `patZip` int(11) DEFAULT NULL,
  `patPolicyNum` varchar(15) DEFAULT NULL,
  `patGender` int(2) DEFAULT '3',
  `patDOB` timestamp NULL DEFAULT NULL,
  `patCreateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fcbHandle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `patientLogin_UNIQUE` (`patLogin`),
  UNIQUE KEY `patPolicyNum_UNIQUE` (`patPolicyNum`),
  KEY `patInsurance_idx` (`patInsurance`),
  KEY `patInsPlan_idx` (`patInsPlan`),
  CONSTRAINT `patInsurance` FOREIGN KEY (`patInsurance`) REFERENCES `ins_plan` (`insurance`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `patInsPlan` FOREIGN KEY (`patInsPlan`) REFERENCES `ins_plan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'ippo','dio','Ippokratis','Pandis','A','ippokratis@gmail.com',NULL,NULL,94301,'W21321',0,'0000-00-00 00:00:00','2014-03-30 07:00:01',''),(2,'kristina','123','Kristina','Serafim','','kristinaserafim@gmail.com',NULL,NULL,94301,'W21324',1,'0000-00-00 00:00:00','2014-03-30 07:00:02',''),(3,'nikos','123','Nikos','Zinas','','zinas.nikos@gmail.com',NULL,NULL,95123,'W21325',0,'0000-00-00 00:00:00','2014-03-30 07:00:03',''),(4,'greg','123','Greg','Horner','','greg@feecast.com',NULL,NULL,91234,'W21326',0,'0000-00-00 00:00:00','2014-03-30 07:00:05',''),(5,'john','123','John','Doe','','jd@feecast.com',NULL,NULL,15312,'W21320',3,'0000-00-00 00:00:00','2014-03-30 07:00:06','');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phys_pricing`
--

DROP TABLE IF EXISTS `phys_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phys_pricing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `physician` int(11) NOT NULL,
  `center` int(11) NOT NULL,
  `cpt` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `dateEntered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateUpdated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `physcentcptyear_uniq` (`physician`,`center`,`cpt`,`year`),
  KEY `center_idx` (`center`),
  KEY `cpt_idx` (`cpt`),
  KEY `PHYSPRIC_physician` (`physician`),
  CONSTRAINT `PHYSPRIC_physician` FOREIGN KEY (`physician`) REFERENCES `physician` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PHYSPRIC_center` FOREIGN KEY (`center`) REFERENCES `center` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PHYSPRIC_cpt` FOREIGN KEY (`cpt`) REFERENCES `cpt` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phys_pricing`
--

LOCK TABLES `phys_pricing` WRITE;
/*!40000 ALTER TABLE `phys_pricing` DISABLE KEYS */;
/*!40000 ALTER TABLE `phys_pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phys_review`
--

DROP TABLE IF EXISTS `phys_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phys_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `physician` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `rating` int(2) NOT NULL DEFAULT '0',
  `comment` varchar(500) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateMod` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `physuser_uniq` (`physician`,`user`),
  KEY `user_idx` (`user`),
  KEY `PHYSREV_physician` (`physician`),
  CONSTRAINT `PHYSREV_physician` FOREIGN KEY (`physician`) REFERENCES `physician` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PHYSREV_user` FOREIGN KEY (`user`) REFERENCES `patient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phys_review`
--

LOCK TABLES `phys_review` WRITE;
/*!40000 ALTER TABLE `phys_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `phys_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phys_spec`
--

DROP TABLE IF EXISTS `phys_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phys_spec` (
  `phyID` int(11) NOT NULL,
  `specID` int(11) NOT NULL,
  PRIMARY KEY (`phyID`,`specID`),
  KEY `phyID_idx` (`phyID`),
  KEY `specID_idx` (`specID`),
  CONSTRAINT `PHYS_SPEC_phyID` FOREIGN KEY (`phyID`) REFERENCES `physician` (`id`),
  CONSTRAINT `PHYS_SPEC_specID` FOREIGN KEY (`specID`) REFERENCES `specialty` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phys_spec`
--

LOCK TABLES `phys_spec` WRITE;
/*!40000 ALTER TABLE `phys_spec` DISABLE KEYS */;
/*!40000 ALTER TABLE `phys_spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physician`
--

DROP TABLE IF EXISTS `physician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `physician` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phyLic` char(7) NOT NULL,
  `phyLogin` varchar(45) NOT NULL,
  `phyPwd` varchar(40) NOT NULL,
  `phyName` varchar(45) DEFAULT NULL,
  `phyFamName` varchar(45) DEFAULT NULL,
  `phyMidName` varchar(15) DEFAULT NULL,
  `phyTitle` varchar(25) DEFAULT NULL,
  `phyEmail` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phyLic_UNIQUE` (`phyLic`),
  UNIQUE KEY `phyLogin_UNIQUE` (`phyLogin`),
  UNIQUE KEY `phyID_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physician`
--

LOCK TABLES `physician` WRITE;
/*!40000 ALTER TABLE `physician` DISABLE KEYS */;
/*!40000 ALTER TABLE `physician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sched_app`
--

DROP TABLE IF EXISTS `sched_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sched_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` int(11) NOT NULL,
  `dateSched` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateReq` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `SCHEDAPPT_app` (`app`),
  CONSTRAINT `SCHEDAPPT_app` FOREIGN KEY (`app`) REFERENCES `appointment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sched_app`
--

LOCK TABLES `sched_app` WRITE;
/*!40000 ALTER TABLE `sched_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `sched_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_history`
--

DROP TABLE IF EXISTS `search_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_history` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cpt` int(11) DEFAULT NULL,
  `text` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cpt_idx` (`cpt`),
  KEY `SEARCHH_user` (`user`),
  CONSTRAINT `SEARCHH_user` FOREIGN KEY (`user`) REFERENCES `patient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SEARCHH_cpt` FOREIGN KEY (`cpt`) REFERENCES `cpt` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_history`
--

LOCK TABLES `search_history` WRITE;
/*!40000 ALTER TABLE `search_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialty`
--

DROP TABLE IF EXISTS `specialty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(4) NOT NULL DEFAULT '0',
  `specName` varchar(45) NOT NULL,
  `specActor` varchar(45) NOT NULL,
  `specPlural` varchar(45) NOT NULL,
  `specNote` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `specName_UNIQUE` (`specName`),
  UNIQUE KEY `specID_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialty`
--

LOCK TABLES `specialty` WRITE;
/*!40000 ALTER TABLE `specialty` DISABLE KEYS */;
INSERT INTO `specialty` VALUES (1,0,'Acupuncture','Acupuncturist','Acupuncturists','Specializes in ancient alternative therapy via needles.'),(2,0,'Addiction Medicine','Addiction Specialist','Addiction Specialists','Specializes in the treatment of addiction disorders.'),(3,0,'Allergy & Immunology','Allergist','Allergists','Specializes in treatment of allergies and the immune system.'),(4,0,'Alternative Medicine & Other','Alternative Medicine Practitioner','Alternative Medicine Practitioners','Specializes in alternative treatments and therapies.'),(5,0,'Anesthesiology','Anesthesiologist','Anesthesiologists','Specializes in managing pain and anesthesia in surgeries.'),(6,0,'Behavioral and Mental Health','Mental Health Therapist','Mental Health Therapists','Specializes in behavioral health counseling services.'),(7,0,'Cardiothoracic Surgery','Cardiothoracic Surgeon','Cardiothoracic Surgeons','Specializes in chest and heart surgery.'),(8,0,'Cardiovascular Disease','Cardiologist','Cardiologists','Specializes in heart problems.'),(9,0,'Children\'s Doctor','Children\'s Doctor','Children\'s Doctors','Specializes in the health of children from birth to young adulthood.'),(10,0,'Chiropractics','Chiropractor','Chiropractors','Specializes in alternartive therapy of muscles, bones, and joints.'),(11,0,'Clinical Genetics','Geneticist','Geneticists','Specializes in the diagnoses of and counselling for genetic disorders.'),(12,0,'Colon & Rectal Surgery','Colorectal Surgeon','Colorectal Surgeons','Specializes in colon and rectal surgery.'),(13,0,'Counseling','Counselor','Counselors','Specializes in behavioral health service counseling.'),(14,0,'Critical Care Medicine','Critical Care Doctor','Critical Care Doctors','Specializes in the care of critically ill patients.'),(15,1,'Dentistry','Dentist','Dentists','Specializes in teeth and oral health.'),(16,0,'Dermatology','Dermatologist','Dermatologists','Specializes in skin disorders, including moles and melanoma.'),(17,0,'Dietitian, Registered','Dietitian','Dietitians','Specializes in alternative food and nutrition therapies.'),(18,0,'Emergency Medicine','Emergence Medicine Doctor','Emergence Medicine Doctors','Specializes in immediate emergency care.'),(19,0,'Endocrinology, Diabetes & Metabolism','Endocrinologist','Endocrinologists','Specializes in diabetes, thyroid and other disorders affected by hormones.'),(20,1,'Eye Doctor','Eye Doctor','Eye Doctors','Specializes in your vision and eyes.'),(21,0,'Gastroenterology','Gastroenterologist','Gastroenterologists','Specializes in the digestive system.'),(22,0,'Geriatric Medicine','Geriatric Medicine Doctor','Geriatric Medicine Doctors','Specializes in the aging process and elderly.'),(23,0,'Hematology & Oncology','Oncologist','Oncologists','Specializes in the diagnosis and treatment of cancer and tumors.'),(24,0,'Hepatology','Hepatologist','Hepatologists','Specializes in liver and spleen diseases.'),(25,0,'Hospice and Palliative Medicine','Hospice Care and Palliative Doctor','Hospice Care and Palliative Doctors','Specializes in preventing and relieving suffering of dying patients.'),(26,0,'Hospitalist','Hospitalist','Hospitalists','Specializes in general medical care of hospitalized patients.'),(27,0,'Infectious Disease','Infectious Disease Doctor','Infectious Disease Doctors','Specializes in infectious diseases of all types and in all organ systems.'),(28,0,'Massage Therapy','Massage Therapist','Massage Therapists','Specializes in alternative therapy of muscles and tissue.'),(29,0,'Naturopath','Naturopathic Doctor','Naturopathic Doctors','Specializes in alternative natural healing.'),(30,0,'Nephrology','Nephrologist','Nephrologists','Specializes in patients with kidney disorders.'),(31,0,'Neurological Surgery','Neurosurgeon','Neurosurgeons','Specializes in nervous system and brain surgery.'),(32,0,'Neurology','Neurologist','Neurologists','Specializes in the brain and nervous system.'),(33,0,'Neuromusculoskeletal Medicine','Neuromusculoskeletal Medicine Doctor','Neuromusculoskeletal Medicine Doctors','Specializes in holistic physical therapy to treat illnesses.'),(34,0,'Nuclear Medicine','Nuclear Medicine Doctor','Nuclear Medicine Doctors','Specializes in diagnosing and treating diseases with radioactive materials.'),(35,0,'Nurse Practitioner','Nurse Practitoner','Nurse Practitoners','Specializes in your and your family\'s health.'),(36,0,'Nutrition Medicine','Nutritionist','Nutritionists','Specializes in alternative food and nutrition therapies.'),(37,0,'OBGYN','OBGYN','OBGYNs','Specializes in the care of the female reproductive system.'),(38,1,'Ophthalmology','Ophthalmologist','Ophthalmologists','Specializes in vision, eye care, and eye surgery including Lasik.'),(39,1,'Optometry','Optometrist','Optometrists','Specializes in vision and prescribing glasses and contact lences.'),(40,0,'Oral & Maxillofacial Surgery','Oral Surgeon','Oral Surgeons','Specializes in surgical operations of the mouth, jaw and face.'),(41,0,'Orthopedic Surgery','Orthopedic Surgeon','Orthopedic Surgeons','Specializes in surgery and treatment of musculoskeletal problems, including knees and spine.'),(42,0,'Otolaryngology','Ear, Nose and Throat Doctor','Ear, Nose and Throat Doctors','Specializes in ear, nose and throat problems.'),(43,0,'Pain Medicine','Pain Management Doctor','Pain Management Doctors','Specializes in pain management and prevention.'),(44,0,'Pathology','Pathologist','Pathologists','Specializes in laboratory tests of tissue and bodily fluids.'),(45,0,'Pediatric Surgery','Pediatric Surgeon','Pediatric Surgeons','Specializes in complicated surgical conditions in children.'),(46,0,'Pediatrics','Pediatrician','Pediatricians','Specializes in the health of children from birth to young adulthood.'),(47,0,'Physical Medicine & Rehabilitation','Physiatrist','Physiatrists','Specializes in treating patients with physical disabilities.'),(48,0,'Physical Therapy','Physical Therapist','Physical Therapists','Specializes in physical therapy.'),(49,0,'Plastic and Reconstructive Surgery','Plastic Surgeon','Plastic Surgeons','Specializes in plastic and reconstructive surgery.'),(50,0,'Podiatry','Podiatrist','Podiatrists','Specializes in foot and ankle problems.'),(51,0,'Preventive Medicine','Preventive Medicine Doctor','Preventive Medicine Doctors','Specializes in preventive care.'),(52,0,'Primary Care Doctor','Primary Care Doctor','Primary Care Doctors','Specializes in the total health of you and your family.'),(53,0,'Psychiatry','Psychiatrist','Psychiatrists','Specializes in the diagnosis and treatment of mental disorders.'),(54,0,'Psychology','Psychologist','Psychologists','Specializes in psychological counceling and therapy.'),(55,0,'Pulmonary Disease','Pulmonologist','Pulmonologists','Specializes in lungs and airways.'),(56,0,'Radiology','Radiologist','Radiologists','Specializes in imaging via X-rays and ultrasound.'),(57,0,'Rheumatology','Rheumatologist','Rheumatologists','Specializes in joints, muscles, bones and tendons.'),(58,0,'Sleep Medicine','Sleep Medicine Doctor','Sleep Medicine Doctors','Specializes in  sleep disorders.'),(59,0,'Specialist Doctor','Specialist Doctor','Specialist Doctors','Specialize in specific medical areas.'),(60,0,'Speech Therapy','Speech Therapist','Speech Therapists','Specializes in speech therapy.'),(61,0,'Sports Medicine','Sports Medicine Doctor','Sports Medicine Doctors','Specializes in prevention and treatment of sports related injuries.'),(62,0,'Surgery','General Surgeon','General Surgeons','Specializes in complex surgical operations.'),(63,0,'Urology','Urologist','Urologists','Specializes in genital and urinary problems.'),(64,0,'Vascular Surgery','Vascular Surgeon','Vascular Surgeons','Specializes in blood vessel surgery excluding the heart.'),(65,0,'Hand Surgery','Hand Surgeon',' Hand Surgeons','Specializes in hand surgeries.'),(66,0,'Gynecology','Gynecologist','Gynecologists','Specializes is gynecological issues.'),(67,0,'Bariatric Surgery','Bariatric Surgeon','Bariatric Surgeons','Specialized in weight loss surgery.');
/*!40000 ALTER TABLE `specialty` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-05  3:12:34
