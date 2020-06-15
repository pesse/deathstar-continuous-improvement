drop table "flyway_schema_history";
drop view sith_persons;
drop table sith_characters_t;
drop package ut_sith_persons;

create table sith_persons (
  id integer generated by default as identity primary key,
  name varchar2(200) not null unique,
  alive number(1,0) default 1 not null,
  constraint sith_persons_chk_alive_bol check ( alive in (1,0) )
);


insert into sith_persons (name, alive) values ('Darth Vader', 1);
insert into sith_persons (name, alive) values ('Darth Maul', 1);
insert into sith_persons (name, alive) values ('Exar Kun', 0);
commit;