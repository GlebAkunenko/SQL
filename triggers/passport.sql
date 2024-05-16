drop trigger if exists check_dates_i;
drop trigger if exists check_dates_u;

delimiter ;;

create trigger check_passport_i before insert on persons
for each row
begin
    if (new.passport not regexp '[0-9]{4} [0-9]{6}') then
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wrong the passport format';
    end if ;
end ;;

create trigger check_passport_u before update on persons
for each row
begin
    if (new.passport not regexp '[0-9]{4} [0-9]{6}') then
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wrong the passport format';
    end if;
end ;;

delimiter ;