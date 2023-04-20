SELECT he.year, SUM(he.expenditure_pc_gdp) AS total_expenditure_pc_gdp, AVG(he.expenditure_pc_gdp) AS avg_expenditure_pc_gdp
FROM public_health_expenditure he
INNER JOIN high_expenditure_years hey ON 
	he.year = hey.year AND he.iso_code = (SELECT iso_code FROM countries WHERE country_name = hey.country_name)
GROUP BY he.year
HAVING COUNT(he.iso_code) > 1;
