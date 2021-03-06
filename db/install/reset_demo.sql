@../Schema/utils/utl_db_object.pks
@../Schema/utils/utl_db_object.pkb

call utl_db_object.drop_if_exists('flyway_schema_history');
call utl_db_object.drop_if_exists('SITH_PERSONS');
call utl_db_object.drop_if_exists('SITH_CHARACTERS_T');
call utl_db_object.drop_if_exists('UT_SITH_PERSONS', 'PACKAGE');
call utl_db_object.drop_if_exists('ALIGNMENT_DETECTOR', 'PACKAGE');

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

@../Schema/SithArchives/sith_archive.pks
@../Schema/SithArchives/sith_archive.pkb

@../Schema/utils/alignment_detector.pks
@../Schema/utils/alignment_detector.pkb

exit