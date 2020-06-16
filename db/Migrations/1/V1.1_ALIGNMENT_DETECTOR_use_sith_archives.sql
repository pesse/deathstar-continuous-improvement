create or replace package body alignment_detector as

  function exists_in_sith_archives( i_name varchar2 )
    return boolean
  as
    l_count integer;
  begin
    select count(*) into l_count from sith_persons where lower(name) = lower(i_name);
    return l_count > 0;
  end;

  function detect_from_name( i_name varchar2 )
    return varchar2
  as
  begin
    if i_name like 'Darth%' then
      return 'dark';
    elsif exists_in_sith_archives(i_name) then
      return 'dark';
    else
      return 'light';
    end if;
  end;

end;
/