SELECT high_expenditure_years.country_name, high_expenditure_years.year
FROM high_expenditure_years
LEFT JOIN high_lung_cancer_deaths
ON high_expenditure_years.country_name = high_lung_cancer_deaths.country_name
AND high_expenditure_years.year = high_lung_cancer_deaths.year
WHERE high_lung_cancer_deaths.country_name IS NULL;

SELECT country_name, year
FROM high_expenditure_years
EXCEPT
SELECT country_name, year
FROM high_lung_cancer_deaths;
