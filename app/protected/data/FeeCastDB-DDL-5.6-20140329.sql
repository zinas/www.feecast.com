SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `feecastdb` ;
CREATE SCHEMA IF NOT EXISTS `feecastdb` DEFAULT CHARACTER SET utf8 ;
USE `feecastdb` ;

-- -----------------------------------------------------
-- Table `feecastdb`.`body_part`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`body_part` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`body_part` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `bpName` VARCHAR(45) NOT NULL,
  `bpNote` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `feecastdb`.`cpt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`cpt` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`cpt` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cptCode` CHAR(6) NOT NULL,
  `cptLongDesc` VARCHAR(100) NOT NULL,
  `cptShortDesc` VARCHAR(45) NOT NULL,
  `cptAddNotes` VARCHAR(200) NULL DEFAULT NULL,
  `cptBodyPart` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `cptCode_UNIQUE` (`cptCode` ASC),
  FULLTEXT INDEX `cptDesc` (`cptLongDesc` ASC),
  UNIQUE INDEX `cptID_UNIQUE` (`id` ASC),
  INDEX `cpt_bodypart_fk_idx` (`cptBodyPart` ASC),
  CONSTRAINT `cpt_bodypart_fk`
    FOREIGN KEY (`cptBodyPart`)
    REFERENCES `feecastdb`.`body_part` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `feecastdb`.`physician`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`physician` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`physician` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `phyLic` CHAR(7) NOT NULL,
  `phyLogin` VARCHAR(45) NOT NULL,
  `phyPwd` VARCHAR(40) NOT NULL,
  `phyName` VARCHAR(45) NULL DEFAULT NULL,
  `phyFamName` VARCHAR(45) NULL DEFAULT NULL,
  `phyMidName` VARCHAR(15) NULL DEFAULT NULL,
  `phyTitle` VARCHAR(25) NULL DEFAULT NULL,
  `phyEmail` VARCHAR(128) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `phyLic_UNIQUE` (`phyLic` ASC),
  UNIQUE INDEX `phyLogin_UNIQUE` (`phyLogin` ASC),
  UNIQUE INDEX `phyID_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `feecastdb`.`specialty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`specialty` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`specialty` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `specName` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `specName_UNIQUE` (`specName` ASC),
  UNIQUE INDEX `specID_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `feecastdb`.`phys_spec`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`phys_spec` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`phys_spec` (
  `phyID` INT NOT NULL,
  `specID` INT NOT NULL,
  PRIMARY KEY (`phyID`, `specID`),
  INDEX `phyID_idx` (`phyID` ASC),
  INDEX `specID_idx` (`specID` ASC),
  CONSTRAINT `PHYS_SPEC_phyID`
    FOREIGN KEY (`phyID`)
    REFERENCES `feecastdb`.`physician` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `PHYS_SPEC_specID`
    FOREIGN KEY (`specID`)
    REFERENCES `feecastdb`.`specialty` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `feecastdb`.`center`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`center` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`center` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `TIN` INT NOT NULL,
  `centLogin` VARCHAR(45) NOT NULL,
  `centPwd` VARCHAR(40) NOT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `addrNum` INT NULL DEFAULT NULL,
  `addrRoad` VARCHAR(128) NULL DEFAULT NULL,
  `addrCity` VARCHAR(128) NULL DEFAULT NULL,
  `addrState` VARCHAR(2) NULL DEFAULT NULL,
  `addrZip` INT NULL DEFAULT NULL,
  `logoLoc` VARCHAR(200) NULL DEFAULT NULL,
  `dateCreated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateUpdated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `phone` CHAR(10) NOT NULL,
  `url` VARCHAR(255) NULL DEFAULT NULL,
  `desc` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `TIN_UNIQUE` (`TIN` ASC),
  UNIQUE INDEX `Name_UNIQUE` (`name` ASC),
  UNIQUE INDEX `centLogin_UNIQUE` (`centLogin` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `feecastdb`.`center_phys`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`center_phys` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`center_phys` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `physician` INT NOT NULL,
  `center` INT NOT NULL,
  `rateEst` DOUBLE NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `center_idx` (`center` ASC),
  INDEX `CENTPHYS_physician` (`physician` ASC),
  UNIQUE INDEX `centphys_uniq` (`center` ASC, `physician` ASC),
  CONSTRAINT `CENTPHYS_physician`
    FOREIGN KEY (`physician`)
    REFERENCES `feecastdb`.`physician` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CENTPHYS_center`
    FOREIGN KEY (`center`)
    REFERENCES `feecastdb`.`center` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `feecastdb`.`ins_provider`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`ins_provider` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`ins_provider` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `insName` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `feecastdb`.`center_ins`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`center_ins` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`center_ins` (
  `center` INT NOT NULL,
  `insurance` INT NOT NULL,
  PRIMARY KEY (`center`, `insurance`),
  INDEX `insurance_idx` (`insurance` ASC),
  CONSTRAINT `CENTINS_center`
    FOREIGN KEY (`center`)
    REFERENCES `feecastdb`.`center` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `CENTINS_insurance`
    FOREIGN KEY (`insurance`)
    REFERENCES `feecastdb`.`ins_provider` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `feecastdb`.`ins_plan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`ins_plan` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`ins_plan` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `insurance` INT NOT NULL,
  `planName` VARCHAR(45) NULL DEFAULT NULL,
  `planDesc` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `insurance_idx` (`insurance` ASC),
  CONSTRAINT `INSPLAN_insurance`
    FOREIGN KEY (`insurance`)
    REFERENCES `feecastdb`.`ins_provider` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `feecastdb`.`patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`patient` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`patient` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `patLogin` VARCHAR(45) NULL DEFAULT NULL,
  `patPwd` VARCHAR(40) NULL DEFAULT NULL,
  `patName` VARCHAR(45) NULL DEFAULT NULL,
  `patFamName` VARCHAR(45) NULL DEFAULT NULL,
  `patMidName` VARCHAR(15) NULL DEFAULT NULL,
  `patEmail` VARCHAR(128) NULL DEFAULT NULL,
  `patInsurance` INT NULL DEFAULT NULL,
  `patInsPlan` INT NULL DEFAULT NULL,
  `patZip` INT NULL DEFAULT NULL,
  `patPolicyNum` VARCHAR(15) NULL DEFAULT NULL,
  `patCreateTime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `fcbHandle` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `patientLogin_UNIQUE` (`patLogin` ASC),
  INDEX `patInsurance_idx` (`patInsurance` ASC),
  INDEX `patInsPlan_idx` (`patInsPlan` ASC),
  UNIQUE INDEX `patPolicyNum_UNIQUE` (`patPolicyNum` ASC),
  CONSTRAINT `patInsurance`
    FOREIGN KEY (`patInsurance`)
    REFERENCES `feecastdb`.`ins_plan` (`insurance`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `patInsPlan`
    FOREIGN KEY (`patInsPlan`)
    REFERENCES `feecastdb`.`ins_plan` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `feecastdb`.`search_history`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`search_history` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`search_history` (
  `id` INT NOT NULL,
  `user` INT NOT NULL,
  `time` TIMESTAMP NOT NULL,
  `cpt` INT NULL DEFAULT NULL,
  `text` VARCHAR(128) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `cpt_idx` (`cpt` ASC),
  INDEX `SEARCHH_user` (`user` ASC),
  CONSTRAINT `SEARCHH_user`
    FOREIGN KEY (`user`)
    REFERENCES `feecastdb`.`patient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `SEARCHH_cpt`
    FOREIGN KEY (`cpt`)
    REFERENCES `feecastdb`.`cpt` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `feecastdb`.`phys_review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`phys_review` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`phys_review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `physician` INT NOT NULL,
  `user` INT NOT NULL,
  `rating` INT(2) NOT NULL DEFAULT 0,
  `comment` VARCHAR(500) NULL DEFAULT NULL,
  `dateCreated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateMod` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `user_idx` (`user` ASC),
  INDEX `PHYSREV_physician` (`physician` ASC),
  UNIQUE INDEX `physuser_uniq` (`physician` ASC, `user` ASC),
  CONSTRAINT `PHYSREV_physician`
    FOREIGN KEY (`physician`)
    REFERENCES `feecastdb`.`physician` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PHYSREV_user`
    FOREIGN KEY (`user`)
    REFERENCES `feecastdb`.`patient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `feecastdb`.`center_review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`center_review` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`center_review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `center` INT NOT NULL,
  `user` INT NOT NULL,
  `rating` INT(11) NOT NULL,
  `comment` VARCHAR(500) NULL DEFAULT NULL,
  `dateCreated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateMod` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `user_idx` (`user` ASC),
  INDEX `CENTREV_center` (`center` ASC),
  UNIQUE INDEX `centeruser_uniq` (`center` ASC, `user` ASC),
  CONSTRAINT `CENTREV_center`
    FOREIGN KEY (`center`)
    REFERENCES `feecastdb`.`center` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CENTREV_user`
    FOREIGN KEY (`user`)
    REFERENCES `feecastdb`.`patient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `feecastdb`.`center_pricing`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`center_pricing` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`center_pricing` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `center` INT NOT NULL,
  `insurance` INT NOT NULL,
  `cpt` INT NOT NULL,
  `year` YEAR NOT NULL,
  `price` DOUBLE NOT NULL DEFAULT 0,
  `dateEntered` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateUpdated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `insurance_idx` (`insurance` ASC),
  INDEX `cpt_idx` (`cpt` ASC),
  INDEX `CENTPRIC_center` (`center` ASC),
  UNIQUE INDEX `centerinscptyear_uniq` (`center` ASC, `insurance` ASC, `cpt` ASC, `year` ASC),
  CONSTRAINT `CENTPRIC_center`
    FOREIGN KEY (`center`)
    REFERENCES `feecastdb`.`center` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CENTPRIC_insurance`
    FOREIGN KEY (`insurance`)
    REFERENCES `feecastdb`.`ins_provider` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CENTPRIC_cpt`
    FOREIGN KEY (`cpt`)
    REFERENCES `feecastdb`.`cpt` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `feecastdb`.`phys_pricing`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`phys_pricing` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`phys_pricing` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `physician` INT NOT NULL,
  `center` INT NOT NULL,
  `cpt` INT NOT NULL,
  `year` INT NOT NULL,
  `price` DOUBLE NOT NULL DEFAULT 0,
  `dateEntered` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateUpdated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `center_idx` (`center` ASC),
  INDEX `cpt_idx` (`cpt` ASC),
  INDEX `PHYSPRIC_physician` (`physician` ASC),
  UNIQUE INDEX `physcentcptyear_uniq` (`physician` ASC, `center` ASC, `cpt` ASC, `year` ASC),
  CONSTRAINT `PHYSPRIC_physician`
    FOREIGN KEY (`physician`)
    REFERENCES `feecastdb`.`physician` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PHYSPRIC_center`
    FOREIGN KEY (`center`)
    REFERENCES `feecastdb`.`center` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PHYSPRIC_cpt`
    FOREIGN KEY (`cpt`)
    REFERENCES `feecastdb`.`cpt` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `feecastdb`.`center_msg`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`center_msg` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`center_msg` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `center` INT NOT NULL,
  `patient` INT NOT NULL,
  `dateAsked` TIMESTAMP NOT NULL,
  `cpt` INT NULL DEFAULT NULL,
  `oper` VARCHAR(256) NULL,
  `question` VARCHAR(500) NOT NULL,
  `replyTo` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `patient_idx` (`patient` ASC),
  INDEX `cpt_idx` (`cpt` ASC),
  INDEX `CENTMSG_center` (`center` ASC),
  INDEX `CENTMSG_reply_idx` (`replyTo` ASC),
  CONSTRAINT `CENTMSG_center`
    FOREIGN KEY (`center`)
    REFERENCES `feecastdb`.`center` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CENTMSG_patient`
    FOREIGN KEY (`patient`)
    REFERENCES `feecastdb`.`patient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CENTMSG_cpt`
    FOREIGN KEY (`cpt`)
    REFERENCES `feecastdb`.`cpt` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CENTMSG_reply`
    FOREIGN KEY (`replyTo`)
    REFERENCES `feecastdb`.`center_msg` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `feecastdb`.`appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`appointment` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`appointment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `patient` INT NOT NULL,
  `center` INT NOT NULL,
  `physician` INT NULL DEFAULT NULL,
  `cpt` INT NULL DEFAULT NULL,
  `highLevelDesc` VARCHAR(256) NULL DEFAULT NULL,
  `estFee` DOUBLE NOT NULL DEFAULT 0,
  `dateReq` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateClosed` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `patient_idx` (`patient` ASC),
  INDEX `center_idx` (`center` ASC),
  INDEX `physician_idx` (`physician` ASC),
  INDEX `cpt_idx` (`cpt` ASC),
  CONSTRAINT `APPT_patient`
    FOREIGN KEY (`patient`)
    REFERENCES `feecastdb`.`patient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `APPT_center`
    FOREIGN KEY (`center`)
    REFERENCES `feecastdb`.`center` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `APPT_physician`
    FOREIGN KEY (`physician`)
    REFERENCES `feecastdb`.`physician` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `APPT_cpt`
    FOREIGN KEY (`cpt`)
    REFERENCES `feecastdb`.`cpt` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `feecastdb`.`sched_app`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`sched_app` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`sched_app` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `app` INT NOT NULL,
  `dateSched` TIMESTAMP NOT NULL,
  `dateReq` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `SCHEDAPPT_app` (`app` ASC),
  CONSTRAINT `SCHEDAPPT_app`
    FOREIGN KEY (`app`)
    REFERENCES `feecastdb`.`appointment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `feecastdb`.`center_amenities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`center_amenities` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`center_amenities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `center` INT NOT NULL,
  `amenity` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `CENTAMEN_center` (`center` ASC),
  CONSTRAINT `CENTAMEN_center`
    FOREIGN KEY (`center`)
    REFERENCES `feecastdb`.`center` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `feecastdb`.`center_hours`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`center_hours` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`center_hours` (
  `id` INT NOT NULL AUTO_INCREMENT,
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
  `notes` VARCHAR(128) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `CENTHOURS_center` (`center` ASC),
  CONSTRAINT `CENTHOURS_center`
    FOREIGN KEY (`center`)
    REFERENCES `feecastdb`.`center` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `feecastdb`.`center_services`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`center_services` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`center_services` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `center` INT NOT NULL,
  `cpt` INT NULL DEFAULT NULL,
  `highLevelDesc` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `cpt_idx` (`cpt` ASC),
  INDEX `CENTSRV_center` (`center` ASC),
  CONSTRAINT `CENTSRV_center`
    FOREIGN KEY (`center`)
    REFERENCES `feecastdb`.`center` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CENTSRV_cpt`
    FOREIGN KEY (`cpt`)
    REFERENCES `feecastdb`.`cpt` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
