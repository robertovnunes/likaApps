

-- -----------------------------------------------------
-- Table `CasoClinico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Caso_Clinico` (
    `id_caso_clinico` INT NOT NULL,
    `descricao` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id_caso_clinico`)
)  ENGINE=InnoDB;


-- -----------------------------------------------------
-- Table `Secao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Secao` (
    `id_secao` INT NOT NULL,
    `descricao` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id_secao`)
)  ENGINE=InnoDB;


-- -----------------------------------------------------
-- Table `Topico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Topico` (
    `id_topico` INT NOT NULL,
    `descricao` VARCHAR(255) NOT NULL,
    `id_secao` INT NOT NULL,
	`ordenado` BOOLEAN NOT NULL,
    PRIMARY KEY (`id_topico`, `id_secao`),
    INDEX `fk_Topico_Secao_idx` (`id_secao` ASC),
    CONSTRAINT `fk_Topico_Secao` FOREIGN KEY (`id_secao`)
        REFERENCES `Secao` (`id_secao`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=InnoDB;


-- -----------------------------------------------------
-- Table `Questao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Questao` (
    `id_questao` INT NOT NULL,
    `texto` VARCHAR(255) NOT NULL,
    `id_topico` INT NOT NULL,
    `id_secao` INT NOT NULL,
    PRIMARY KEY (`id_secao`,`id_topico`,`id_questao`),
    INDEX `fk_Questao_Topico1_idx` (`id_topico` ASC),
    CONSTRAINT `fk_Questao_Topico1` FOREIGN KEY (`id_topico`, `id_secao`)
        REFERENCES `Topico` (`id_topico`, `id_secao`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=InnoDB;


-- -----------------------------------------------------
-- Table `Resposta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Resposta` (
    `id_resposta` INT NOT NULL,
    `texto` VARCHAR(255) NOT NULL,
    `id_topico` INT NOT NULL,
    `id_secao` INT NOT NULL,
    `id_caso_clinico` INT NOT NULL,
    PRIMARY KEY (`id_caso_clinico`, `id_secao`, `id_topico`,`id_resposta`),
    INDEX `fk_Resposta_Topico1_idx` (`id_topico` ASC),
    INDEX `fk_Resposta_Caso_Clinico1_idx` (`id_caso_clinico` ASC),
    CONSTRAINT `fk_Resposta_Topico1` FOREIGN KEY (`id_topico`, `id_secao`)
        REFERENCES `Topico` (`id_topico` , `id_secao`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_Resposta_Caso_Clinico1` FOREIGN KEY (`id_caso_clinico`)
        REFERENCES `Caso_Clinico` (`id_caso_clinico`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=InnoDB;
