drop procedure if exists partner_duration;

delimiter ;;

create procedure partner_duration(partner int)
begin
    declare skip_partner bool default false;

    if (partner = 0) then
        set skip_partner = true;
    end if ;

    select name,
           TIMESTAMPDIFF(day, conclusion_date, curdate()) as 'days',
           IF(termination_date and curdate() < termination_date, TIMESTAMPDIFF(day, curdate(), termination_date), 'никогда') as 'end'
        from partners
        where skip_partner or (id = partner);
end;;

delimiter ;
