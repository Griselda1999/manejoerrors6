-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bd_registroalumno
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_registroalumno
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_registroalumno` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `bd_registroalumno` ;

-- -----------------------------------------------------
-- Table `bd_registroalumno`.`tbl_alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_registroalumno`.`tbl_alumno` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_registroalumno`.`tbl_campus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_registroalumno`.`tbl_campus` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `ubicacion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_registroalumno`.`tbl_docente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_registroalumno`.`tbl_docente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_registroalumno`.`tbl_materia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_registroalumno`.`tbl_materia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_registroalumno`.`tbl_seccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_registroalumno`.`tbl_seccion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `num_aula` VARCHAR(45) NOT NULL,
  `id_campus` INT NOT NULL,
  `id_docente` INT NOT NULL,
  `id_materia` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_campus_idx` (`id_campus` ASC) VISIBLE,
  INDEX `fk_docente_idx` (`id_docente` ASC) VISIBLE,
  INDEX `fk_materia_idx` (`id_materia` ASC) VISIBLE,
  CONSTRAINT `fk_campus`
    FOREIGN KEY (`id_campus`)
    REFERENCES `bd_registroalumno`.`tbl_campus` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_docente`
    FOREIGN KEY (`id_docente`)
    REFERENCES `bd_registroalumno`.`tbl_docente` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_materia`
    FOREIGN KEY (`id_materia`)
    REFERENCES `bd_registroalumno`.`tbl_materia` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_registroalumno`.`tbl_asiste`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_registroalumno`.`tbl_asiste` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_seccion` INT NOT NULL,
  `id_alumno` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_seccion_idx` (`id_seccion` ASC) VISIBLE,
  INDEX `fk_tbl_asiste_tbl_alumno1_idx` (`id_alumno` ASC) VISIBLE,
  CONSTRAINT `fk_seccion`
    FOREIGN KEY (`id_seccion`)
    REFERENCES `bd_registroalumno`.`tbl_seccion` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_asiste_tbl_alumno1`
    FOREIGN KEY (`id_alumno`)
    REFERENCES `bd_registroalumno`.`tbl_alumno` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_registroalumno`.`tbl_carrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_registroalumno`.`tbl_carrera` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `num_clases` INT NOT NULL,
  `duracion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_registroalumno`.`tbl_matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_registroalumno`.`tbl_matricula` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_carrera` INT NOT NULL,
  `id_alumno` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_carrera_idx` (`id_carrera` ASC) VISIBLE,
  INDEX `fk_alumno_idx` (`id_alumno` ASC) VISIBLE,
  CONSTRAINT `fk_alumno`
    FOREIGN KEY (`id_alumno`)
    REFERENCES `bd_registroalumno`.`tbl_alumno` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_carrera`
    FOREIGN KEY (`id_carrera`)
    REFERENCES `bd_registroalumno`.`tbl_carrera` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
