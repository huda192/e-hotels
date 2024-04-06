select empid as hilton_employee_id, hotelresults.hotelname, hotelresults.hoteladdress
from worksfor
inner join 
(
    select hotelname, hoteladdress
    from hotel
    where chainname = 'Hilton') hotelresults 
on worksfor.hotelname = hotelresults.hotelname and worksfor.hoteladdress = hotelresults.hoteladdress;