CREATE DATABASE cs306_project;
USE cs306_project;

Create TABLE Countries(
	iso_code Varchar(5) NOT NULL,
    country_name Varchar(50),
    primary key (iso_code)
);

CREATE TABLE Cigarette_advertisements(
	iso_code VARCHAR(3) NOT NULL,
    year INT,
    ban_indicator INT,
    
    PRIMARY KEY (iso_code, year),
    FOREIGN KEY (iso_code) REFERENCES Countries(iso_code)  ON DELETE CASCADE
);


