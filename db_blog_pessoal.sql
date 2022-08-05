SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DB_BLOG_PESSOAL
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DB_BLOG_PESSOAL
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DB_BLOG_PESSOAL` DEFAULT CHARACTER SET utf8 ;
USE `DB_BLOG_PESSOAL` ;

-- -----------------------------------------------------
-- Table `DB_BLOG_PESSOAL`.`TB_TEMAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_BLOG_PESSOAL`.`TB_TEMAS` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_BLOG_PESSOAL`.`TB_USUARIOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_BLOG_PESSOAL`.`TB_USUARIOS` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `usuario` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `foto` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_BLOG_PESSOAL`.`TB_POSTAGENS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_BLOG_PESSOAL`.`TB_POSTAGENS` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(255) NOT NULL,
  `texto` VARCHAR(1000) NOT NULL,
  `data` DATE NULL,
  `tema_id` BIGINT NULL,
  `usuario_id` BIGINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_TB_POSTAGENS_TB_TEMAS_idx` (`tema_id` ASC) VISIBLE,
  INDEX `fk_TB_POSTAGENS_TB_USUARIOS1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_TB_POSTAGENS_TB_TEMAS`
    FOREIGN KEY (`tema_id`)
    REFERENCES `DB_BLOG_PESSOAL`.`TB_TEMAS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TB_POSTAGENS_TB_USUARIOS1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `DB_BLOG_PESSOAL`.`TB_USUARIOS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;