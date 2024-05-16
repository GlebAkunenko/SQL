drop procedure if exists fill;

delimiter ;;

create procedure fill(n int, p0 int, pn int, r0 int, rn int, cn int, d_min datetime, d_max datetime)
begin
    declare i int default 0;
    declare person, room, company int;
    declare _start, _end datetime;

    start transaction;

    while i < n do
        set _start = randdate(d_min, d_max),
            _end = randdate(d_min, d_max);
        while _end < _start do
            set _start = randdate(d_min, d_max),
                _end = randdate(d_min, d_max);
        end while ;
    set person = (i % (pn - p0)) + p0,
        room = (i % (rn - r0)) + r0,
        company = floor((rand() * 10) % cn + 1);
    if (rand() < 0.6) then
        set company = null;
    end if ;
    insert into contracts (person, room, start, end, partner)
        value (person, room, _start, _end, company);
    set i = i + 1;
    end while ;

    commit;
end ;;

delimiter ;
