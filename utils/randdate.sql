drop function if exists randdate;

delimiter ;;

create function randdate(min datetime, max datetime)
returns datetime
no sql
begin
    declare result datetime;
    SELECT TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, min, max)), min) into result;
    return result;
end;;

delimiter ;