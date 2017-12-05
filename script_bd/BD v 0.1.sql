-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ecaptain
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ecaptain
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ecaptain` DEFAULT CHARACTER SET utf8 ;
USE `ecaptain` ;

-- -----------------------------------------------------
-- Table `ecaptain`.`Dishes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecaptain`.`Dishes` (
  `idDish` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idDish`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecaptain`.`Ingredients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecaptain`.`Ingredients` (
  `idIngredients` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idIngredients`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecaptain`.`Recipes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecaptain`.`Recipes` (
  `idRecipes` INT NOT NULL AUTO_INCREMENT,
  `idDish` INT NULL,
  `idIngredient` INT NULL,
  `ingredientQuantity` DOUBLE NULL,
  PRIMARY KEY (`idRecipes`),
  INDEX `idDishes_idx` (`idDish` ASC),
  INDEX `FK_ID_INGREDIENTS_idx` (`idIngredient` ASC),
  CONSTRAINT `FK_ID_DISHES`
    FOREIGN KEY (`idDish`)
    REFERENCES `ecaptain`.`Dishes` (`idDish`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ID_INGREDIENTS`
    FOREIGN KEY (`idIngredient`)
    REFERENCES `ecaptain`.`Ingredients` (`idIngredients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecaptain`.`Islands`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecaptain`.`Islands` (
  `idIslands` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT '',
  `capacity` INT NULL DEFAULT 1,
  PRIMARY KEY (`idIslands`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecaptain`.`Containers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecaptain`.`Containers` (
  `idContainers` INT NOT NULL AUTO_INCREMENT,
  `numberOnIsland` INT NOT NULL,
  `idIsland` INT NOT NULL,
  `capacity` DOUBLE NOT NULL DEFAULT 0 COMMENT 'Max capacity avaliable to this container. In kgs.',
  PRIMARY KEY (`idContainers`),
  INDEX `FK_ID_ISLANDS_idx` (`idIsland` ASC),
  CONSTRAINT `FK_ID_ISLANDS`
    FOREIGN KEY (`idIsland`)
    REFERENCES `ecaptain`.`Islands` (`idIslands`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecaptain`.`ContainersStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecaptain`.`ContainersStatus` (
  `idContainersStatus` INT NOT NULL AUTO_INCREMENT,
  `idContainers` INT NOT NULL,
  `idDishes` INT NOT NULL,
  `actualWeight` DOUBLE NOT NULL,
  `datetime` DATETIME NOT NULL,
  INDEX `FK_CONTAINERS_ID_CONTAINERS_idx` (`idContainers` ASC),
  INDEX `FK_DISHES_ID_DISHES_idx` (`idDishes` ASC),
  PRIMARY KEY (`idContainersStatus`),
  CONSTRAINT `FK_CONTAINERS_ID_CONTAINERS`
    FOREIGN KEY (`idContainers`)
    REFERENCES `ecaptain`.`Containers` (`idContainers`),
  CONSTRAINT `FK_DISHES_ID_DISHES`
    FOREIGN KEY (`idDishes`)
    REFERENCES `ecaptain`.`Dishes` (`idDish`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
