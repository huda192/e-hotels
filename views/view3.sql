select * 
from 
    (select
        case
            when hoteladdress like '%, Canada' then substring(hoteladdress, position((', Canada') in (hoteladdress)) - 2)
            when hoteladdress like '%, USA' then substring(hoteladdress, position((', USA') in (hoteladdress)) - 2)
        end as state_or_province,
    count(*) as num_hotels
    from "projectGroup100".hotel
    group by (
        case
            when hoteladdress like '%, Canada' then substring(hoteladdress, position((', Canada') in (hoteladdress)) - 2)
            when hoteladdress like '%, USA' then substring(hoteladdress, position((', USA') in (hoteladdress)) - 2)
        end)
    order by (count(*)) desc) as table1
where table1.state_or_province is not null;