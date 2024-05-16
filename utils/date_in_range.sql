drop function if exists date_in_range;

delimiter ;;

create function date_in_range(
    target datetime,
    start_date datetime,
    end_date datetime
)
returns bool
deterministic
begin
    declare skip_start bool default false;
    declare skip_end bool default false;
    declare result bool;

    if (start_date is null) then
        set skip_start = true;
    end if;

    if (end_date is null) then
        set skip_end = true;
    end if;

    set result = (
        skip_start or
        start_date <= target
    ) and (
        skip_end or
        target <= end_date
    );
    return result;
end;;

delimiter ;