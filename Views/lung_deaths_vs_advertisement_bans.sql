SELECT country_name, year
FROM high_advertisementban
EXCEPT
SELECT country_name, year
FROM high_lung_cancer_deaths;

SELECT a.country_name, a.year
FROM high_advertisementban a
LEFT OUTER JOIN high_lung_cancer_deaths l
ON l.country_name = a.country_name AND l.year = a.year
WHERE l.country_name IS NULL
