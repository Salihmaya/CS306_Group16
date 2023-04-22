-- AVG Statement was used to select the help indicator values bigger than the average
SELECT q.iso_code, q.year, AVG(q.help_indicator) AS avg_help_indicator
FROM smoking_quit_help q
LEFT JOIN low_death_rate_smoking d ON q.iso_code = (SELECT iso_code FROM countries WHERE country_name = d.country_name) AND q.year = d.year
GROUP BY q.iso_code, q.year
HAVING AVG(q.help_indicator) > (Select AVG(help_indicator)
from smoking_quit_help);
