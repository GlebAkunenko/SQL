drop procedure if exists rooms_stat;

delimiter ;;

create procedure rooms_stat(
    hotel int,
    seats int,
    flat int
)
begin
    declare skip_hotel bool default false;
    declare skip_seats bool default false;
    declare skip_flat bool default false;

    if (hotel = 0) then
        set skip_hotel = true;
    end if;

    if (seats = 0) then
        set skip_seats = true;
    end if;

    if (flat = 0) then
        set skip_flat = true;
    end if;

    select distinct h.address, r.floor, r.number, r.cost from contracts c
    join rooms r on c.room = r.id
    join hotels h on r.hotel = h.id
    where
        (r.hotel = hotel or skip_hotel) and
        (r.seats = seats or skip_seats) and
        (r.floor = flat or skip_flat) and
        curdate() not between c.start and c.end;

end;;

delimiter ;