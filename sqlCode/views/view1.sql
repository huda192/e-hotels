select * from 
	(select 
		case
			when hoteladdress like '%, Canada' then
				substring(hoteladdress, position(', Canada' in hoteladdress)-2)
			when hoteladdress like '%, USA' then
				substring(hoteladdress, position(', USA' in hoteladdress)-2)
		end as state_or_province,
		count(*) as num_rooms
	from (select * from (select * 
		from "projectGroup100".room
		left outer join "projectGroup100".booking
		on room.roomid = booking.roomid)
		where isrenting is null or isrenting='no' or isarchived='yes')
	group by state_or_province
	order by num_rooms desc) as table1
where table1.state_or_province is not null;