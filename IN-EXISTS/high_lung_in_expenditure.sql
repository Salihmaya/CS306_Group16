SELECT *
FROM high_lung_cancer_deaths
WHERE (country_name, year) IN
  (SELECT country_name, year
   FROM high_expenditure_years);


SELECT *
FROM high_lung_cancer_deaths l
WHERE EXISTS (
  SELECT country_name, year
  FROM high_expenditure_years e
  WHERE l.country_name = e.country_name
    AND l.year = e.year
);
