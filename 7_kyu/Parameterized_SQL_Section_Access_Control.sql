-- Table of all items where $1 is in the user access list.
-- The user access list is a string "id1,id2,..." with number id1, id2, ...
PREPARE find_sections(int) AS
(SELECT
    id,
    section_name
FROM section_access
-- The ID could be at start, in the middle or at the end.
 -- Hence None or "," is before or behind the ID number.
WHERE user_access SIMILAR TO '(%,|)'||$1||'(,%|)'
ORDER BY id);
