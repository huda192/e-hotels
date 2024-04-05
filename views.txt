View1:
/**
SELECT 
    CASE
        WHEN hoteladdress LIKE '%, Canada' THEN
            SUBSTRING(hoteladdress, POSITION(', Canada' IN hoteladdress)-2)
        WHEN hoteladdress LIKE '%, USA' THEN
            SUBSTRING(hoteladdress, POSITION(', USA' IN hoteladdress)-2)
    END AS state_or_province,
	count(*) as num_rooms
from (select * from (select * 
	from project.room
	left outer join project.booking
	on room.roomid = booking.roomid)
	where isrenting is null or isrenting='no' or isarchived='yes')
group by state_or_province
order by num_rooms desc;
**/

View 2: 
/**
SELECT
    room_data.hotelname,
    chain_table.chainname,
    room_data.hoteladdress,
    room_data.total_capacity
FROM
    (SELECT
        hotelname,
        hoteladdress,
        SUM(capacity) AS total_capacity
    FROM
        project.room
    GROUP BY
        hotelname,
        hoteladdress) AS room_data
LEFT OUTER JOIN
    (SELECT
        hotelname,
        hoteladdress,
        chainname
    FROM
        project.hotel) AS chain_table
ON
    room_data.hotelname = chain_table.hotelname
    AND room_data.hoteladdress = chain_table.hoteladdress;
**/

View 3
/**
 select
        case
            when hoteladdress like '%, Canada' then substring(hoteladdress, position((', Canada') in (hoteladdress)) - 2)
            when hoteladdress like '%, USA' then substring(hoteladdress, position((', USA') in (hoteladdress)) - 2)
        end as substr,
    count(*) AS num_hotels
   from project.hotel
  group by (
        case
            when hoteladdress like '%, Canada' then substring(hoteladdress, position((', Canada') in (hoteladdress)) - 2)
            when hoteladdress like '%, USA' then substring(hoteladdress, position((', USA') in (hoteladdress)) - 2)
        end)
  order by (count(*)) desc;
**/
