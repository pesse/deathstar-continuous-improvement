/**
  SQL provides a very easy way to create valid XML from relational data structures.
  This example uses the Oracle extensions, but there are similar extensions in most other RDBMS, too
 */

select
  xmlserialize( document
    xmlelement( "SITH_PERSONS",
      xmlagg(
        xmlelement("SITH",
          xmlforest(id, name, alive)
        )
      )
    )
    as clob indent size = 2 )
from sith_persons;
