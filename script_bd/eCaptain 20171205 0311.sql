-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.21


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema ecaptain
--

CREATE DATABASE IF NOT EXISTS ecaptain;
USE ecaptain;

--
-- Definition of table `containers`
--

DROP TABLE IF EXISTS `containers`;
CREATE TABLE `containers` (
  `idContainers` int(11) NOT NULL AUTO_INCREMENT,
  `numberOnIsland` int(11) NOT NULL,
  `idIsland` int(11) NOT NULL,
  `capacity` double NOT NULL DEFAULT '0' COMMENT 'Max capacity avaliable to this container. In kgs.',
  PRIMARY KEY (`idContainers`),
  KEY `FK_ID_ISLANDS_idx` (`idIsland`),
  CONSTRAINT `FK_ID_ISLANDS` FOREIGN KEY (`idIsland`) REFERENCES `islands` (`idIslands`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `containers`
--

/*!40000 ALTER TABLE `containers` DISABLE KEYS */;
INSERT INTO `containers` (`idContainers`,`numberOnIsland`,`idIsland`,`capacity`) VALUES 
 (1,1,1,10),
 (2,2,1,7),
 (3,2,1,7),
 (4,3,1,10),
 (5,4,1,10),
 (6,5,1,9),
 (7,6,1,15),
 (8,7,1,10),
 (9,8,1,10),
 (10,1,2,10),
 (11,2,2,5),
 (12,3,2,7),
 (13,4,2,10),
 (14,5,2,16),
 (15,6,2,20),
 (16,1,3,10),
 (17,2,3,10),
 (18,3,3,10),
 (19,4,3,10),
 (20,5,3,10),
 (21,6,3,10),
 (22,7,3,10),
 (23,8,3,19),
 (24,9,3,6),
 (25,10,3,3);
/*!40000 ALTER TABLE `containers` ENABLE KEYS */;


--
-- Definition of table `containersstatus`
--

DROP TABLE IF EXISTS `containersstatus`;
CREATE TABLE `containersstatus` (
  `idContainersStatus` int(11) NOT NULL AUTO_INCREMENT,
  `idContainers` int(11) NOT NULL,
  `idDishes` int(11) NOT NULL,
  `actualWeight` double NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`idContainersStatus`),
  KEY `FK_CONTAINERS_ID_CONTAINERS_idx` (`idContainers`),
  KEY `FK_DISHES_ID_DISHES_idx` (`idDishes`),
  CONSTRAINT `FK_CONTAINERS_ID_CONTAINERS` FOREIGN KEY (`idContainers`) REFERENCES `containers` (`idContainers`),
  CONSTRAINT `FK_DISHES_ID_DISHES` FOREIGN KEY (`idDishes`) REFERENCES `dishes` (`idDish`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `containersstatus`
--

/*!40000 ALTER TABLE `containersstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `containersstatus` ENABLE KEYS */;


--
-- Definition of table `dishes`
--

DROP TABLE IF EXISTS `dishes`;
CREATE TABLE `dishes` (
  `idDish` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDish`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dishes`
--

/*!40000 ALTER TABLE `dishes` DISABLE KEYS */;
INSERT INTO `dishes` (`idDish`,`name`) VALUES 
 (1,'Arroz'),
 (2,'Pollo con Verduras'),
 (3,'Camaron Enchilado'),
 (4,'Pollo Con Pina'),
 (5,'Pizza');
/*!40000 ALTER TABLE `dishes` ENABLE KEYS */;


--
-- Definition of table `food_detail`
--

DROP TABLE IF EXISTS `food_detail`;
CREATE TABLE `food_detail` (
  `idfood_detail` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_isla` int(10) unsigned NOT NULL,
  `food_name` varchar(45) NOT NULL,
  `food_weight` double NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`idfood_detail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_detail`
--

/*!40000 ALTER TABLE `food_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `food_detail` ENABLE KEYS */;


--
-- Definition of table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE `ingredients` (
  `idIngredients` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idIngredients`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ingredients`
--

/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;


--
-- Definition of table `islands`
--

DROP TABLE IF EXISTS `islands`;
CREATE TABLE `islands` (
  `idIslands` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT '',
  `capacity` int(11) DEFAULT '1',
  PRIMARY KEY (`idIslands`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `islands`
--

/*!40000 ALTER TABLE `islands` DISABLE KEYS */;
INSERT INTO `islands` (`idIslands`,`name`,`capacity`) VALUES 
 (1,'isla 1',8),
 (2,'isla 2',6),
 (3,'isla 3',10);
/*!40000 ALTER TABLE `islands` ENABLE KEYS */;


--
-- Definition of table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
CREATE TABLE `recipes` (
  `idRecipes` int(11) NOT NULL AUTO_INCREMENT,
  `idDish` int(11) DEFAULT NULL,
  `idIngredient` int(11) DEFAULT NULL,
  `ingredientQuantity` double DEFAULT NULL,
  PRIMARY KEY (`idRecipes`),
  KEY `idDishes_idx` (`idDish`),
  KEY `FK_ID_INGREDIENTS_idx` (`idIngredient`),
  CONSTRAINT `FK_ID_DISHES` FOREIGN KEY (`idDish`) REFERENCES `dishes` (`idDish`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ID_INGREDIENTS` FOREIGN KEY (`idIngredient`) REFERENCES `ingredients` (`idIngredients`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recipes`
--

/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
