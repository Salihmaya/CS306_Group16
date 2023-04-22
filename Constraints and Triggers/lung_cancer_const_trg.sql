-- the constraints for male_death_rate and female_death_rate

ALTER TABLE lung_cancer_deaths
ADD CONSTRAINT male_death_rate_check CHECK (male_death_rate >= 0 AND male_death_rate <= 100);

ALTER TABLE lung_cancer_deaths
ADD CONSTRAINT female_death_rate_check CHECK (female_death_rate >= 0 AND female_death_rate <= 100);
-- insertion check

INSERT INTO lung_cancer_deaths(iso_code, year, male_death_rate, female_death_rate)
VALUES ('XXX', 2023, -5, 140);

-- the before insertion trigger

DELIMITER //
CREATE TRIGGER before_insert_male
BEFORE INSERT ON lung_cancer_deaths
FOR EACH ROW
BEGIN
  IF NEW.male_death_rate < 0 THEN
    SET NEW.male_death_rate = 0;
  ELSEIF NEW.male_death_rate > 100 THEN
    SET NEW.male_death_rate = 100;
  END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_insert_female
BEFORE INSERT ON lung_cancer_deaths
FOR EACH ROW
BEGIN
  IF NEW.female_death_rate < 0 THEN
    SET NEW.female_death_rate = 0;
  ELSEIF NEW.female_death_rate > 100 THEN
    SET NEW.female_death_rate = 100;
  END IF;
END;
//
DELIMITER ;

-- the before update trigger

DELIMITER //
CREATE TRIGGER before_update_male
BEFORE UPDATE ON lung_cancer_deaths
FOR EACH ROW
BEGIN
  IF NEW.male_death_rate < 0 THEN
    SET NEW.male_death_rate = 0;
  ELSEIF NEW.male_death_rate > 100 THEN
    SET NEW.male_death_rate = 100;
  END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER before_update_female
BEFORE UPDATE ON lung_cancer_deaths
FOR EACH ROW
BEGIN
  IF NEW.female_death_rate < 0 THEN
    SET NEW.female_death_rate = 0;
  ELSEIF NEW.female_death_rate > 100 THEN
    SET NEW.female_death_rate = 100;
  END IF;
END;
//
DELIMITER ;
