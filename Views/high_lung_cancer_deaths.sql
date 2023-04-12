CREATE VIEW high_lung_cancer_deaths AS
SELECT *
FROM lung_cancer_deaths
WHERE male_death_rate > (SELECT AVG(male_death_rate) FROM lung_cancer_deaths) AND female_death_rate >(SELECT AVG(female_death_rate) FROM lung_cancer_deaths);

SELECT * FROM high_lung_cancer_deaths;

