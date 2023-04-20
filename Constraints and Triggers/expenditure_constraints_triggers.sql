-- Add the constraint

ALTER TABLE public_health_expenditure
ADD CONSTRAINT chk_expenditure_pc_gdp CHECK (expenditure_pc_gdp >= 0 AND expenditure_pc_gdp <= 100);

-- Just a check to see whether it actually works or not

INSERT INTO public_health_expenditure(iso_code, year, expenditure_pc_gdp)
VALUES ('WWW', 2023, 120);

-- Add the before insertion trigger

DELIMITER //
CREATE TRIGGER trg_before_insert_expenditure
BEFORE INSERT ON public_health_expenditure
FOR EACH ROW
BEGIN
  IF NEW.expenditure_pc_gdp < 0 THEN
    SET NEW.expenditure_pc_gdp = 0;
  ELSEIF NEW.expenditure_pc_gdp > 100 THEN
    SET NEW.expenditure_pc_gdp = 100;
  END IF;
END;
//
DELIMITER ;

-- Add the before update trigger

DELIMITER //
CREATE TRIGGER trg_before_update_expenditure
BEFORE UPDATE ON public_health_expenditure
FOR EACH ROW
BEGIN
  IF NEW.expenditure_pc_gdp < 0 THEN
    SET NEW.expenditure_pc_gdp = 0;
  ELSEIF NEW.expenditure_pc_gdp > 100 THEN
    SET NEW.expenditure_pc_gdp = 100;
  END IF;
END;
//
DELIMITER ;


