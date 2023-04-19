-- Step 1: Determine the minimum and maximum values of the death_rate column
SELECT MIN(death_rate) AS min_rate, MAX(death_rate) AS max_rate
FROM death_rate_smoking;

-- Step 2: Add a BEFORE INSERT trigger to ensure the death_rate value is within the allowed range
DELIMITER $$
CREATE TRIGGER death_rate_trigger
BEFORE INSERT ON death_rate_smoking
FOR EACH ROW
BEGIN
    IF NEW.death_rate NOT BETWEEN (SELECT MIN(death_rate) FROM death_rate_smoking) AND (SELECT MAX(death_rate) FROM death_rate_smoking) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The death rate value must be within the allowed range.';
    END IF;
END $$
DELIMITER ;

INSERT INTO death_rate_smoking (iso_code, year, death_rate)
VALUES ('USA', 2022, 1000);

-- Step 3: Add a BEFORE UPDATE trigger to fix the death_rate value if it's outside the allowed range
DELIMITER $$
CREATE TRIGGER death_rate_smoking_before_update
BEFORE UPDATE ON death_rate_smoking
FOR EACH ROW
BEGIN
    IF NEW.death_rate < (SELECT MIN(death_rate) FROM death_rate_smoking) THEN
        SET NEW.death_rate = (SELECT MIN(death_rate) FROM death_rate_smoking);
    ELSEIF NEW.death_rate > (SELECT MAX(death_rate) FROM death_rate_smoking) THEN
        SET NEW.death_rate = (SELECT MAX(death_rate) FROM death_rate_smoking);
    END IF;
END $$
DELIMITER ;

INSERT INTO death_rate_smoking (iso_code, year, death_rate)
VALUES ('USA', 2022, 1000);

UPDATE death_rate_smoking SET death_rate = 30.0 WHERE iso_code = 'USA';





