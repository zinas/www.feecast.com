# Source on localhost: ... connected.
SET FOREIGN_KEY_CHECKS=0;
# Exporting metadata from feecastdb
DROP DATABASE IF EXISTS `feecastdb`;
CREATE DATABASE `feecastdb`;
USE `feecastdb`;
# TABLE: feecastdb.appointment
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
# TABLE: feecastdb.body_part
CREATE TABLE `body_part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bpName` varchar(45) NOT NULL,
  `bpNote` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
# TABLE: feecastdb.center
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
# TABLE: feecastdb.center_amenities
CREATE TABLE `center_amenities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center` int(11) NOT NULL,
  `amenity` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CENTAMEN_center` (`center`),
  CONSTRAINT `CENTAMEN_center` FOREIGN KEY (`center`) REFERENCES `center` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# TABLE: feecastdb.center_hours
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
# TABLE: feecastdb.center_ins
CREATE TABLE `center_ins` (
  `center` int(11) NOT NULL,
  `insurance` int(11) NOT NULL,
  PRIMARY KEY (`center`,`insurance`),
  KEY `insurance_idx` (`insurance`),
  CONSTRAINT `CENTINS_center` FOREIGN KEY (`center`) REFERENCES `center` (`id`),
  CONSTRAINT `CENTINS_insurance` FOREIGN KEY (`insurance`) REFERENCES `ins_provider` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# TABLE: feecastdb.center_msg
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
# TABLE: feecastdb.center_phys
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
# TABLE: feecastdb.center_pricing
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
# TABLE: feecastdb.center_review
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
# TABLE: feecastdb.center_services
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
# TABLE: feecastdb.cpt
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
# TABLE: feecastdb.ins_plan
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
# TABLE: feecastdb.ins_provider
CREATE TABLE `ins_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `insName` varchar(45) NOT NULL,
  `insNote` varchar(45) DEFAULT NULL,
  `insLogo` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
# TABLE: feecastdb.patient
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
# TABLE: feecastdb.physician
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
# TABLE: feecastdb.phys_pricing
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
# TABLE: feecastdb.phys_review
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
# TABLE: feecastdb.phys_spec
CREATE TABLE `phys_spec` (
  `phyID` int(11) NOT NULL,
  `specID` int(11) NOT NULL,
  PRIMARY KEY (`phyID`,`specID`),
  KEY `phyID_idx` (`phyID`),
  KEY `specID_idx` (`specID`),
  CONSTRAINT `PHYS_SPEC_phyID` FOREIGN KEY (`phyID`) REFERENCES `physician` (`id`),
  CONSTRAINT `PHYS_SPEC_specID` FOREIGN KEY (`specID`) REFERENCES `specialty` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# TABLE: feecastdb.sched_app
CREATE TABLE `sched_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` int(11) NOT NULL,
  `dateSched` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateReq` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `SCHEDAPPT_app` (`app`),
  CONSTRAINT `SCHEDAPPT_app` FOREIGN KEY (`app`) REFERENCES `appointment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
# TABLE: feecastdb.search_history
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
# TABLE: feecastdb.specialty
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
#...done.
SET FOREIGN_KEY_CHECKS=1;
