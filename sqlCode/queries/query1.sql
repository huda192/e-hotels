select hotelname, chainname, hoteladdress, phonenumber, contactemail, numrooms, category  from hotel
where hotelname in (
    select hotelname
    from hotel
    where chainname = 'Hilton'
);