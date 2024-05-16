drop procedure if exists persons_stat;

delimiter ;;

create procedure persons_stat(
    hotel int,
    seats int,
    flat int,
    start_date datetime,
    end_date datetime
)
begin
    declare skip_hotel bool default false;
    declare skip_seats bool default false;
    declare skip_flat bool default false;
    declare skip_start bool default false;
    declare skip_end bool default false;

    if (hotel = 0) then
        set skip_hotel = true;
    end if;

    if (seats = 0) then
        set skip_seats = true;
    end if;

    if (flat = 0) then
        set skip_flat = true;
    end if;


    select distinct p.* from contracts c
    join rooms r on r.id = c.room
    join persons p on p.id = c.person
    where
        (r.hotel = hotel or skip_hotel) and
        (r.seats = seats or skip_seats) and
        (r.floor = flat or skip_flat) and
        contract_in_hard_range(c.id, start_date, end_date);

end;;

delimiter ;