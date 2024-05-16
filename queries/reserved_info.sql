drop procedure if exists reserved_info;

delimiter ;;

create procedure reserved_info(
    start_date datetime,
    end_date datetime
)
begin
    select p.name, p.conclusion_date, p.termination_date, p.discount, count(c.id) as 'contracts' from contracts c
    join partners p on c.partner = p.id
    where
        contract_in_hard_range(c.id, start_date, end_date)
        and c.status = 'created'
    group by p.name, p.conclusion_date, p.termination_date, p.discount;
end;;

delimiter ;