drop function if exists contract_in_soft_range;

delimiter ;;

create function contract_in_soft_range(
    contract int,
    start_date datetime,
    end_date datetime
)
returns bool
reads sql data
begin
    declare result bool;
    select
        (date_in_range(c.start, start_date, end_date) or
         date_in_range(c.end, start_date, end_date))
        from contracts c where c.id = contract
    into result;
    return result;
end;;

delimiter ;