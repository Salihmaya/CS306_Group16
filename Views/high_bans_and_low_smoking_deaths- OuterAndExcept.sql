

CREATE VIEW high_bans_and_low_smoking_deaths AS
SELECT a.country_name, a.year
FROM high_advertisementban a
LEFT OUTER JOIN low_death_rate_smoking L
ON a.country_name = L.country_name AND a.year = L.year
WHERE L.country_name IS NULL;


SELECT a.country_name, a.year
FROM high_advertisementban a
EXCEPT
SELECT L.country_name, L.year
FROM low_death_rate_smoking L;