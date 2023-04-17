SELECT *
FROM high_lung_cancer_deaths
WHERE (country_name, year) IN
  (SELECT country_name, year
   FROM high_advertisementban);

SELECT *
FROM high_lung_cancer_deaths l
WHERE EXISTS (
  SELECT country_name, year
  FROM high_advertisementban a
  WHERE l.country_name = a.country_name
    AND l.year = a.year
    
);