alter table sith_characters_t
  modify prename not null
  modify surname not null;

alter table sith_characters_t
  add constraint sith_characters_uq_pre_surname
    unique (prename, surname);