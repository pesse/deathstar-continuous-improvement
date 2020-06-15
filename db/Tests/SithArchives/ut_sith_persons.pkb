create or replace package body ut_sith_persons as

  procedure select_from as
    l_row sith_persons%rowtype;
  begin
    -- Arrange
    insert into sith_characters_t (id, name, alive )
      values (-1, 'Darth Sam', 1);

    -- Assert
    select * into l_row from sith_persons where id = -1;
    ut.expect(l_row.name).to_equal('Darth Sam');
    ut.expect(l_row.alive).to_equal(1);
  end;

  procedure insert_into as
    l_row sith_persons%rowtype;
  begin
    insert into sith_persons (name, alive)
      values ('Darth Sam', 0);

    -- Assert
    select * into l_row from sith_persons
      where name = 'Darth Sam';
    ut.expect(l_row.id).to_be_greater_than(0);
    ut.expect(l_row.alive).to_equal(0);
  end;

end;
/