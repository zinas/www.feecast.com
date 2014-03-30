-- FeeCastDB .DDL file

-- 2014/03/29: Converting all table names to lowercase
--             Adding a "id" INT AUTO_INCREMENT primary key column to every table
--             Changing a bit the schema
-- 2014/03/13: Initial version

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `feecastdb` ;
CREATE SCHEMA IF NOT EXISTS `feecastdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `feecastdb` ;

-- -----------------------------------------------------
-- Table `feecastdb`.`cpt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`cpt` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`cpt` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cptCode` CHAR(6) NOT NULL,
  `cptLongDesc` VARCHAR(100) NOT NULL,
  `cptShortDesc` VARCHAR(45) NOT NULL,
  `cptAddNotes` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `cptCode_UNIQUE` ON `feecastdb`.`cpt` (`cptCode` ASC);

CREATE FULLTEXT INDEX `cptDesc` ON `feecastdb`.`cpt` (`cptLongDesc` ASC);

CREATE UNIQUE INDEX `cptID_UNIQUE` ON `feecastdb`.`cpt` (`id` ASC);


-- -----------------------------------------------------
-- Table `feecastdb`.`physician`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`physician` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`physician` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `phyLic` CHAR(7) NOT NULL,
  `phyLogin` VARCHAR(45) NOT NULL,
  `phyPwd` VARCHAR(40) NOT NULL,
  `phyName` VARCHAR(45) NULL,
  `phyFamName` VARCHAR(45) NULL,
  `phyMidName` VARCHAR(15) NULL,
  `phyTitle` VARCHAR(25) NULL,
  `phyEmail` VARCHAR(128) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `phyLic_UNIQUE` ON `feecastdb`.`physician` (`phyLic` ASC);

CREATE UNIQUE INDEX `phyLogin_UNIQUE` ON `feecastdb`.`physician` (`phyLogin` ASC);

CREATE UNIQUE INDEX `phyID_UNIQUE` ON `feecastdb`.`physician` (`id` ASC);


-- -----------------------------------------------------
-- Table `feecastdb`.`specialty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`specialty` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`specialty` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `specName` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `specName_UNIQUE` ON `feecastdb`.`specialty` (`specName` ASC);

CREATE UNIQUE INDEX `specID_UNIQUE` ON `feecastdb`.`specialty` (`id` ASC);


