create Table countries(
	iso_code Varchar(5) NOT NULL,
    country_name Varchar(50),
    primary key (iso_code)
);


create Table smoking_quit_help(

	iso_code varchar(5) NOT NULL,
    year INT,
    indicator double,
    primary key(iso_code, year),
    foreign key (iso_code) references countries(iso_code) ON DELETE CASCADE
    );