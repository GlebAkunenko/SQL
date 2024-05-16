drop procedure if exists free_after;

delimiter ;;

create procedure free_after(
    after_date datetime
)
begin
    select h.address, r.floor, r.number, r.cost from contracts c
    join rooms r on r.id = c.room
    join hotels h on r.hotel = h.id
    where c.start < curdate() < c.end and c.end <= after_date;
end;;

delimiter ;