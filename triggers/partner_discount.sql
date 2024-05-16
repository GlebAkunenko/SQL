drop trigger if exists partner_discount_i;
drop trigger if exists partner_discount_u;

delimiter ;;

create trigger partner_discount_i before insert on partners
for each row
begin
    if (new.discount > 1) then
        set new.discount = 1;
    end if ;
end ;;

create trigger partner_discount_u before update on partners
for each row
begin
    if (new.discount > 1) then
        set new.discount = 1;
    end if ;
end ;;

delimiter ;