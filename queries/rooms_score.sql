drop procedure if exists rooms_score;

delimiter ;;

create procedure rooms_score()
begin
    select id, score(id) as 'score' from rooms;
end;;

delimiter ;
