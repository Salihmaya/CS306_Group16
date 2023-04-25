
-- contraint for ban_indicator which needs to be btw 1-5

alter table cigarette_advertisements
add constraint ban_indicator_check CHECK (ban_indicator > 0 and ban_indicator <= 5);



-- insertion check

insert into cigarette_advertisements(iso_code, year, ban_indicator)
values("TUR", 1990, 6);





-- trigger before insertion

DELIMITER $$
CREATE TRIGGER before_insertion_trigger BEFORE INSERT ON cigarette_advertisements
FOR EACH ROW
BEGIN
	IF new.ban_indicator < 1 THEN SET new.ban_indicator = 1;
    ELSEIF new.ban_indicator > 5 THEN SET new.ban_indicator = 5;    
    END IF;
END$$

DELIMITER ;



-- trigger before update

DELIMITER $$
CREATE TRIGGER before_update_trigger BEFORE UPDATE ON cigarette_advertisements
FOR EACH ROW
BEGIN
	IF new.ban_indicator < 1 THEN SET new.ban_indicator = 1;
    ELSEIF new.ban_indicator > 5 THEN SET new.ban_indicator = 5;    
    END IF;
END$$

DELIMITER ;




show triggers;



