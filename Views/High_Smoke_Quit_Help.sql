CREATE VIEW High_Smoke_Quit_Help AS

SELECT x.name, y.year

FROM smoking_quit_help y

JOIN countries x ON y.iso_code =x.iso_code

Where y.help_indicator > (SELECT AVG(help_indicator) FROM smoking_quit_help);

Select *from High_Smoke_Quit_Help;
