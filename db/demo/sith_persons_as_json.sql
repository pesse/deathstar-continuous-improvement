/**
  SQL provides a very easy way to create valid JSON from relational data structures.
  This example uses the Oracle extensions, but there are similar extensions in some other RDBMS, too
 */

select
  json_serialize(
    json_arrayagg(
      json_object(
        id,
        name,
        alive
      )
    )
    pretty
  )
from sith_persons;
