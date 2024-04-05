
Trigger #1 - before making a new booking, it makes sure that the room exists so that we are not booking into a non existent room.
/**
create or replace function check_room_id_exists()
returns trigger
language plpgsql
as $$
begin
    if not exists (select 1 from room where roomid = new.roomid) then
        raise exception 'room does not exist';
    end if;
    return new;
end;
$$;

create trigger check_room_id_trigger
before insert or update on booking
for each row
execute function check_room_id_exists();
**/
