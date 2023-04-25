
CREATE VIEW high_bans_and_low_smoking_deaths AS
SELECT a.country_name, a.year
FROM high_advertisementban a
LEFT OUTER JOIN low_death_rate_smoking l
ON l.country_name = a.country_name AND l.year = a.year