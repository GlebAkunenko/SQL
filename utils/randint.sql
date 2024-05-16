drop function if exists randint;

delimiter ;;

create function randint(min int, max int)
returns int
no sql
begin
    return floor(rand() * (max - min + 1)) + min;
end;;

delimiter ;