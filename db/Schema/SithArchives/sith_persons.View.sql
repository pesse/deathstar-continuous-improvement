create or replace view sith_persons as
  select
    id,
    name,
    alive
    from sith_characters_t;