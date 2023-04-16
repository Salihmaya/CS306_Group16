CREATE TABLE High_Quit_Help_and_Low_Death_Rate_outerjoin(
   country_name VARCHAR(50),
   year INT
);

INSERT INTO High_Quit_Help_and_Low_Death_Rate_outerjoin(country_name, year)
SELECT high_smoke_quit_help.country_name, low_death_rate_smoking.year
FROM high_smoke_quit_help
LEFT OUTER JOIN low_death_rate_smoking
ON high_smoke_quit_help.country_name=low_death_rate_smoking.country_name
AND high_smoke_quit_help.year=low_death_rate_smoking.year
Where low_death_rate_smoking.country_name IS NULL;
