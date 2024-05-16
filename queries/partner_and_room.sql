drop procedure if exists parters_and_rooms;

delimiter ;;

create procedure parters_and_rooms(
    start_date datetime,
    end_date datetime
)
begin
    select p.name, r.seats, count(r.seats) from contracts c
    join partners p on c.partner = p.id
    join rooms r on c.room = r.id
    where contract_in_soft_range(c.id, start_date, end_date)
    group by p.name, r.seats;
end;;

delimiter ;