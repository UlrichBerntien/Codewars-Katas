SELECT
    id,
    name,
    substring(characteristics,'^([^,]*)') AS characteristic
FROM monsters
ORDER BY id;