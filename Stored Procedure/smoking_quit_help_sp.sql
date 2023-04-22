DELIMITER // 
CREATE PROCEDURE Avg_Help_Indicator(IN param_iso_code VARCHAR (5))
BEGIN
	SELECT
     h.iso_code,
     AVG(q.help_indicator) AS AverageHelpIndicator
	FROM
		countries h
        Join
        smoking_quit_help q ON q.iso_code=h.iso_code
	WHERE
		h.iso_code=param_iso_code
	Group BY
		h.iso_code, h.country_name;
END //
DELIMITER ;

Call Avg_Help_Indicator('TUR')
