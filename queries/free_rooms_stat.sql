drop function if exists free_rooms_stat;

delimiter ;;

create function free_rooms_stat(
    room int,
    start_date datetime,
    end_date datetime,
    hotel int,
    seats int,
    flat int
)
returns int
reads sql data
begin
    declare skip_hotel bool default false;
    declare skip_seats bool default false;
    declare skip_flat bool default false;
    declare skip_room bool default false;
    declare result int;

    if (room = 0) then
        set skip_room = true;
    end if;

    if (hotel = 0) then
        set skip_hotel = true;
    end if;

    if (flat = 0) then
        set skip_flat = true;
    end if;

    if (seats = 0) then
        set skip_seats = true;
    end if;

    select count(*) from contracts c
    join rooms r on r.id = c.room
    where
        (r.id = room or skip_room) and
        (r.seats = seats or skip_seats) and
        (r.hotel = hotel or skip_hotel) and
        contract_in_soft_range(c.id, start_date, end_date)
    into result;
    return result;
end;;

delimiter ;