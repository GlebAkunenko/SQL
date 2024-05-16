drop trigger if exists check_score_i;
drop trigger if exists check_score_u;

delimiter ;;

create trigger check_score_i before insert on feedbacks
for each row
begin
    if (new.score not between 0 and 10) then
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The score must be between 0 and 10';
    end if ;
end ;;

create trigger check_score_u before update on feedbacks
for each row
begin
    if (new.score not between 0 and 10) then
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The score must be between 0 and 10';
    end if ;
end ;;

delimiter ;