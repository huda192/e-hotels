select 
	hotelname as hotel_name, 
	hoteladdress as hotel_address, 
	capacity, 
	viewtype as view_type, 
	isextendable as is_extendable, 
	price as price_per_night 
from "projectGroup100".room 
where hotelname = 'Enterprise' and hoteladdress = '6060 Dillons Rd, Chilliwack, BC, Canada';