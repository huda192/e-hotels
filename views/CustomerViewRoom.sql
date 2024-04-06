select 
    hotelname as hotel_name, 
    hoteladdress as hotel_address, 
    capacity, viewtype as view_type, 
    isextendable as is_extendable 
from "projectGroup100".room
where roomid = 125;