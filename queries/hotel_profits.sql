drop procedure if exists hotel_profits;

delimiter ;;

create procedure hotel_profits(
    start_date datetime,
    end_date datetime
)
begin
    select h.address, sum(cost(c.id)) from contracts c
    join rooms r on c.room = r.id
    join hotels h on r.hotel = h.id
    where contract_in_hard_range(c.id, start_date, end_date)
    group by h.address;
end;;

delimiter ;
