-- Select statements were utilized with IN and EXISTS OPERATORS

Select *
FROM high_smoke_quit_help
Where (country_name, year) IN
(SELECT country_name,year
FROM low_death_rate_smoking);

SELECT *
FROM high_smoke_quit_help q
WHERE EXISTS (
  SELECT country_name, year
  FROM low_death_rate_smoking d
  WHERE q.country_name = d.country_name
  AND q.year = d.year
);
