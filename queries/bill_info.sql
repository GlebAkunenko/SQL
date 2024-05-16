drop procedure if exists bill_info;

delimiter ;;

create procedure bill_info(
    per int,
    room int
)
begin

    declare cont, duration int;

    select c.id from contracts c
    where
        c.person = per and
        curdate() between c.start and c.end and
        c.room = room
    into cont;

    select TIMESTAMPDIFF(HOUR, start, curdate()) / 24 from contracts
    where id = cont
    into duration;

    select s.name, s.cost * duration as 'bill' from services s
    join contract_service cs on cs.service = s.id
    where cs.contract = cont;
end;;

delimiter ;