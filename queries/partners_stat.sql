drop procedure if exists partners_stat;

delimiter ;;

create procedure partners_stat(
    min_contracts int,
    start_date datetime,
    end_date datetime
)
begin
    select p.name, count(*) as n from contracts c
    join partners p on c.partner = p.id
    where contract_in_soft_range(c.id, start_date, end_date)
    group by p.name
    having n > min_contracts;
end;;

delimiter ;