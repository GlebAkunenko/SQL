drop procedure if exists persons_in_room;

delimiter ;;

create procedure persons_in_room(room int)
begin
    select p.id from contracts c
        join persons p on c.person = p.id
        where c.room = room and curdate() between c.start and c.end;
end;;

delimiter ;