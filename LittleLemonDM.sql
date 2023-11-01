-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `BookingID` INT NOT NULL,
  `Date` DATETIME NOT NULL,
  `TableNumber` INT NOT NULL,
  PRIMARY KEY (`BookingID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FullName` VARCHAR(255) NOT NULL,
  `PhoneNumber` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `MenuID` INT NOT NULL,
  `Description` VARCHAR(255) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Delivery_Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Delivery_Status` (
  `DeliveryID` INT NOT NULL,
  `Delivery_date` DATETIME NOT NULL,
  PRIMARY KEY (`DeliveryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderID` INT NOT NULL,
  `Date` DATETIME NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL NOT NULL,
  `BookingID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `DeliveryID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `order_booking_fk_idx` (`BookingID` ASC) VISIBLE,
  INDEX `order_customer_fk_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `order_menu_fk_idx` (`MenuID` ASC) VISIBLE,
  INDEX `order_delivery_fk_idx` (`DeliveryID` ASC) VISIBLE,
  CONSTRAINT `order_booking_fk`
    FOREIGN KEY (`BookingID`)
    REFERENCES `LittleLemonDB`.`Bookings` (`BookingID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `order_customer_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `order_menu_fk`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDB`.`Menu` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `order_delivery_fk`
    FOREIGN KEY (`DeliveryID`)
    REFERENCES `LittleLemonDB`.`Delivery_Status` (`DeliveryID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staff_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff_info` (
  `StaffID` INT NOT NULL,
  `FullName` VARCHAR(255) NOT NULL,
  `PhoneNumber` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `Salary` DECIMAL NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`StaffID`),
  INDEX `staff_customer_fk_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `staff_customer_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
