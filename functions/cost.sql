drop function if exists cost;

delimiter ;;

create function cost(contract int)
returns int
reads sql data
begin
    declare base, services int;
    declare duration int;
    declare discount float;

    select r.cost from contracts c
    join rooms r on c.room = r.id
    where c.id = contract
    into base;

    select sum(s.cost) from contracts c
    join contract_service cs on c.id = cs.contract
    join services s on cs.service = s.id
    where c.id = contract
    into services;

    select p.discount from partners p
    join contracts c on c.partner = p.id
    where c.id = contract and is_partner_actual(p.id)
    into discount;

    if (services is null) then
        set services = 0;
    end if;

    if (discount is null) then
        set discount = 0;
    end if ;

    select TIMESTAMPDIFF(HOUR, start, end) from contracts
    where id = contract
    into duration;

    return (base + services) / 24 * duration * (1 - discount);
end ;;

delimiter ;
