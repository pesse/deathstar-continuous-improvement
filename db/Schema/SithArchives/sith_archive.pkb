create or replace package body sith_archive as

  procedure add_sith( i_name varchar2 ) as
  begin
    insert into sith_persons ( name )
      values ( i_name );
  end;

  procedure set_alive( i_name varchar2, i_alive boolean ) as
    l_alive_int integer := case when i_alive then 1 else 0 end;
  begin
    update sith_persons set alive = l_alive_int where name = i_name;
  end;
end;
/