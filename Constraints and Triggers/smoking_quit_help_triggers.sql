-- CHECK MIN AND MAX VALUES ON DATASET
SELECT MIN(help_indicator) AS min_indicator, Max(help_indicator) AS max_indicator
FROM smoking_quit_help;

-- CONSTRATINT ADDITION
ALTER TABLE smoking_quit_help
ADD CONSTRAINT help_indicator CHECK (help_indicator BETWEEN 1 AND 5);

-- TRIGGER CREATION WITHIN THE REQUIRED RANGE OF VALUES
DELIMITER //
CREATE TRIGGER trigger_before
Before insert on smoking_quit_help
for each row
Begin

	IF new.help_indicator < 1 THEN
		SET new.help_indicator=1;
	ELSEIF new.help_indicator >5 THEN
		Set new.help_indicator =5;
	end if;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER trigger_after
Before update on smoking_quit_help
for each row
Begin

	IF new.help_indicator < 1 THEN
		SET new.help_indicator=1;
	ELSEIF new.help_indicator >5 THEN
		Set new.help_indicator =5;
	end if;
END;
//
DELIMITER ;


-- AFTER THE FOLLOWING INSERTION THE MAX VALUE WAS STILL 5    
INSERT INTO smoking_quit_help(iso_code)
VALUES ('ABC', 2023, 120);

