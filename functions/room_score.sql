drop function if exists score;

delimiter ;;

create function score(room int)
returns float
reads sql data
begin
    declare result float;
    select avg(f.score) from feedbacks f
        join contracts c on f.contract = c.id
        join rooms r on c.room = room
    into result;
    return result;
end;;

delimiter ;