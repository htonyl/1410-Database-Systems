-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema hospital
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `hospital` ;

-- -----------------------------------------------------
-- Schema hospital
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hospital` DEFAULT CHARACTER SET utf8 ;
USE `hospital` ;

-- -----------------------------------------------------
-- Table `hospital`.`Department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`Department` ;

CREATE TABLE IF NOT EXISTS `hospital`.`Department` (
  `DeptID` VARCHAR(45) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DeptID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`Doctor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`Doctor` ;

CREATE TABLE IF NOT EXISTS `hospital`.`Doctor` (
  `DoctorID` VARCHAR(45) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Gender` VARCHAR(45) NOT NULL,
  `Specialization` VARCHAR(45) NOT NULL,
  `Salary` INT(11) NULL DEFAULT NULL,
  `Department_DeptID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DoctorID`, `Name`),
  INDEX `fk_Doctor_Department1_idx` (`Department_DeptID` ASC),
  CONSTRAINT `fk_Doctor_Department1`
    FOREIGN KEY (`Department_DeptID`)
    REFERENCES `hospital`.`Department` (`DeptID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`Patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`Patient` ;

CREATE TABLE IF NOT EXISTS `hospital`.`Patient` (
  `PatientID` VARCHAR(45) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Gender` VARCHAR(45) NOT NULL,
  `Birth` DATETIME NOT NULL,
  PRIMARY KEY (`PatientID`, `Name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`Appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`Appointment` ;

CREATE TABLE IF NOT EXISTS `hospital`.`Appointment` (
  `AppointmentID` VARCHAR(45) NOT NULL,
  `Date` DATETIME NOT NULL,
  `Doctor_DoctorID` VARCHAR(45) NOT NULL,
  `Doctor_Name` VARCHAR(45) NOT NULL,
  `Patient_PatientID` VARCHAR(45) NOT NULL,
  `Patient_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`AppointmentID`),
  INDEX `fk_Appointment_Doctor1_idx` (`Doctor_DoctorID` ASC, `Doctor_Name` ASC),
  INDEX `fk_Appointment_Patient1_idx` (`Patient_PatientID` ASC, `Patient_Name` ASC),
  CONSTRAINT `fk_Appointment_Doctor1`
    FOREIGN KEY (`Doctor_DoctorID` , `Doctor_Name`)
    REFERENCES `hospital`.`Doctor` (`DoctorID` , `Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Appointment_Patient1`
    FOREIGN KEY (`Patient_PatientID` , `Patient_Name`)
    REFERENCES `hospital`.`Patient` (`PatientID` , `Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`Room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`Room` ;

CREATE TABLE IF NOT EXISTS `hospital`.`Room` (
  `RoomID` VARCHAR(45) NOT NULL,
  `MaxCapacity` INT(11) NULL DEFAULT NULL,
  `Department_DeptID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`RoomID`),
  INDEX `fk_Room_Department1_idx` (`Department_DeptID` ASC),
  CONSTRAINT `fk_Room_Department1`
    FOREIGN KEY (`Department_DeptID`)
    REFERENCES `hospital`.`Department` (`DeptID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`Hospitalization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`Hospitalization` ;

CREATE TABLE IF NOT EXISTS `hospital`.`Hospitalization` (
  `HosptID` VARCHAR(45) NOT NULL,
  `AdmissionDate` DATETIME NULL DEFAULT NULL,
  `ReleaseDate` DATETIME NULL DEFAULT NULL,
  `Illness` VARCHAR(45) NOT NULL,
  `Doctor_DoctorID` VARCHAR(45) NOT NULL,
  `Doctor_Name` VARCHAR(45) NOT NULL,
  `Room_RoomID` VARCHAR(45) NOT NULL,
  `Patient_PatientID` VARCHAR(45) NOT NULL,
  `Patient_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`HosptID`),
  INDEX `fk_Hospitalization_Doctor1_idx` (`Doctor_DoctorID` ASC, `Doctor_Name` ASC),
  INDEX `fk_Hospitalization_Room1_idx` (`Room_RoomID` ASC),
  INDEX `fk_Hospitalization_Patient1_idx` (`Patient_PatientID` ASC, `Patient_Name` ASC),
  CONSTRAINT `fk_Hospitalization_Doctor1`
    FOREIGN KEY (`Doctor_DoctorID` , `Doctor_Name`)
    REFERENCES `hospital`.`Doctor` (`DoctorID` , `Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hospitalization_Room1`
    FOREIGN KEY (`Room_RoomID`)
    REFERENCES `hospital`.`Room` (`RoomID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hospitalization_Patient1`
    FOREIGN KEY (`Patient_PatientID` , `Patient_Name`)
    REFERENCES `hospital`.`Patient` (`PatientID` , `Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`Office`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`Office` ;

CREATE TABLE IF NOT EXISTS `hospital`.`Office` (
  `Building` VARCHAR(45) NOT NULL,
  `Room` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Room`, `Building`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospital`.`Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hospital`.`Staff` ;

CREATE TABLE IF NOT EXISTS `hospital`.`Staff` (
  `StaffID` VARCHAR(45) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `JobTitle` VARCHAR(45) NOT NULL,
  `Salary` INT(11) NULL DEFAULT NULL,
  `Office_Room` VARCHAR(45) NOT NULL,
  `Office_Building` VARCHAR(45) NOT NULL,
  `Department_DeptID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`StaffID`),
  INDEX `fk_Staff_Office1_idx` (`Office_Room` ASC, `Office_Building` ASC),
  INDEX `fk_Staff_Department1_idx` (`Department_DeptID` ASC),
  CONSTRAINT `fk_Staff_Office1`
    FOREIGN KEY (`Office_Room` , `Office_Building`)
    REFERENCES `hospital`.`Office` (`Room` , `Building`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Staff_Department1`
    FOREIGN KEY (`Department_DeptID`)
    REFERENCES `hospital`.`Department` (`DeptID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
