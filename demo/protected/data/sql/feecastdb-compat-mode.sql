SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `FeeCastDB` ;
CREATE SCHEMA IF NOT EXISTS `FeeCastDB` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `FeeCastDB` ;

-- -----------------------------------------------------
-- Table `FeeCastDB`.`CPT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FeeCastDB`.`CPT` ;

CREATE TABLE IF NOT EXISTS `FeeCastDB`.`CPT` (
  `cptID` INT NOT NULL AUTO_INCREMENT,
  `cptCode` CHAR(6) NOT NULL,
  `cptLongDesc` VARCHAR(100) NOT NULL,
  `cptShortDesc` VARCHAR(45) NOT NULL,
  `cptAddNotes` VARCHAR(200) NULL,
  PRIMARY KEY (`cptID`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `cptCode_UNIQUE` ON `FeeCastDB`.`CPT` (`cptCode` ASC);

-- CREATE FULLTEXT INDEX `cptDesc` ON `FeeCastDB`.`CPT` (`cptLongDesc` ASC);

CREATE UNIQUE INDEX `cptID_UNIQUE` ON `FeeCastDB`.`CPT` (`cptID` ASC);


-- -----------------------------------------------------
-- Table `FeeCastDB`.`Physician`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FeeCastDB`.`Physician` ;

CREATE TABLE IF NOT EXISTS `FeeCastDB`.`Physician` (
  `phyLic` CHAR(7) NOT NULL,
  `phyLogin` VARCHAR(45) NOT NULL,
  `phyPwd` VARCHAR(40) NOT NULL,
  `phyName` VARCHAR(45) NULL,
  `phyFamName` VARCHAR(45) NULL,
  `phyMidName` VARCHAR(15) NULL,
  `phyTitle` VARCHAR(25) NULL,
  `phyEmail` VARCHAR(128) NULL,
  PRIMARY KEY (`phyLic`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `phyLic_UNIQUE` ON `FeeCastDB`.`Physician` (`phyLic` ASC);

CREATE UNIQUE INDEX `phyLogin_UNIQUE` ON `FeeCastDB`.`Physician` (`phyLogin` ASC);


-- -----------------------------------------------------
-- Table `FeeCastDB`.`Specialty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FeeCastDB`.`Specialty` ;

CREATE TABLE IF NOT EXISTS `FeeCastDB`.`Specialty` (
  `specID` INT NOT NULL,
  `specName` VARCHAR(45) NULL,
  PRIMARY KEY (`specID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FeeCastDB`.`PhySpec`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FeeCastDB`.`PhySpec` ;

CREATE TABLE IF NOT EXISTS `FeeCastDB`.`PhySpec` (
  `phyLic` CHAR(7) NOT NULL,
  `specID` INT NOT NULL,
  PRIMARY KEY (`phyLic`, `specID`),
  CONSTRAINT `PHYSPEC_phyLic`
    FOREIGN KEY (`phyLic`)
    REFERENCES `FeeCastDB`.`Physician` (`phyLic`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `PHYSPEC_specID`
    FOREIGN KEY (`specID`)
    REFERENCES `FeeCastDB`.`Specialty` (`specID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;

CREATE INDEX `phyLic_idx` ON `FeeCastDB`.`PhySpec` (`phyLic` ASC);

CREATE INDEX `specID_idx` ON `FeeCastDB`.`PhySpec` (`specID` ASC);


-- -----------------------------------------------------
-- Table `FeeCastDB`.`Center`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FeeCastDB`.`Center` ;

CREATE TABLE IF NOT EXISTS `FeeCastDB`.`Center` (
  `TIN` INT NOT NULL,
  `centLogin` VARCHAR(45) NOT NULL,
  `centPwd` VARCHAR(40) NOT NULL,
  `name` VARCHAR(100) NULL,
  `addrNum` INT NULL,
  `addrRoad` VARCHAR(128) NULL,
  `addrCity` VARCHAR(128) NULL,
  `addrState` VARCHAR(2) NULL,
  `addrZip` INT NULL,
  `logoLoc` VARCHAR(200) NULL,
  `dateCreated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateUpdated` TIMESTAMP NULL DEFAULT NULL,
  `phone` CHAR(10) NOT NULL,
  `url` VARCHAR(255) NULL,
  `desc` VARCHAR(500) NULL,
  PRIMARY KEY (`TIN`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `TIN_UNIQUE` ON `FeeCastDB`.`Center` (`TIN` ASC);

CREATE UNIQUE INDEX `Name_UNIQUE` ON `FeeCastDB`.`Center` (`name` ASC);

CREATE UNIQUE INDEX `centLogin_UNIQUE` ON `FeeCastDB`.`Center` (`centLogin` ASC);


-- -----------------------------------------------------
-- Table `FeeCastDB`.`CenterPhys`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FeeCastDB`.`CenterPhys` ;

CREATE TABLE IF NOT EXISTS `FeeCastDB`.`CenterPhys` (
  `phyLic` CHAR(7) NOT NULL,
  `center` INT NOT NULL,
  `rateEst` DOUBLE NOT NULL DEFAULT 0,
  PRIMARY KEY (`phyLic`, `center`),
  CONSTRAINT `CENTPHYS_phyLic`
    FOREIGN KEY (`phyLic`)
    REFERENCES `FeeCastDB`.`Physician` (`phyLic`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CENTPHYS_center`
    FOREIGN KEY (`center`)
    REFERENCES `FeeCastDB`.`Center` (`TIN`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;

CREATE INDEX `center_idx` ON `FeeCastDB`.`CenterPhys` (`center` ASC);


-- -----------------------------------------------------
-- Table `FeeCastDB`.`InsuranceProvider`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FeeCastDB`.`InsuranceProvider` ;

CREATE TABLE IF NOT EXISTS `FeeCastDB`.`InsuranceProvider` (
  `insID` INT NOT NULL AUTO_INCREMENT,
  `insName` VARCHAR(45) NULL,
  PRIMARY KEY (`insID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FeeCastDB`.`CenterInsurance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FeeCastDB`.`CenterInsurance` ;

CREATE TABLE IF NOT EXISTS `FeeCastDB`.`CenterInsurance` (
  `center` INT NOT NULL,
  `insurance` INT NOT NULL,
  PRIMARY KEY (`center`, `insurance`),
  CONSTRAINT `CENTINS_center`
    FOREIGN KEY (`center`)
    REFERENCES `FeeCastDB`.`Center` (`TIN`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `CENTINS_insurance`
    FOREIGN KEY (`insurance`)
    REFERENCES `FeeCastDB`.`InsuranceProvider` (`insID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;

CREATE INDEX `insurance_idx` ON `FeeCastDB`.`CenterInsurance` (`insurance` ASC);


-- -----------------------------------------------------
-- Table `FeeCastDB`.`InsurancePlan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FeeCastDB`.`InsurancePlan` ;

CREATE TABLE IF NOT EXISTS `FeeCastDB`.`InsurancePlan` (
  `insurance` INT NOT NULL,
  `planID` INT NOT NULL AUTO_INCREMENT,
  `planName` VARCHAR(45) NULL,
  `planDesc` VARCHAR(200) NULL,
  PRIMARY KEY (`planID`, `insurance`),
  CONSTRAINT `INSPLAN_insurance`
    FOREIGN KEY (`insurance`)
    REFERENCES `FeeCastDB`.`InsuranceProvider` (`insID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;

CREATE INDEX `insurance_idx` ON `FeeCastDB`.`InsurancePlan` (`insurance` ASC);


-- -----------------------------------------------------
-- Table `FeeCastDB`.`Patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FeeCastDB`.`Patient` ;

CREATE TABLE IF NOT EXISTS `FeeCastDB`.`Patient` (
  `patID` INT NOT NULL AUTO_INCREMENT,
  `patLogin` VARCHAR(45) NULL,
  `patPwd` VARCHAR(40) NULL,
  `patName` VARCHAR(45) NULL,
  `patFamName` VARCHAR(45) NULL,
  `patMidName` VARCHAR(15) NULL,
  `patEmail` VARCHAR(128) NULL,
  `patInsurance` INT NULL DEFAULT NULL,
  `patInsPlan` INT NULL DEFAULT NULL,
  `patZip` INT NULL,
  `patPolicyNum` VARCHAR(15) NULL DEFAULT NULL,
  `patCreateTime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `fcbHandle` VARCHAR(45) NULL,
  PRIMARY KEY (`patID`),
  CONSTRAINT `patInsurance`
    FOREIGN KEY (`patInsurance`)
    REFERENCES `FeeCastDB`.`InsurancePlan` (`insurance`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `patInsPlan`
    FOREIGN KEY (`patInsPlan`)
    REFERENCES `FeeCastDB`.`InsurancePlan` (`planID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = ' ';

CREATE UNIQUE INDEX `patientLogin_UNIQUE` ON `FeeCastDB`.`Patient` (`patLogin` ASC);

CREATE INDEX `patInsurance_idx` ON `FeeCastDB`.`Patient` (`patInsurance` ASC);

CREATE INDEX `patInsPlan_idx` ON `FeeCastDB`.`Patient` (`patInsPlan` ASC);

CREATE UNIQUE INDEX `patPolicyNum_UNIQUE` ON `FeeCastDB`.`Patient` (`patPolicyNum` ASC);


-- -----------------------------------------------------
-- Table `FeeCastDB`.`SearchHistory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FeeCastDB`.`SearchHistory` ;

CREATE TABLE IF NOT EXISTS `FeeCastDB`.`SearchHistory` (
  `user` INT NOT NULL,
  `time` TIMESTAMP NOT NULL,
  `cpt` INT NULL,
  `text` VARCHAR(65) NULL,
  PRIMARY KEY (`user`, `time`),
  CONSTRAINT `SEARCHH_user`
    FOREIGN KEY (`user`)
    REFERENCES `FeeCastDB`.`Patient` (`patID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `SEARCHH_cpt`
    FOREIGN KEY (`cpt`)
    REFERENCES `FeeCastDB`.`CPT` (`cptID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `cpt_idx` ON `FeeCastDB`.`SearchHistory` (`cpt` ASC);


-- -----------------------------------------------------
-- Table `FeeCastDB`.`PhysReview`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FeeCastDB`.`PhysReview` ;

CREATE TABLE IF NOT EXISTS `FeeCastDB`.`PhysReview` (
  `physician` CHAR(7) NOT NULL,
  `user` INT NOT NULL,
  `rating` INT(11) NOT NULL DEFAULT 0,
  `comment` VARCHAR(500) NULL,
  `dateCreated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateMod` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`physician`, `user`),
  CONSTRAINT `PHYSREV_physician`
    FOREIGN KEY (`physician`)
    REFERENCES `FeeCastDB`.`Physician` (`phyLic`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PHYSREV_user`
    FOREIGN KEY (`user`)
    REFERENCES `FeeCastDB`.`Patient` (`patID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `user_idx` ON `FeeCastDB`.`PhysReview` (`user` ASC);


-- -----------------------------------------------------
-- Table `FeeCastDB`.`CenterReview`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FeeCastDB`.`CenterReview` ;

CREATE TABLE IF NOT EXISTS `FeeCastDB`.`CenterReview` (
  `center` INT NOT NULL,
  `user` INT NOT NULL,
  `rating` INT(11) NOT NULL,
  `comment` VARCHAR(500) NULL,
  `dateCreated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateMod` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`center`, `user`),
  CONSTRAINT `CENTREV_center`
    FOREIGN KEY (`center`)
    REFERENCES `FeeCastDB`.`Center` (`TIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CENTREV_user`
    FOREIGN KEY (`user`)
    REFERENCES `FeeCastDB`.`Patient` (`patID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `user_idx` ON `FeeCastDB`.`CenterReview` (`user` ASC);


-- -----------------------------------------------------
-- Table `FeeCastDB`.`CenterPricing`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FeeCastDB`.`CenterPricing` ;

CREATE TABLE IF NOT EXISTS `FeeCastDB`.`CenterPricing` (
  `center` INT NOT NULL,
  `insurance` INT NOT NULL,
  `cpt` CHAR(6) NOT NULL,
  `year` YEAR NOT NULL,
  `price` DOUBLE NOT NULL DEFAULT 0,
  `dateEntered` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateUpdated` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`center`, `insurance`, `cpt`, `year`),
  CONSTRAINT `CENTPRIC_center`
    FOREIGN KEY (`center`)
    REFERENCES `FeeCastDB`.`Center` (`TIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CENTPRIC_insurance`
    FOREIGN KEY (`insurance`)
    REFERENCES `FeeCastDB`.`InsuranceProvider` (`insID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CENTPRIC_cpt`
    FOREIGN KEY (`cpt`)
    REFERENCES `FeeCastDB`.`CPT` (`cptCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `insurance_idx` ON `FeeCastDB`.`CenterPricing` (`insurance` ASC);

CREATE INDEX `cpt_idx` ON `FeeCastDB`.`CenterPricing` (`cpt` ASC);


-- -----------------------------------------------------
-- Table `FeeCastDB`.`PhysPricing`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FeeCastDB`.`PhysPricing` ;

CREATE TABLE IF NOT EXISTS `FeeCastDB`.`PhysPricing` (
  `physician` CHAR(6) NOT NULL,
  `center` INT NOT NULL,
  `cpt` CHAR(6) NOT NULL,
  `price` DOUBLE NOT NULL DEFAULT 0,
  `dateEntered` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateUpdated` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`physician`, `center`, `cpt`),
  CONSTRAINT `PHYSPRIC_physician`
    FOREIGN KEY (`physician`)
    REFERENCES `FeeCastDB`.`Physician` (`phyLic`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PHYSPRIC_center`
    FOREIGN KEY (`center`)
    REFERENCES `FeeCastDB`.`Center` (`TIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PHYSPRIC_cpt`
    FOREIGN KEY (`cpt`)
    REFERENCES `FeeCastDB`.`CPT` (`cptCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `center_idx` ON `FeeCastDB`.`PhysPricing` (`center` ASC);

CREATE INDEX `cpt_idx` ON `FeeCastDB`.`PhysPricing` (`cpt` ASC);


-- -----------------------------------------------------
-- Table `FeeCastDB`.`CenterMsg`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FeeCastDB`.`CenterMsg` ;

CREATE TABLE IF NOT EXISTS `FeeCastDB`.`CenterMsg` (
  `center` INT NOT NULL,
  `patient` INT NOT NULL,
  `dateAsked` TIMESTAMP NOT NULL,
  `cpt` CHAR(6) NULL,
  `oper` VARCHAR(256) NULL,
  `question` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`center`, `patient`, `dateAsked`),
  CONSTRAINT `CENTMSG_center`
    FOREIGN KEY (`center`)
    REFERENCES `FeeCastDB`.`Center` (`TIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CENTMSG_patient`
    FOREIGN KEY (`patient`)
    REFERENCES `FeeCastDB`.`Patient` (`patID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CENTMSG_cpt`
    FOREIGN KEY (`cpt`)
    REFERENCES `FeeCastDB`.`CPT` (`cptCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `patient_idx` ON `FeeCastDB`.`CenterMsg` (`patient` ASC);

CREATE INDEX `cpt_idx` ON `FeeCastDB`.`CenterMsg` (`cpt` ASC);


-- -----------------------------------------------------
-- Table `FeeCastDB`.`Appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FeeCastDB`.`Appointment` ;

CREATE TABLE IF NOT EXISTS `FeeCastDB`.`Appointment` (
  `appID` INT NOT NULL AUTO_INCREMENT,
  `patient` INT NOT NULL,
  `center` INT NOT NULL,
  `physician` CHAR(7) NULL,
  `cpt` CHAR(6) NULL,
  `highLevelDesc` VARCHAR(45) NULL,
  `estFee` DOUBLE NOT NULL DEFAULT 0,
  `dateReq` TIMESTAMP NOT NULL,
  `dateClosed` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`appID`),
  CONSTRAINT `APPT_patient`
    FOREIGN KEY (`patient`)
    REFERENCES `FeeCastDB`.`Patient` (`patID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `APPT_center`
    FOREIGN KEY (`center`)
    REFERENCES `FeeCastDB`.`Center` (`TIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `APPT_physician`
    FOREIGN KEY (`physician`)
    REFERENCES `FeeCastDB`.`Physician` (`phyLic`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `APPT_cpt`
    FOREIGN KEY (`cpt`)
    REFERENCES `FeeCastDB`.`CPT` (`cptCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `patient_idx` ON `FeeCastDB`.`Appointment` (`patient` ASC);

CREATE INDEX `center_idx` ON `FeeCastDB`.`Appointment` (`center` ASC);

CREATE INDEX `physician_idx` ON `FeeCastDB`.`Appointment` (`physician` ASC);

CREATE INDEX `cpt_idx` ON `FeeCastDB`.`Appointment` (`cpt` ASC);


-- -----------------------------------------------------
-- Table `FeeCastDB`.`ScheduledApp`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FeeCastDB`.`ScheduledApp` ;

CREATE TABLE IF NOT EXISTS `FeeCastDB`.`ScheduledApp` (
  `app` INT NOT NULL,
  `dateSched` TIMESTAMP NOT NULL,
  PRIMARY KEY (`app`),
  CONSTRAINT `SCHEDAPPT_app`
    FOREIGN KEY (`app`)
    REFERENCES `FeeCastDB`.`Appointment` (`appID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FeeCastDB`.`CenterAmenities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FeeCastDB`.`CenterAmenities` ;

CREATE TABLE IF NOT EXISTS `FeeCastDB`.`CenterAmenities` (
  `center` INT NOT NULL,
  `amenity` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`center`, `amenity`),
  CONSTRAINT `CENTAMEN_center`
    FOREIGN KEY (`center`)
    REFERENCES `FeeCastDB`.`Center` (`TIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FeeCastDB`.`CenterHours`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FeeCastDB`.`CenterHours` ;

CREATE TABLE IF NOT EXISTS `FeeCastDB`.`CenterHours` (
  `center` INT NOT NULL,
  `workdaysSame` BIT NOT NULL DEFAULT 0,
  `monSt` INT(11) NOT NULL,
  `monFin` INT(11) NOT NULL,
  `satSt` INT(11) NOT NULL,
  `satFin` INT(11) NOT NULL,
  `satOpen` BIT NOT NULL DEFAULT 1,
  `sunSt` INT(11) NOT NULL,
  `sunFin` INT(11) NOT NULL,
  `sunOpen` BIT NOT NULL DEFAULT 0,
  `notes` VARCHAR(128) NULL,
  PRIMARY KEY (`center`),
  CONSTRAINT `CENTHOURS_center`
    FOREIGN KEY (`center`)
    REFERENCES `FeeCastDB`.`Center` (`TIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FeeCastDB`.`CenterServices`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FeeCastDB`.`CenterServices` ;

CREATE TABLE IF NOT EXISTS `FeeCastDB`.`CenterServices` (
  `center` INT NOT NULL,
  `cpt` CHAR(6) NULL,
  `highLevelDesc` VARCHAR(45) NULL,
  PRIMARY KEY (`center`),
  CONSTRAINT `CENTSRV_center`
    FOREIGN KEY (`center`)
    REFERENCES `FeeCastDB`.`Center` (`TIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CENTSRV_cpt`
    FOREIGN KEY (`cpt`)
    REFERENCES `FeeCastDB`.`CPT` (`cptCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `cpt_idx` ON `FeeCastDB`.`CenterServices` (`cpt` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
