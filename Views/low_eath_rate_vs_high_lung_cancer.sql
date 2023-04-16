CREATE TABLE low_eath_rate_vs_high_lung_cancer_leftjoin (
   country_name VARCHAR(50),
   year INT
);

INSERT INTO low_eath_rate_vs_high_lung_cancer_leftjoin (country_name, year)
SELECT high_lung_cancer_deaths.country_name, high_lung_cancer_deaths.year
FROM high_lung_cancer_deaths
LEFT JOIN low_death_rate_smoking
ON high_lung_cancer_deaths.country_name = low_death_rate_smoking.country_name
AND high_lung_cancer_deaths.year = low_death_rate_smoking.year
WHERE low_death_rate_smoking.country_name IS NULL;

CREATE TABLE low_eath_rate_vs_high_lung_cancer_except (
   country_name VARCHAR(50),
   year INT
);
INSERT INTO low_eath_rate_vs_high_lung_cancer_except (country_name, year)
SELECT country_name, year
FROM high_lung_cancer_deaths
EXCEPT
SELECT country_name, year
FROM low_death_rate_smoking


