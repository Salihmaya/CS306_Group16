DELIMITER //
CREATE PROCEDURE GetAverageDeathsByCountry(IN iso_code_param VARCHAR(5))
BEGIN
    SELECT 
        c.iso_code,
        AVG(d.male_death_rate) AS avg_male_death_rate,
        AVG(d.female_death_rate) AS avg_female_death_rate
    FROM
        countries c
	JOIN
        lung_cancer_deaths d ON c.iso_code = d.iso_code
    WHERE
        c.iso_code = iso_code_param
    GROUP BY
        c.iso_code, c.country_name;
END //
DELIMITER ;

CALL GetAverageDeathsByCountry('TUR');
CALL GetAverageDeathsByCountry('ITA');