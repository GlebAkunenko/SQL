drop function if exists is_partner_actual;

delimiter ;;

create function is_partner_actual(partner int)
returns bool
reads sql data
begin
    declare termination_date date;
    select p.termination_date from partners p
    where p.id = partner
    into termination_date;
    return termination_date is null or curdate() < termination_date;
end ;;

delimiter ;
