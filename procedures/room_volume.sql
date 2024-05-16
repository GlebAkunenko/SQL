drop procedure if exists volume;

delimiter ;;

create procedure volume(room int, start_ datetime, end_ datetime, out result int)
reads sql data
begin
    declare _start, _end DATETIME;
    declare cur cursor for
        select c.start, c.end from contracts c
            where c.room = room;
    declare exit handler for not found begin end;

    open cur;
    set result = 0;

    read_loop: loop
        fetch cur into _start, _end;
        if(_start between start_ and end_ or _end between start_ and end_) then
           set result = result + 1;
        end if;
    end loop;
end ;;

delimiter ;
