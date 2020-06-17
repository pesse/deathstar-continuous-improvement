alter table sith_characters_t
  add prename varchar2(100)
  add surname varchar2(100);

update sith_characters_t set
  prename = trim(substr(name, 1, instr(name, ' '))),
  surname = trim(substr(name, instr(name, ' ')));

create or replace trigger sith_persons_trg_save
  instead of insert or update or delete on sith_persons
  begin
    if inserting then
      insert into sith_characters_t (name, alive, prename, surname)
        values ( :new.name, :new.alive,
          trim(substr(:new.name, 1, instr(:new.name, ' '))),
          trim(substr(:new.name, instr(:new.name, ' '))));
    elsif updating then
      update sith_characters_t set
        name = :new.name,
        alive = :new.alive,
        prename = trim(substr(:new.name, 1, instr(:new.name, ' '))),
        surname = trim(substr(:new.name, instr(:new.name, ' ')))
      where id = :new.id;
    end if;
  end;
/