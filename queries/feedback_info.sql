drop procedure if exists feedback_info;

delimiter ;;

create procedure feedback_info(
    person int
)
begin
    select f.* from feedbacks f
    join contracts c on f.contract = c.id
    where c.person = person;
end;;

delimiter ;