-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `idPatient` VARCHAR(20) NOT NULL,
  `Name` VARCHAR(50) NULL,
  `File_No` INT NULL,
  `Phone_No` VARCHAR(13) NULL,
  `Address` VARCHAR(45) NULL,
  `Sex` ENUM('Male', 'Female') NULL,
  `DOB` DATE NULL,
  `Name_NOK` VARCHAR(50) NULL,
  `Contact_NOK` VARCHAR(13) NULL,
  `NOK_Relationship` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`idPatient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Department` (
  `idDepartment` INT NOT NULL,
  `department_description` VARCHAR(45) NULL,
  PRIMARY KEY (`idDepartment`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ward`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ward` (
  `idWard` INT NOT NULL,
  `ward_description` VARCHAR(45) NULL,
  `id_department` INT NULL,
  PRIMARY KEY (`idWard`),
  INDEX `id_department_idx` (`id_department` ASC),
  CONSTRAINT `id_department`
    FOREIGN KEY (`id_department`)
    REFERENCES `mydb`.`Department` (`idDepartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bed`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bed` (
  `idBed` INT NOT NULL,
  `id_department` INT NULL,
  `id_ward` INT NULL,
  `bed_status` ENUM('Occupied', 'Available', 'Maintanace') NULL,
  PRIMARY KEY (`idBed`),
  INDEX `id_department_idx` (`id_department` ASC),
  INDEX `id_ward_idx` (`id_ward` ASC),
  CONSTRAINT `id_department`
    FOREIGN KEY (`id_department`)
    REFERENCES `mydb`.`Department` (`idDepartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_ward`
    FOREIGN KEY (`id_ward`)
    REFERENCES `mydb`.`Ward` (`idWard`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Visit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Visit` (
  `idVisit` INT NOT NULL,
  `patientID` VARCHAR(20) NULL,
  `visit_date` DATE NULL,
  `doctorID` VARCHAR(20) NULL,
  `procedureID` INT NULL,
  `visit_type` ENUM('Inpatient', 'Outpatient') NULL,
  `time` TIME NULL,
  `Bed_idBed` INT NOT NULL,
  PRIMARY KEY (`idVisit`),
  INDEX `patientID_idx` (`patientID` ASC),
  INDEX `fk_Visit_Bed1_idx` (`Bed_idBed` ASC),
  CONSTRAINT `patientID`
    FOREIGN KEY (`patientID`)
    REFERENCES `mydb`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Visit_Bed1`
    FOREIGN KEY (`Bed_idBed`)
    REFERENCES `mydb`.`Bed` (`idBed`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Appointment` (
  `idAppointment` INT NOT NULL,
  `patientID` VARCHAR(20) NULL,
  `status` ENUM('Pending', 'Confirmed', 'Cancelled', 'Missed by Doctor', 'Missed by Patient', 'Attended') NULL,
  `date` DATE NULL,
  `time` TIME NULL,
  `reason for missing appointment` VARCHAR(45) NULL,
  `Visit_idVisit` INT NOT NULL,
  PRIMARY KEY (`idAppointment`, `Visit_idVisit`),
  INDEX `fk_Appointment_Visit1_idx` (`Visit_idVisit` ASC),
  INDEX `PatientID_idx` (`patientID` ASC),
  CONSTRAINT `PatientID`
    FOREIGN KEY (`patientID`)
    REFERENCES `mydb`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Appointment_Visit1`
    FOREIGN KEY (`Visit_idVisit`)
    REFERENCES `mydb`.`Visit` (`idVisit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Doctor` (
  `idDoctor` VARCHAR(20) NOT NULL,
  `doctor_name` VARCHAR(50) NULL,
  `specialisation` VARCHAR(45) NULL,
  `doctor_contact` VARCHAR(13) NULL,
  `doctor_email` VARCHAR(45) NULL,
  `departmentID` INT NULL,
  PRIMARY KEY (`idDoctor`),
  INDEX `departmentID_idx` (`departmentID` ASC),
  CONSTRAINT `departmentID`
    FOREIGN KEY (`departmentID`)
    REFERENCES `mydb`.`Department` (`idDepartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Visit_has_Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Visit_has_Doctor` (
  `Visit_idVisit` INT NOT NULL,
  `Doctor_idDoctor` TINYTEXT NOT NULL,
  PRIMARY KEY (`Visit_idVisit`, `Doctor_idDoctor`),
  INDEX `fk_Visit_has_Doctor_Doctor1_idx` (`Doctor_idDoctor` ASC),
  INDEX `fk_Visit_has_Doctor_Visit1_idx` (`Visit_idVisit` ASC),
  CONSTRAINT `fk_Visit_has_Doctor_Visit1`
    FOREIGN KEY (`Visit_idVisit`)
    REFERENCES `mydb`.`Visit` (`idVisit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Visit_has_Doctor_Doctor1`
    FOREIGN KEY (`Doctor_idDoctor`)
    REFERENCES `mydb`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`procedure`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`procedure` (
  `idprocedure` INT NOT NULL,
  `procedure_description` VARCHAR(100) NULL,
  `procedure_cost` DECIMAL NULL,
  PRIMARY KEY (`idprocedure`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Visit_has_procedure`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Visit_has_procedure` (
  `Visit_idVisit` INT NOT NULL,
  `procedure_idprocedure` INT NOT NULL,
  PRIMARY KEY (`Visit_idVisit`, `procedure_idprocedure`),
  INDEX `fk_Visit_has_procedure_procedure1_idx` (`procedure_idprocedure` ASC),
  INDEX `fk_Visit_has_procedure_Visit1_idx` (`Visit_idVisit` ASC),
  CONSTRAINT `fk_Visit_has_procedure_Visit1`
    FOREIGN KEY (`Visit_idVisit`)
    REFERENCES `mydb`.`Visit` (`idVisit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Visit_has_procedure_procedure1`
    FOREIGN KEY (`procedure_idprocedure`)
    REFERENCES `mydb`.`procedure` (`idprocedure`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`procedure_has_Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`procedure_has_Doctor` (
  `procedure_idprocedure` INT NOT NULL,
  `Doctor_idDoctor` TINYTEXT NOT NULL,
  PRIMARY KEY (`procedure_idprocedure`, `Doctor_idDoctor`),
  INDEX `fk_procedure_has_Doctor_Doctor1_idx` (`Doctor_idDoctor` ASC),
  INDEX `fk_procedure_has_Doctor_procedure1_idx` (`procedure_idprocedure` ASC),
  CONSTRAINT `fk_procedure_has_Doctor_procedure1`
    FOREIGN KEY (`procedure_idprocedure`)
    REFERENCES `mydb`.`procedure` (`idprocedure`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_procedure_has_Doctor_Doctor1`
    FOREIGN KEY (`Doctor_idDoctor`)
    REFERENCES `mydb`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `idUser` VARCHAR(20) NOT NULL,
  `name` VARCHAR(50) NULL,
  `departmentID` INT NULL,
  `email` VARCHAR(45) NULL,
  `user_contact` VARCHAR(13) NULL,
  PRIMARY KEY (`idUser`),
  INDEX `departmentID_idx` (`departmentID` ASC),
  CONSTRAINT `departmentID`
    FOREIGN KEY (`departmentID`)
    REFERENCES `mydb`.`Department` (`idDepartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pharmacy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pharmacy` (
  `idDrug` INT NOT NULL,
  `drug_description` VARCHAR(45) NULL,
  `quantity` DECIMAL NULL,
  `userID` VARCHAR(20) NULL,
  `drug_cost` DECIMAL NULL,
  PRIMARY KEY (`idDrug`),
  INDEX `userID_idx` (`userID` ASC),
  CONSTRAINT `userID`
    FOREIGN KEY (`userID`)
    REFERENCES `mydb`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Prescription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Prescription` (
  `idPrescription` INT NOT NULL,
  `quantity` DECIMAL NULL,
  `prescription_description` VARCHAR(45) NULL,
  `patientID` VARCHAR(20) NULL,
  `userID` TINYTEXT NULL,
  `visitID` INT NULL,
  `Prescriptioncol` VARCHAR(45) NULL,
  PRIMARY KEY (`idPrescription`),
  INDEX `patientID_idx` (`patientID` ASC),
  INDEX `visitID_idx` (`visitID` ASC),
  INDEX `userID_idx` (`userID` ASC),
  CONSTRAINT `patientID`
    FOREIGN KEY (`patientID`)
    REFERENCES `mydb`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `visitID`
    FOREIGN KEY (`visitID`)
    REFERENCES `mydb`.`Visit` (`idVisit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `userID`
    FOREIGN KEY (`userID`)
    REFERENCES `mydb`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Doctor_has_Prescription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Doctor_has_Prescription` (
  `Doctor_idDoctor` TINYTEXT NOT NULL,
  `Prescription_idPrescription` INT NOT NULL,
  PRIMARY KEY (`Doctor_idDoctor`, `Prescription_idPrescription`),
  INDEX `fk_Doctor_has_Prescription_Prescription1_idx` (`Prescription_idPrescription` ASC),
  INDEX `fk_Doctor_has_Prescription_Doctor1_idx` (`Doctor_idDoctor` ASC),
  CONSTRAINT `fk_Doctor_has_Prescription_Doctor1`
    FOREIGN KEY (`Doctor_idDoctor`)
    REFERENCES `mydb`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Doctor_has_Prescription_Prescription1`
    FOREIGN KEY (`Prescription_idPrescription`)
    REFERENCES `mydb`.`Prescription` (`idPrescription`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Prescription_has_Pharmacy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Prescription_has_Pharmacy` (
  `Prescription_idPrescription` INT NOT NULL,
  `Pharmacy_idDrug` INT NOT NULL,
  PRIMARY KEY (`Prescription_idPrescription`, `Pharmacy_idDrug`),
  INDEX `fk_Prescription_has_Pharmacy_Pharmacy1_idx` (`Pharmacy_idDrug` ASC),
  INDEX `fk_Prescription_has_Pharmacy_Prescription1_idx` (`Prescription_idPrescription` ASC),
  CONSTRAINT `fk_Prescription_has_Pharmacy_Prescription1`
    FOREIGN KEY (`Prescription_idPrescription`)
    REFERENCES `mydb`.`Prescription` (`idPrescription`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prescription_has_Pharmacy_Pharmacy1`
    FOREIGN KEY (`Pharmacy_idDrug`)
    REFERENCES `mydb`.`Pharmacy` (`idDrug`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Lab_header`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Lab_header` (
  `idLab_header` INT NOT NULL,
  `userID` VARCHAR(20) NULL,
  `visitID` INT NULL,
  `lab_test_date` DATE NULL,
  `lab_test_time` TIME NULL,
  PRIMARY KEY (`idLab_header`),
  INDEX `userID_idx` (`userID` ASC),
  INDEX `visitID_idx` (`visitID` ASC),
  CONSTRAINT `userID`
    FOREIGN KEY (`userID`)
    REFERENCES `mydb`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `visitID`
    FOREIGN KEY (`visitID`)
    REFERENCES `mydb`.`Visit` (`idVisit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Radio_Image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Radio_Image` (
  `idRadio_Image` INT NOT NULL,
  `visitID` INT NULL,
  `userID` VARCHAR(20) NULL,
  `image_date` DATETIME NULL,
  PRIMARY KEY (`idRadio_Image`),
  INDEX `visitID_idx` (`visitID` ASC),
  INDEX `userID_idx` (`userID` ASC),
  CONSTRAINT `visitID`
    FOREIGN KEY (`visitID`)
    REFERENCES `mydb`.`Visit` (`idVisit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `userID`
    FOREIGN KEY (`userID`)
    REFERENCES `mydb`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`UOM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`UOM` (
  `idUOM` VARCHAR(20) NOT NULL,
  `UOM_description` VARCHAR(45) NULL,
  `quantity_per_UOM` DECIMAL NULL,
  PRIMARY KEY (`idUOM`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`UOM_has_Pharmacy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`UOM_has_Pharmacy` (
  `UOM_idUOM` VARCHAR(20) NOT NULL,
  `Pharmacy_idDrug` INT NOT NULL,
  PRIMARY KEY (`UOM_idUOM`, `Pharmacy_idDrug`),
  INDEX `fk_UOM_has_Pharmacy_Pharmacy1_idx` (`Pharmacy_idDrug` ASC),
  INDEX `fk_UOM_has_Pharmacy_UOM1_idx` (`UOM_idUOM` ASC),
  CONSTRAINT `fk_UOM_has_Pharmacy_UOM1`
    FOREIGN KEY (`UOM_idUOM`)
    REFERENCES `mydb`.`UOM` (`idUOM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_UOM_has_Pharmacy_Pharmacy1`
    FOREIGN KEY (`Pharmacy_idDrug`)
    REFERENCES `mydb`.`Pharmacy` (`idDrug`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Lab_test_lines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Lab_test_lines` (
  `idLab_test_lines` INT NOT NULL,
  `Lab_test_reagentID` INT NULL,
  `Lab_test_time` TIME NULL,
  `Lab_test_drug_quantity` DECIMAL NULL,
  `Lab_test_UOM` VARCHAR(20) NULL,
  `Lab_test_cost` DECIMAL NULL,
  PRIMARY KEY (`idLab_test_lines`),
  INDEX `Lab_test_reagentID_idx` (`Lab_test_reagentID` ASC),
  INDEX `Lab_test_UOM_idx` (`Lab_test_UOM` ASC),
  CONSTRAINT `Lab_test_reagentID`
    FOREIGN KEY (`Lab_test_reagentID`)
    REFERENCES `mydb`.`Pharmacy` (`idDrug`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Lab_test_UOM`
    FOREIGN KEY (`Lab_test_UOM`)
    REFERENCES `mydb`.`UOM_has_Pharmacy` (`UOM_idUOM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Lab_test_results`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Lab_test_results` (
  `idLab_test` INT NOT NULL,
  `Lab_test_description` VARCHAR(255) NULL,
  `Lab_headerID` INT NULL,
  `Lab_test_linesID` INT NULL,
  PRIMARY KEY (`idLab_test`),
  INDEX `Lab_test_linesID_idx` (`Lab_test_linesID` ASC),
  INDEX `Lab_headerID_idx` (`Lab_headerID` ASC),
  CONSTRAINT `Lab_test_linesID`
    FOREIGN KEY (`Lab_test_linesID`)
    REFERENCES `mydb`.`Lab_test_lines` (`idLab_test_lines`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Lab_headerID`
    FOREIGN KEY (`Lab_headerID`)
    REFERENCES `mydb`.`Lab_header` (`idLab_header`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Triage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Triage` (
  `idTriage` INT NOT NULL,
  `height` DECIMAL NULL,
  `mass` DECIMAL NULL,
  `blood_pressure` DECIMAL NULL,
  `Triagecol` VARCHAR(45) NULL,
  `Visit_idVisit` INT NOT NULL,
  `checkup_cost` DECIMAL NULL,
  PRIMARY KEY (`idTriage`, `Visit_idVisit`),
  INDEX `fk_Triage_Visit1_idx` (`Visit_idVisit` ASC),
  CONSTRAINT `fk_Triage_Visit1`
    FOREIGN KEY (`Visit_idVisit`)
    REFERENCES `mydb`.`Visit` (`idVisit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Address` (
  `idAddress` INT NOT NULL,
  `contact` VARCHAR(13) NULL,
  `Address1` VARCHAR(45) NULL,
  `Address2` VARCHAR(45) NULL,
  `patientID` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idAddress`, `patientID`),
  INDEX `fk_Address_Patient1_idx` (`patientID` ASC),
  CONSTRAINT `fk_Address_Patient1`
    FOREIGN KEY (`patientID`)
    REFERENCES `mydb`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Diagnosis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Diagnosis` (
  `idDiagnosis` INT NOT NULL,
  `diagnosis_description` VARCHAR(100) NULL,
  `doctorID` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idDiagnosis`, `doctorID`),
  INDEX `fk_Diagnosis_Doctor1_idx` (`doctorID` ASC),
  CONSTRAINT `fk_Diagnosis_Doctor1`
    FOREIGN KEY (`doctorID`)
    REFERENCES `mydb`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Diagnosis_has_Visit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Diagnosis_has_Visit` (
  `Diagnosis_idDiagnosis` INT NOT NULL,
  `Diagnosis_doctorID` VARCHAR(20) NOT NULL,
  `Visit_idVisit` INT NOT NULL,
  PRIMARY KEY (`Diagnosis_idDiagnosis`, `Diagnosis_doctorID`, `Visit_idVisit`),
  INDEX `fk_Diagnosis_has_Visit_Visit1_idx` (`Visit_idVisit` ASC),
  INDEX `fk_Diagnosis_has_Visit_Diagnosis1_idx` (`Diagnosis_idDiagnosis` ASC, `Diagnosis_doctorID` ASC),
  CONSTRAINT `fk_Diagnosis_has_Visit_Diagnosis1`
    FOREIGN KEY (`Diagnosis_idDiagnosis` , `Diagnosis_doctorID`)
    REFERENCES `mydb`.`Diagnosis` (`idDiagnosis` , `doctorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Diagnosis_has_Visit_Visit1`
    FOREIGN KEY (`Visit_idVisit`)
    REFERENCES `mydb`.`Visit` (`idVisit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`History`>>>>>>>17/08/17
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`History` (
  `idFamily_history` INT NOT NULL,
  `Patient_idPatient` VARCHAR(20) NOT NULL,
  `hist_type` ENUM('Medical', 'Family', 'Gynaecological', 'Surgical') NULL,
  PRIMARY KEY (`idFamily_history`),
  INDEX `fk_Family_history_Patient1_idx` (`Patient_idPatient` ASC),
  CONSTRAINT `fk_Family_history_Patient1`
    FOREIGN KEY (`Patient_idPatient`)
    REFERENCES `mydb`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Follow_up`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Follow_up` (
  `idFollow_up` INT NOT NULL,
  `description` VARCHAR(100) NULL,
  `follow_up_date` DATE NULL,
  `Follow_up_time` TIME NULL,
  `Visit_idVisit` INT NOT NULL,
  PRIMARY KEY (`idFollow_up`, `Visit_idVisit`),
  INDEX `fk_Follow_up_Visit1_idx` (`Visit_idVisit` ASC),
  CONSTRAINT `fk_Follow_up_Visit1`
    FOREIGN KEY (`Visit_idVisit`)
    REFERENCES `mydb`.`Visit` (`idVisit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sales_header`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sales_header` (
  `idSales_header` INT NOT NULL,
  `customerID` VARCHAR(20) NULL,
  `customer_name` VARCHAR(50) NULL,
  `posting_date` DATE NULL,
  PRIMARY KEY (`idSales_header`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sales_line`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sales_line` (
  `idSales_line` INT NOT NULL,
  `type` ENUM('item', 'Resource', 'G/L Account') NULL,
  `no` VARCHAR(20) NULL,
  `description` VARCHAR(100) NULL,
  `quantity` DECIMAL NULL,
  `amount` DECIMAL NULL,
  `Sales_header_idSales_header` INT NOT NULL,
  PRIMARY KEY (`idSales_line`, `Sales_header_idSales_header`),
  INDEX `fk_Sales_line_Sales_header1_idx` (`Sales_header_idSales_header` ASC),
  CONSTRAINT `fk_Sales_line_Sales_header1`
    FOREIGN KEY (`Sales_header_idSales_header`)
    REFERENCES `mydb`.`Sales_header` (`idSales_header`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
