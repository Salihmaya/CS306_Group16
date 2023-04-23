
DROP VIEW high_advertisementban;

CREATE VIEW high_advertisementban AS
SELECT c.country_name, adv.ban_indicator, adv.year
FROM cigarette_advertisements adv
JOIN countries c ON adv.iso_code = c.iso_code
WHERE adv.ban_indicator > (SELECT AVG(ban_indicator) FROM cigarette_advertisements) ;

SELECT * FROM high_advertisementban;
