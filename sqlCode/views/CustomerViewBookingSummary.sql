select   
	table2.hotelname, 
	table2.hoteladdress,
	table1.payment,
	table1.date
from (select * from "projectGroup100".booking where roomid = 125) table1
inner join (select * from "projectGroup100".room) table2
on table1.roomid = table2.roomid;