-- finds the lung cancer death rates and death rate smoking of the countries results to only include groups with a only death_rates highger than 40.

SELECT COUNT(DISTINCT d.iso_code, d.year) AS common_columns
FROM death_rate_smoking AS d
JOIN lung_cancer_deaths AS l ON d.iso_code = l.iso_code AND d.year = l.year
WHERE d.death_rate > 40 AND (l.male_death_rate > 40 OR l.female_death_rate > 40);







