Create Table countries(
	iso_code Varchar(5) NOT NULL,
    country_name Varchar(50),
    primary key (iso_code)
);
Create Table lung_cancer_deaths(
	year INT,
    iso_code varchar(5) NOT NULL,
    male_death_rate DECIMAL,
	female_death_rate DECIMAL,
    PRIMARY KEY (iso_code,year),
    Foreign Key (iso_code) References countries(iso_code) ON DELETE CASCADE
);
