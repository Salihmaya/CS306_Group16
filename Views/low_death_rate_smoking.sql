CREATE VIEW low_death_rate_smoking AS
SELECT c.country_name, d.year
FROM death_rate_smoking d
JOIN countries c ON d.iso_code = c.iso_code
WHERE d.death_rate < (SELECT AVG(death_rate) FROM death_rate_smoking);

SELECT * FROM low_death_rate_smoking;