create or replace package sith_archive as

  procedure add_sith( i_name varchar2 );

  procedure set_alive( i_name varchar2, i_alive boolean );
end;
/