SELECT * FROM hospital.Staff;

CREATE TABLE IF NOT EXISTS `hospital`.`Office` (
  `Building` VARCHAR(45) NOT NULL,
  `Room` VARCHAR(45) NOT NULL,
  `Department_DeptID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Room`, `Building`),
  INDEX `fk_Office_Department1_idx` (`Department_DeptID` ASC),
  CONSTRAINT `fk_Office_Department1`
    FOREIGN KEY (`Department_DeptID`)
    REFERENCES `hospital`.`Department` (`DeptID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO Office (Building, Room, Department_DeptID)
  SELECT Building, Room, Department_DeptID
  FROM Staff GROUP BY Building, Room, Department_DeptID;

ALTER TABLE Office
  ADD INDEX `fk_Staff_Office1_idx` (`Building` ASC, `Room` ASC),
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

ALTER TABLE Staff
  ADD COLUMN `Office_Building` VARCHAR(45) NOT NULL,
  ADD COLUMN `Office_Room` VARCHAR(45) NOT NULL,
  ADD INDEX `fk_Staff_Office1_idx` (`Office_Building` ASC, `Office_Room` ASC),
  ADD CONSTRAINT `fk_Staff_Office1`
    FOREIGN KEY (`Office_Building`, `Office_Room`)
    REFERENCES `hospital`.`Office` (`Building`,`Room`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8;
	