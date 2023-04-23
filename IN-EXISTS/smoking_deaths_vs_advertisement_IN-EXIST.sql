SELECT 	*
FROM high_advertisementban 
WHERE ban_indicator = 5
AND country_name IN (SELECT distinct country_name
					 FROM low_death_rate_smoking);

SELECT *
FROM high_advertisementban hb
WHERE EXISTS (
    SELECT *
    FROM low_death_rate_smoking ls
    WHERE hb.country_name = ls.country_name 
    AND hb.ban_indicator = 5
);
