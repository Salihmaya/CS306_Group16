CREATE VIEW high_expenditure_countries_overall AS
SELECT c.country_name, AVG(p.expenditure_pc_gdp) as average_expenditure
FROM public_health_expenditure p
JOIN countries c ON p.iso_code = c.iso_code
GROUP BY c.country_name
HAVING AVG(p.expenditure_pc_gdp) > (SELECT AVG(expenditure_pc_gdp) FROM public_health_expenditure);

SELECT * FROM high_expenditure_countries;