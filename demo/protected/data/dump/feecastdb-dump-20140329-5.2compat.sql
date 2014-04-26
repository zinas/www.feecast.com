-- MySQL dump 10.13  Distrib 5.6.12, for osx10.7 (x86_64)
--
-- Host: localhost    Database: feecastdb
-- ------------------------------------------------------
-- Server version	5.6.12

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
  `dateReq` timestamp NOT NULL,
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
  `dateCreated` timestamp NOT NULL,
  `dateUpdated` timestamp NULL,
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
  `dateAsked` timestamp NOT NULL,
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
  `dateEntered` timestamp NOT NULL,
  `dateUpdated` timestamp NOT NULL,
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
  `dateCreated` timestamp NOT NULL,
  `dateMod` timestamp NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ins_plan`
--

LOCK TABLES `ins_plan` WRITE;
/*!40000 ALTER TABLE `ins_plan` DISABLE KEYS */;
INSERT INTO `ins_plan` VALUES (1,1,'Medicare','BC Medicare'),(2,1,'HMO','BC HMO'),(3,2,'Medicare','United Medicare'),(4,2,'HMO','United HMO');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ins_provider`
--

LOCK TABLES `ins_provider` WRITE;
/*!40000 ALTER TABLE `ins_provider` DISABLE KEYS */;
INSERT INTO `ins_provider` VALUES (1,'Blue Cross','',''),(2,'United Health Care ','UHC',''),(3,'Aetna','',''),(4,'Cigna','',''),(5,'Healthnet','',''),(6,'Blue Shield of California','',''),(7,'Hill Physicians Group ','this is an IPA',''),(8,'Beech Street Multiplan','',''),(9,'Coventry','',''),(10,'Corvel Health Network','',''),(11,'Affinity Health Plan ','this is an IPA',''),(12,'Humana','',''),(13,'Sutter Health Plan ','this is an IPA, with a new PPO/HMO product',''),(14,'Muir IPA ','this is an IPA','');
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
  `patGender` int(2) NULL DEFAULT 3,
  `patDOB` timestamp NULL,
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
INSERT INTO `patient` VALUES (1,'ippo','dio','Ippokratis','Pandis','A','ippokratis@gmail.com',1,1,94301,'W21321',0,'1979-31-10 00:00:00','2014-03-30 07:00:01',''),(2,'kristina','123','Kristina','Serafim','','kristinaserafim@gmail.com',1,2,94301,'W21324',1,'1975-31-03 00:00:00','2014-03-30 07:00:02',''),(3,'nikos','123','Nikos','Zinas','','zinas.nikos@gmail.com',1,1,95123,'W21325',0,'','2014-03-30 07:00:03',''),(4,'greg','123','Greg','Horner','','greg@feecast.com',1,1,91234,'W21326',0,'','2014-03-30 07:00:05',''),(5,'john','123','John','Doe','','jd@feecast.com',2,4,15312,'W21320',3,'','2014-03-30 07:00:06','');
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
  `dateEntered` timestamp NOT NULL,
  `dateUpdated` timestamp NOT NULL,
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
  `dateCreated` timestamp NOT NULL,
  `dateMod` timestamp NOT NULL,
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
  `dateSched` timestamp NOT NULL,
  `dateReq` timestamp NOT NULL,
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
  `time` timestamp NOT NULL,
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

-- Category: medical, dental, spirit, etc..

DROP TABLE IF EXISTS `specialty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(4) NOT NULL DEFAULT 0,
  `specName` varchar(45) NOT NULL,
  `specActor` varchar(45) NOT NULL,
  `specPlural` varchar(45) NOT NULL,
  `specNote` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `specName_UNIQUE` (`specName`),
  UNIQUE KEY `specID_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialty`
--

LOCK TABLES `specialty` WRITE;
/*!40000 ALTER TABLE `specialty` DISABLE KEYS */;
INSERT INTO `specialty` VALUES (1,'Orthopedic Surgery',''),(2,'Hand Surgery',''),(3,'Gastroenterology',''),(4,'Pain Management',''),(5,'Urology',''),(6,'Gynecology',''),(7,'Spine Surgery',''),(8,'Ophthalmology',''),(9,'General Surgery',''),(10,'Plastic Surgery',''),(11,'Otolaryngology','ENT'),(12,'Oral Surgery',''),(13,'Cardiology','Pacemakers only'),(14,'Bariatric Surgery','Weight loss surgery'),(15,'Podiatry',''),(16,'Vascular Surgery','');
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

-- Dump completed on 2014-03-30  0:31:15
