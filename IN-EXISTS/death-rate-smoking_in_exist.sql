SELECT *
FROM death_rate_smoking
WHERE iso_code IN (
  SELECT iso_code
  FROM death_rate_smoking
  WHERE year = 1990
  AND death_rate > 20
);

SELECT *
FROM death_rate_smoking
WHERE EXISTS (
  SELECT iso_code
  FROM death_rate_smoking
  WHERE year = 1990
  AND death_rate > 20
  AND iso_code = death_rate_smoking.iso_code
);