-- -----------------------------------------------------
-- Table `feecastdb`.`phys_spec`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`phys_spec` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`phys_spec` (
  `phyID` INT NOT NULL,
  `specID` INT NOT NULL,
  PRIMARY KEY (`phyID`, `specID`),
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

CREATE INDEX `phyID_idx` ON `feecastdb`.`phys_spec` (`phyID` ASC);

CREATE INDEX `specID_idx` ON `feecastdb`.`phys_spec` (`specID` ASC);


-- -----------------------------------------------------
-- Table `feecastdb`.`center`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`center` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`center` (
  `id` INT NOT NULL AUTO_INCREMENT,
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
  `dateUpdated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `phone` CHAR(10) NOT NULL,
  `url` VARCHAR(255) NULL,
  `desc` VARCHAR(500) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `TIN_UNIQUE` ON `feecastdb`.`center` (`TIN` ASC);

CREATE UNIQUE INDEX `Name_UNIQUE` ON `feecastdb`.`center` (`name` ASC);

CREATE UNIQUE INDEX `centLogin_UNIQUE` ON `feecastdb`.`center` (`centLogin` ASC);


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

--  PRIMARY KEY (`phyLic`, `center`),

CREATE INDEX `center_idx` ON `feecastdb`.`center_phys` (`center` ASC);


-- -----------------------------------------------------
-- Table `feecastdb`.`ins_provider`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`ins_provider` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`ins_provider` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `insName` VARCHAR(45) NULL,
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

CREATE INDEX `insurance_idx` ON `feecastdb`.`center_ins` (`insurance` ASC);


-- -----------------------------------------------------
-- Table `feecastdb`.`ins_plan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`ins_plan` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`ins_plan` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `insurance` INT NOT NULL,
  `planName` VARCHAR(45) NULL,
  `planDesc` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `INSPLAN_insurance`
    FOREIGN KEY (`insurance`)
    REFERENCES `feecastdb`.`ins_provider` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;

CREATE INDEX `insurance_idx` ON `feecastdb`.`ins_plan` (`insurance` ASC);


-- -----------------------------------------------------
-- Table `feecastdb`.`patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`patient` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`patient` (
  `id` INT NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`),
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

CREATE UNIQUE INDEX `patientLogin_UNIQUE` ON `feecastdb`.`patient` (`patLogin` ASC);

CREATE INDEX `patInsurance_idx` ON `feecastdb`.`patient` (`patInsurance` ASC);

CREATE INDEX `patInsPlan_idx` ON `feecastdb`.`patient` (`patInsPlan` ASC);

CREATE UNIQUE INDEX `patPolicyNum_UNIQUE` ON `feecastdb`.`patient` (`patPolicyNum` ASC);


-- -----------------------------------------------------
-- Table `feecastdb`.`search_history`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`search_history` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`search_history` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user` INT NOT NULL,
  `time` TIMESTAMP NOT NULL,
  `cpt` INT NULL,
  `text` VARCHAR(128) NULL,
  PRIMARY KEY (`id`),
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

CREATE INDEX `cpt_idx` ON `feecastdb`.`search_history` (`cpt` ASC);


-- -----------------------------------------------------
-- Table `feecastdb`.`phys_review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`phys_review` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`phys_review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `physician` INT NOT NULL,
  `user` INT NOT NULL,
  `rating` INT(2) NOT NULL DEFAULT 0,
  `comment` VARCHAR(500) NULL,
  `dateCreated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateMod` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
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

--  PRIMARY KEY (`physician`, `user`),

CREATE INDEX `user_idx` ON `feecastdb`.`phys_review` (`user` ASC);


-- -----------------------------------------------------
-- Table `feecastdb`.`center_review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`center_review` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`center_review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `center` INT NOT NULL,
  `user` INT NOT NULL,
  `rating` INT(11) NOT NULL,
  `comment` VARCHAR(500) NULL,
  `dateCreated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateMod` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
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

--   PRIMARY KEY (`center`, `user`),

CREATE INDEX `user_idx` ON `feecastdb`.`center_review` (`user` ASC);


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

--  PRIMARY KEY (`center`, `insurance`, `cpt`, `year`),

CREATE INDEX `insurance_idx` ON `feecastdb`.`center_pricing` (`insurance` ASC);

CREATE INDEX `cpt_idx` ON `feecastdb`.`center_pricing` (`cpt` ASC);


-- -----------------------------------------------------
-- Table `feecastdb`.`phys_pricing`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`phys_pricing` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`phys_pricing` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `physician` INT NOT NULL,
  `center` INT NOT NULL,
  `cpt` INT NOT NULL,
  `price` DOUBLE NOT NULL DEFAULT 0,
  `dateEntered` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateUpdated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
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

--  PRIMARY KEY (`physician`, `center`, `cpt`),

CREATE INDEX `center_idx` ON `feecastdb`.`phys_pricing` (`center` ASC);

CREATE INDEX `cpt_idx` ON `feecastdb`.`phys_pricing` (`cpt` ASC);


-- -----------------------------------------------------
-- Table `feecastdb`.`center_msg`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`center_msg` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`center_msg` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `center` INT NOT NULL,
  `patient` INT NOT NULL,
  `dateAsked` TIMESTAMP NOT NULL,
  `cpt` INT NULL,
  `oper` VARCHAR(256) NULL,
  `question` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`id`),
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
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

--  PRIMARY KEY (`center`, `patient`, `dateAsked`),

CREATE INDEX `patient_idx` ON `feecastdb`.`center_msg` (`patient` ASC);

CREATE INDEX `cpt_idx` ON `feecastdb`.`center_msg` (`cpt` ASC);


-- -----------------------------------------------------
-- Table `feecastdb`.`appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `feecastdb`.`appointment` ;

CREATE TABLE IF NOT EXISTS `feecastdb`.`appointment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `patient` INT NOT NULL,
  `center` INT NOT NULL,
  `physician` INT NULL,
  `cpt` INT NULL,
  `highLevelDesc` VARCHAR(256) NULL,
  `estFee` DOUBLE NOT NULL DEFAULT 0,
  `dateReq` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateClosed` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
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

CREATE INDEX `patient_idx` ON `feecastdb`.`appointment` (`patient` ASC);

CREATE INDEX `center_idx` ON `feecastdb`.`appointment` (`center` ASC);

CREATE INDEX `physician_idx` ON `feecastdb`.`appointment` (`physician` ASC);

CREATE INDEX `cpt_idx` ON `feecastdb`.`appointment` (`cpt` ASC);


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
  CONSTRAINT `CENTAMEN_center`
    FOREIGN KEY (`center`)
    REFERENCES `feecastdb`.`center` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- PRIMARY KEY (`center`, `amenity`),


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
  `notes` VARCHAR(128) NULL,
  PRIMARY KEY (`id`),
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
  `cpt` INT NULL,
  `highLevelDesc` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
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

CREATE INDEX `cpt_idx` ON `feecastdb`.`center_services` (`cpt` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
