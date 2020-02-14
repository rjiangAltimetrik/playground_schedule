SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema playground
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `playground` ;

-- -----------------------------------------------------
-- Schema playground
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `playground` DEFAULT CHARSET utf8 COLLATE utf8_general_ci ;
SHOW WARNINGS;
USE `playground` ;

-- -----------------------------------------------------
-- Table `candidate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `candidate` ;


CREATE TABLE IF NOT EXISTS `candidate` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `linked_in_url` VARCHAR(255) NULL DEFAULT NULL,
  `date_of_birth` DATE NULL DEFAULT NULL,
  `education` ENUM('BACHELOR', 'MASTER', 'DOCTOR') NULL DEFAULT 'BACHELOR',
  `school` VARCHAR(255) NOT NULL,
  `date_of_graduation` DATE NULL DEFAULT NULL,
  `work_auth` VARCHAR(255) NOT NULL,
  `location` VARCHAR(255) NOT NULL,
  `ssn` VARCHAR(15) NULL DEFAULT NULL,
  `experience` VARCHAR(15) NOT NULL,
  `tech_stack` VARCHAR(255) NULL DEFAULT NULL,
  `created_by` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `modified_by` VARCHAR(255) NULL DEFAULT NULL,
  `modified_at` DATETIME NULL DEFAULT NULL,
  `description` VARCHAR(765) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT INDEX `search` (`name`, `location`, `tech_stack`, `school`, `experience`, `work_auth`, `description`) );

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `candidate_resume`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `candidate_resume` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `candidate_resume` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `doc_name` VARCHAR(255) NOT NULL,
  `cand_id` INT(10) NOT NULL,
  `cand_name` VARCHAR(255) NOT NULL,
  `created_by` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `modified_by` VARCHAR(255) NULL DEFAULT NULL,
  `modified_at` DATETIME NULL DEFAULT NULL,
  `description` VARCHAR(765) NULL DEFAULT NULL,
  `doc` BLOB NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT INDEX `search` (`doc_name`, `cand_name`, `description`),
  INDEX (`cand_id` ASC),
  CONSTRAINT `candidate_resume`
    FOREIGN KEY (`cand_id`)
    REFERENCES `candidate` (`id`));

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `client_company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `client_company` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `client_company` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `created_by` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `description` VARCHAR(765) NULL DEFAULT NULL,
  `web` VARCHAR(510) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_unique` (`name` ASC) ,
  FULLTEXT INDEX `search` (`name`, `description`));

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `client_employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `client_employee` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `client_employee` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `gender` ENUM('Male', 'Female') NULL DEFAULT NULL,
  `title` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `location` VARCHAR(255) NOT NULL,
  `linked_in` VARCHAR(100) NOT NULL,
  `company_id` INT(10) NOT NULL,
  `company_name` VARCHAR(255) NOT NULL,
  `created_by` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `modified_by` VARCHAR(255) NULL DEFAULT NULL,
  `modified_at` DATETIME NULL DEFAULT NULL,
  `description` VARCHAR(765) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT INDEX `search` (`name`, `title`, `company_name`, `description`) ,
  INDEX (`company_id` ASC) ,
  CONSTRAINT `client_employee`
    FOREIGN KEY (`company_id`)
    REFERENCES `client_company` (`id`));

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `client_requirement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `client_requirement` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `client_requirement` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `req_title` VARCHAR(255) NOT NULL,
  `req_tech` VARCHAR(255) NOT NULL,
  `description` VARCHAR(765) NULL DEFAULT NULL,
  `status` ENUM('OPEN', 'SCHEDULED', 'CLOSED') NULL DEFAULT 'OPEN',
  `company` INT(10) NOT NULL,
  `company_name` VARCHAR(255) NOT NULL,
  `created_by` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `modified_by` VARCHAR(255) NOT NULL,
  `modified_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT INDEX `search` (`req_title`, `req_tech`, `company_name`, `description`) ,
  INDEX (`company` ASC) ,
  CONSTRAINT `client_requirement`
    FOREIGN KEY (`company`)
    REFERENCES `client_company` (`id`));

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `playground_event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `playground_event` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `playground_event` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `event_type` ENUM('REMOTE', 'PLAYGROUND', 'ONSITE') NULL DEFAULT 'REMOTE',
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `event_description` VARCHAR(255) NULL DEFAULT NULL,
  `client_id` INT(10) NOT NULL,
  `client_name` VARCHAR(255) NULL DEFAULT NULL,
  `requirement_id` INT(10) NOT NULL,
  `status` ENUM('PENDING', 'SCHEDULING', 'SCHEDULED', 'CANClED', 'FINISHED') NULL DEFAULT 'PENDING',
  `event_start_time` DATETIME NULL DEFAULT NULL,
  `durition` TIME NULL DEFAULT NULL,
  `location` VARCHAR(100) NULL DEFAULT NULL,
  `meeting_url` VARCHAR(255) NULL DEFAULT NULL,
  `created_by` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `modified_by` VARCHAR(255) NULL DEFAULT NULL,
  `modified_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT INDEX `search` (`name`, `location`, `client_name`, `event_description`) ,
  INDEX (`client_id` ASC) ,
  INDEX (`requirement_id` ASC) ,
  CONSTRAINT `event_client`
    FOREIGN KEY (`client_id`)
    REFERENCES `client_company` (`id`),
  CONSTRAINT `event_requirement`
    FOREIGN KEY (`requirement_id`)
    REFERENCES `client_requirement` (`id`));

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `event_interviewer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_interviewer` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `event_interviewer` (
  `id` INT(10) NOT NULL,
  `event_id` INT(10) NOT NULL,
  `interviewer_id` INT(10) NOT NULL,
  `slot1` DATETIME NOT NULL,
  `durition1` TIME NOT NULL,
  `slot2` DATETIME NULL DEFAULT NULL,
  `durition2` TIME NULL DEFAULT NULL,
  `slot3` DATETIME NULL DEFAULT NULL,
  `durition3` TIME NULL DEFAULT NULL,
  `slot4` DATETIME NULL DEFAULT NULL,
  `durition4` TIME NULL DEFAULT NULL,
  `slot5` DATETIME NULL DEFAULT NULL,
  `durition5` TIME NULL DEFAULT NULL,
  `description` VARCHAR(510) NULL DEFAULT NULL,
  `created_by` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `modified_by` VARCHAR(255) NULL DEFAULT NULL,
  `modified_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX (`event_id` ASC) ,
  INDEX (`interviewer_id` ASC) ,
  CONSTRAINT `event_interviewer_event`
    FOREIGN KEY (`event_id`)
    REFERENCES `playground_event` (`id`),
  CONSTRAINT `event_interviewer_interviewer`
    FOREIGN KEY (`interviewer_id`)
    REFERENCES `client_employee` (`id`));

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `event_candidate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_candidate` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `event_candidate` (
  `id` INT(10) NOT NULL,
  `event_id` INT(10) NOT NULL,
  `candidate_id` INT(10) NOT NULL,
  `slot1` DATETIME NOT NULL,
  `durition1` TIME NOT NULL,
  `slot2` DATETIME NULL DEFAULT NULL,
  `durition2` TIME NULL DEFAULT NULL,
  `slot3` DATETIME NULL DEFAULT NULL,
  `durition3` TIME NULL DEFAULT NULL,
  `slot4` DATETIME NULL DEFAULT NULL,
  `durition4` TIME NULL DEFAULT NULL,
  `slot5` DATETIME NULL DEFAULT NULL,
  `durition5` TIME NULL DEFAULT NULL,
  `description` VARCHAR(510) NULL DEFAULT NULL,
  `created_by` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `modified_by` VARCHAR(255) NULL DEFAULT NULL,
  `modified_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX (`event_id` ASC) ,
  INDEX (`candidate_id` ASC) ,
  CONSTRAINT `event_candidate_event`
    FOREIGN KEY (`event_id`)
    REFERENCES `playground_event` (`id`),
  CONSTRAINT `event_candidate_cand`
    FOREIGN KEY (`candidate_id`)
    REFERENCES `candidate` (`id`));

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `event_evaluation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_evaluation` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `event_evaluation` (
  `id` INT(10) NOT NULL,
  `event_id` INT(10) NOT NULL,
  `candidate_id` INT(10) NOT NULL,
  `interviewer_id` INT(10) NOT NULL,
  `description` VARCHAR(510) NULL DEFAULT NULL,
  `interviewer_feedback` VARCHAR(510) NULL DEFAULT NULL,
  `tech_feedback` VARCHAR(510) NULL DEFAULT NULL,
  `eval` ENUM('PENDING', 'BAD', 'NORMAL', 'GOOD', 'EXCELENT') NULL DEFAULT 'PENDING',
  `score` INT NULL DEFAULT 0,
  `candidate_feedback` VARCHAR(510) NULL DEFAULT NULL,
  `created_by` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `modified_by` VARCHAR(255) NULL DEFAULT NULL,
  `modified_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX (`event_id` ASC) ,
  INDEX (`candidate_id` ASC) ,
  INDEX (`interviewer_id` ASC) ,
  CONSTRAINT `event_evaluation_event`
    FOREIGN KEY (`event_id`)
    REFERENCES `playground_event` (`id`),
  CONSTRAINT `event_evaluation_cand`
    FOREIGN KEY (`candidate_id`)
    REFERENCES `candidate` (`id`),
  CONSTRAINT `event_evaluation_interviewer`
    FOREIGN KEY (`interviewer_id`)
    REFERENCES `client_employee` (`id`));

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `partner_company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `partner_company` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `partner_company` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `created_by` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `description` VARCHAR(765) NULL DEFAULT NULL,
  `web` VARCHAR(510) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_unique` (`name` ASC) ,
  FULLTEXT INDEX `search` (`name`, `description`) );

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `partner_agent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `partner_agent` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `partner_agent` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `company_id` INT(10) NOT NULL,
  `company_name` VARCHAR(255) NOT NULL,
  `created_by` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `description` VARCHAR(765) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT INDEX `search` (`name`, `title`, `company_name`, `description`) ,
  INDEX (`company_id` ASC) ,
  CONSTRAINT `partner_agent`
    FOREIGN KEY (`company_id`)
    REFERENCES `partner_company` (`id`));

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `partner_candidate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `partner_candidate` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `partner_candidate` (
  `id` INT(10) NULL,
  `candidate_id` INT(10) NULL,
  `partner_id` INT(10) NULL,
  `agent_id` INT(10) NULL,
  INDEX `partner_id_idx` (`partner_id` ASC) ,
  INDEX `agent_id_idx` (`agent_id` ASC) ,
  INDEX `candidate_id_idx` (`candidate_id` ASC) ,
  CONSTRAINT `partner_candidate_partner`
    FOREIGN KEY (`partner_id`)
    REFERENCES `partner_company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `partner_candidate_agent`
    FOREIGN KEY (`agent_id`)
    REFERENCES `partner_agent` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `partner_candidate_candidate`
    FOREIGN KEY (`candidate_id`)
    REFERENCES `candidate` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
DEFAULT CHARACTER SET = DEFAULT;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
