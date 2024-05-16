delimiter ;;

create trigger creation_date before insert on contracts
for each row
begin
    set new.creating_date = current_timestamp();
end ;;

delimiter ;