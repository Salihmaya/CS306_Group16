CREATE VIEW high_expenditure_years AS
SELECT c.country_name, p.year, p.expenditure_pc_gdp
FROM public_health_expenditure p
JOIN countries c ON p.iso_code = c.iso_code
WHERE p.expenditure_pc_gdp > (SELECT AVG(expenditure_pc_gdp) FROM public_health_expenditure);

SELECT * FROM high_expenditure_years;
