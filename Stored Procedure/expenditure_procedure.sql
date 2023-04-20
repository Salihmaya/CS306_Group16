DELIMITER //
CREATE PROCEDURE GetAverageExpenditureByCountry(IN iso_code_param VARCHAR(5))
BEGIN
    SELECT 
        c.iso_code,
        c.country_name,
        AVG(p.expenditure_pc_gdp) AS avg_expenditure_pc_gdp
    FROM
        countries c
    JOIN
        public_health_expenditure p ON c.iso_code = p.iso_code
    WHERE
        c.iso_code = iso_code_param
    GROUP BY
        c.iso_code, c.country_name;
END //
DELIMITER ;


-- Trying out the two values as specified in the task

CALL GetAverageExpenditureByCountry('KOR');
CALL GetAverageExpenditureByCountry('JPN');
