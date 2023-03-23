Create Table countries(
	iso_code Varchar(5) NOT NULL,
    country_name Varchar(50),
    primary key (iso_code)
);
Create Table public_health_expenditure(
	iso_code varchar(5) NOT NULL,
	year INT,
    expenditure_pc_gdp double,
    primary key (iso_code, year),
    foreign key (iso_code) references countries(iso_code) ON DELETE CASCADE
);