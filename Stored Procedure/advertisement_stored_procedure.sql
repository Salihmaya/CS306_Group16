


DELIMITER $$
CREATE PROCEDURE find_countries(IN ban_indicator INT)
BEGIN
	SELECT *
    FROM cigarette_advertisements c
    WHERE c.ban_indicator = ban_indicator;
END$$

DELIMITER ;


CALL find_countries(5);
CALL find_countries(1);
