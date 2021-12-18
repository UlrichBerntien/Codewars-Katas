SELECT
    substring(name, '^(.+)\s\S+\s\S+$' ) AS name,
    substring(name, '(\S+)\s\S+$' ) AS first_lastname,
    substring(name, '(\S+)$' ) AS second_lastname
FROM
    people;