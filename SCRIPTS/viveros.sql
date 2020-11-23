-- MySQL Script generated by MySQL Workbench
-- Sun Nov 22 22:08:28 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema viveros
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema viveros
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `viveros` DEFAULT CHARACTER SET utf8 ;
USE `viveros` ;

-- -----------------------------------------------------
-- Table `viveros`.`Vivero`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `viveros`.`Vivero` ;

CREATE TABLE IF NOT EXISTS `viveros`.`Vivero` (
  `Localizacion` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Localizacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `viveros`.`Zona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `viveros`.`Zona` ;

CREATE TABLE IF NOT EXISTS `viveros`.`Zona` (
  `CodZona` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Localizacion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CodZona`),
  INDEX `Localizacion_idx` (`Localizacion` ASC),
  CONSTRAINT `Localizacion`
    FOREIGN KEY (`Localizacion`)
    REFERENCES `viveros`.`Vivero` (`Localizacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `viveros`.`Empleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `viveros`.`Empleado` ;

CREATE TABLE IF NOT EXISTS `viveros`.`Empleado` (
  `DNI` VARCHAR(10) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Sueldo` FLOAT NOT NULL,
  `NSegSocial` FLOAT NOT NULL,
  `FechaInicio` VARCHAR(45) NOT NULL,
  `FechaFin` VARCHAR(45) NULL,
  `CodigoZona` INT NOT NULL,
  PRIMARY KEY (`DNI`),
  INDEX `CodZona_idx` (`CodigoZona` ASC),
  CONSTRAINT `FKZona_Empleado`
    FOREIGN KEY (`CodigoZona`)
    REFERENCES `viveros`.`Zona` (`CodZona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `viveros`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `viveros`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `viveros`.`Cliente` (
  `DNI` VARCHAR(10) NOT NULL,
  `CodFid` VARCHAR(45) NOT NULL,
  `Bonificacion` FLOAT NOT NULL,
  `VolumenMensual` FLOAT NOT NULL,
  `FechaNac` VARCHAR(45) NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `CodFid_UNIQUE` (`CodFid` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `viveros`.`Producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `viveros`.`Producto` ;

CREATE TABLE IF NOT EXISTS `viveros`.`Producto` (
  `Fecha` VARCHAR(10) NOT NULL,
  `CodBarras` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Stock` INT NOT NULL,
  `Precio` FLOAT NOT NULL,
  `CodZona` INT NOT NULL,
  PRIMARY KEY (`CodBarras`),
  INDEX `CodZona_idx` (`CodZona` ASC),
  CONSTRAINT `FKPZona_Producto`
    FOREIGN KEY (`CodZona`)
    REFERENCES `viveros`.`Zona` (`CodZona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `viveros`.`Pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `viveros`.`Pedido` ;

CREATE TABLE IF NOT EXISTS `viveros`.`Pedido` (
  `CodPedidio` INT NOT NULL,
  `Importe` INT NOT NULL,
  `Fecha` VARCHAR(45) NOT NULL,
  `CodBarras` VARCHAR(45) NOT NULL,
  `DNI Cliente` VARCHAR(10) NOT NULL,
  `DNI Empleado` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`CodPedidio`),
  INDEX `DNI_idx` (`DNI Cliente` ASC),
  INDEX `DNI Empleado_idx` (`DNI Empleado` ASC),
  INDEX `CodigoBarras_idx` (`CodBarras` ASC),
  CONSTRAINT `FKCliente`
    FOREIGN KEY (`DNI Cliente`)
    REFERENCES `viveros`.`Cliente` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FKEmpleado`
    FOREIGN KEY (`DNI Empleado`)
    REFERENCES `viveros`.`Empleado` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FKProducto`
    FOREIGN KEY (`CodBarras`)
    REFERENCES `viveros`.`Producto` (`CodBarras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `viveros`.`Vivero`
-- -----------------------------------------------------
START TRANSACTION;
USE `viveros`;
INSERT INTO `viveros`.`Vivero` (`Localizacion`, `Nombre`) VALUES ('Granadilla', 'ViveroUno');

COMMIT;


-- -----------------------------------------------------
-- Data for table `viveros`.`Zona`
-- -----------------------------------------------------
START TRANSACTION;
USE `viveros`;
INSERT INTO `viveros`.`Zona` (`CodZona`, `Nombre`, `Localizacion`) VALUES (22222, 'San Isidro', 'Granadilla');

COMMIT;


-- -----------------------------------------------------
-- Data for table `viveros`.`Empleado`
-- -----------------------------------------------------
START TRANSACTION;
USE `viveros`;
INSERT INTO `viveros`.`Empleado` (`DNI`, `Nombre`, `Sueldo`, `NSegSocial`, `FechaInicio`, `FechaFin`, `CodigoZona`) VALUES ('554545664', 'Rafael Cala', 2000, 325426, '12-3-99', '', 22222);

COMMIT;


-- -----------------------------------------------------
-- Data for table `viveros`.`Cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `viveros`;
INSERT INTO `viveros`.`Cliente` (`DNI`, `CodFid`, `Bonificacion`, `VolumenMensual`, `FechaNac`, `Nombre`) VALUES ('43554532', '52445454', 2000, 1000, '7-12-99', 'Ana');

COMMIT;


-- -----------------------------------------------------
-- Data for table `viveros`.`Producto`
-- -----------------------------------------------------
START TRANSACTION;
USE `viveros`;
INSERT INTO `viveros`.`Producto` (`Fecha`, `CodBarras`, `Nombre`, `Tipo`, `Stock`, `Precio`, `CodZona`) VALUES ('20-10-20', '435346166646', 'Manzana', 'Comida', 20, 20, 22222);

COMMIT;


-- -----------------------------------------------------
-- Data for table `viveros`.`Pedido`
-- -----------------------------------------------------
START TRANSACTION;
USE `viveros`;
INSERT INTO `viveros`.`Pedido` (`CodPedidio`, `Importe`, `Fecha`, `CodBarras`, `DNI Cliente`, `DNI Empleado`) VALUES (4323525, 200, '17-10-20', '435346166646', '43554532', '554545664');

COMMIT;

