drop trigger if exists check_dates_i;
drop trigger if exists check_dates_u;

delimiter ;;

create trigger check_dates_i before insert on contracts
for each row
begin
    if (new.start >= new.end) then
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The end date is before the start';
    end if ;
end ;;

create trigger check_dates_u before update on contracts
for each row
begin
    if (new.start >= new.end) then
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The end date is before the start';
    end if ;
end ;;

delimiter ;