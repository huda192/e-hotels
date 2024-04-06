SELECT 
      table1.roomid,
      table2.hotelname,
      table2.hoteladdress,
      table1.custid,
      table1.payment,
      table1.date,
      table1.isrenting,
      table1.isarchived,
      table2.capacity,
      table2.viewtype,
      table2.isextendable
FROM ( SELECT *
      FROM "projectGroup100".booking) table1
INNER JOIN ( SELECT *
      FROM "projectGroup100".room) table2 ON table1.roomid = table2.roomid;