USE CS306_Project;
CREATE TABLE countries(iso_code VarChar(5) NOT NULL,
			country_name VarChar(50),
                        primary key (iso_code)
                        );
CREATE TABLE death_rate_smoking(iso_code VarChar(50),
				year int,
				death_rate double,
                                foreign key(iso_code) references countries(iso_code) ON DELETE CASCADE,
                                primary key(year)
                                );
SELECT * FROM death_rate_smoking;
SELECT * FROM countries;
