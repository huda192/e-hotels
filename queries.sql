You will find below four seperate queries(seperated by '/**...**/', test one query at a time)

/**
select count(roomid)
    from room
    where viewtype = 'mountain' and capacity = 2;
**/

/**
  select roomid from room_issues
    where anyissue='no';
**/

/**
  select roomid from room
    where price<200 and capacity>3
**/

/**
    select * from hotel
    where hotelname in (
        select hotelname
        from hotel
        where chainname = 'Hilton'
    );

    select empid
    from worksfor
    inner join 
    (
	    select hotelname, hoteladdress
	    from hotel
	    where chainname = 'Hilton') hotelresults 
    on worksfor.hotelname = hotelresults.hotelname and worksfor.hoteladdress = hotelresults.hoteladdress;
**/
