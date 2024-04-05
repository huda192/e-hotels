select
    room_data.hotelname,
    chain_table.chainname,
    room_data.hoteladdress,
    room_data.total_capacity
from
    (select
        hotelname,
        hoteladdress,
        sum(capacity) as total_capacity
    from "projectGroup100".room
    group by hotelname, hoteladdress) as room_data
left outer join
    (select hotelname, hoteladdress, chainname
    from "projectGroup100".hotel) as chain_table
on room_data.hotelname = chain_table.hotelname
    and room_data.hoteladdress = chain_table.hoteladdress;