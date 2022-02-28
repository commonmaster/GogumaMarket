drop database if exists goguma;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema goguma
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema goguma
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `goguma` DEFAULT CHARACTER SET utf8 ;
USE `goguma` ;

drop database if exists goguma;
create database goguma;
use goguma;
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema goguma
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema goguma
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `goguma` DEFAULT CHARACTER SET utf8 ;
USE `goguma` ;

-- -----------------------------------------------------
-- Table `goguma`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goguma`.`member` (
  `mno` INT NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(64) NOT NULL UNIQUE,
  `password` VARCHAR(64) NOT NULL,
  `name` VARCHAR(128) NOT NULL,
  `mstate` INT DEFAULT 1,
  `email` VARCHAR(128),
  `tel` VARCHAR(128),
  `profile` LONGBLOB,
  `likecount` INT DEFAULT 0,
  `regDate` TIMESTAMP DEFAULT current_timestamp,
  `withdrawDate` TIMESTAMP null,
  PRIMARY KEY (`mno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goguma`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goguma`.`product` (
  `pno` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(128) NOT NULL,
  `price` INT DEFAULT 0,
  `contents` LONGTEXT,
  `pstate` INT DEFAULT 1,
  `views` INT DEFAULT 0,
  `date` TIMESTAMP DEFAULT current_timestamp,
  `modifyDate` TIMESTAMP DEFAULT current_timestamp,
  `picture` LONGBLOB,
  `likecnt` INT DEFAULT 0,
  `latitude` DOUBLE NOT NULL,
  `longitude` DOUBLE NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `mno` INT NOT NULL,
  PRIMARY KEY (`pno`),
  INDEX `fk_product_member1_idx` (`mno` ASC) VISIBLE,
  CONSTRAINT `fk_product_member1`
    FOREIGN KEY (`mno`)
    REFERENCES `goguma`.`member` (`mno`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goguma`.`heart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goguma`.`heart` (
  `hno` INT NOT NULL AUTO_INCREMENT,
  `pno` INT NOT NULL,
  `mno` INT NOT NULL,
  PRIMARY KEY (`hno`),
  INDEX `fk_heart_product1_idx` (`pno` ASC) VISIBLE,
  INDEX `fk_heart_member1_idx` (`mno` ASC) VISIBLE,
  CONSTRAINT `fk_heart_product1`
    FOREIGN KEY (`pno`)
    REFERENCES `goguma`.`product` (`pno`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_heart_member1`
    FOREIGN KEY (`mno`)
    REFERENCES `goguma`.`member` (`mno`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goguma`.`board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goguma`.`board` (
  `bno` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(128) NOT NULL,
  `contents` LONGTEXT NULL,
  `views` INT DEFAULT 0,
  `date` TIMESTAMP DEFAULT current_timestamp,
  `writer` INT NOT NULL,
  PRIMARY KEY (`bno`),
  INDEX `fk_board_member1_idx` (`writer` ASC) VISIBLE,
  CONSTRAINT `fk_board_member1`
    FOREIGN KEY (`writer`)
    REFERENCES `goguma`.`member` (`mno`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goguma`.`productReply`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goguma`.`productReply` (
  `rno` INT NOT NULL AUTO_INCREMENT,
  `contents` TEXT,
  `cdate` TIMESTAMP DEFAULT current_timestamp,
  `mno` INT NOT NULL,
  `pno` INT NOT NULL,
  PRIMARY KEY (`rno`),
  INDEX `fk_reply_member1_idx` (`mno` ASC) VISIBLE,
  INDEX `fk_reply_product1_idx` (`pno` ASC) VISIBLE,
  CONSTRAINT `fk_reply_member1`
    FOREIGN KEY (`mno`)
    REFERENCES `goguma`.`member` (`mno`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reply_product1`
    FOREIGN KEY (`pno`)
    REFERENCES `goguma`.`product` (`pno`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goguma`.`boardReply`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `goguma`.`boardReply` (
  `rno` INT NOT NULL AUTO_INCREMENT,
  `contents` TEXT,
  `cdate` TIMESTAMP DEFAULT current_timestamp,
  `mno` INT NOT NULL,
  `bno` INT NOT NULL,
  PRIMARY KEY (`rno`),
  INDEX `fk_boardReply_member1_idx` (`mno` ASC) VISIBLE,
  INDEX `fk_boardReply_board1_idx` (`bno` ASC) VISIBLE,
  CONSTRAINT `fk_boardReply_member1`
    FOREIGN KEY (`mno`)
    REFERENCES `goguma`.`member` (`mno`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_boardReply_board1`
    FOREIGN KEY (`bno`)
    REFERENCES `goguma`.`board` (`bno`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

SHOW TABLES;

insert into member(mno, id, password, name, email, tel) values(1, 'admin', '1111', '고구마 관리자', 'admin@goguma.com', '010-1234-4545');
insert into member(mno, id, password, name, email, tel) values(2, 'user1', '1111', '유저', 'user1@goguma.com', '010-1234-4445');

select * from member;
select * from product;
select * from boardReply;