CREATE VIEW high_lung_cancer_deaths AS
SELECT c.country_name, l.year
FROM lung_cancer_deaths l
JOIN countries c ON l.iso_code = c.iso_code
WHERE l.male_death_rate > (SELECT AVG(male_death_rate) FROM lung_cancer_deaths) 
AND l.female_death_rate > (SELECT AVG(female_death_rate) FROM lung_cancer_deaths);

SELECT * FROM high_lung_cancer_deaths;

