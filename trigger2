create or replace function hotelchain_exists()
returns trigger
language plpgsql
as $$
begin
    if not exists (select 1 from hotelchain where chainname = new.chainname) then
        raise exception 'hotelchain does not exist';
    end if;
    return new;
end;
$$;

create or replace trigger hotelchainexists
before insert or update on hotel
for each row
execute function hotelchain_exists();
