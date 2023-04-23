

-- create table of years and the max death rate of the countries that bans ads most strictly

SELECT ads.year, MAX(smk.death_rate)
FROM cigarette_advertisements ads INNER JOIN death_rate_smoking smk
ON ads.iso_code = smk.iso_code
WHERE ads.ban_indicator = (	SELECT MAX(ban_indicator)
							FROM cigarette_advertisements)
GROUP BY ads.year
HAVING ads.year > 2000




