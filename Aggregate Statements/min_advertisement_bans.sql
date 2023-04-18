-- finds the lung cancer death rates of the countries with minimum advertisement bans in a specific year

SELECT lc.iso_code, lc.year, lc.male_death_rate, lc.female_death_rate
FROM lung_cancer_deaths lc
INNER JOIN (
  SELECT ca.iso_code, ca.year
  FROM cigarette_advertisements ca
  GROUP BY ca.iso_code, ca.year
  HAVING MIN(ca.ban_indicator) = (
    SELECT MIN(ban_indicator)
    FROM cigarette_advertisements
  )
) AS ca
ON lc.iso_code = ca.iso_code AND lc.year = ca.year;
