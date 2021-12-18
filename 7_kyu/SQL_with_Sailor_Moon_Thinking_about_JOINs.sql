SELECT
    sailorsenshi.senshi_name AS sailor_senshi,
    sailorsenshi.real_name_jpn real_name,
    cats.name cat,
    schools.school school
FROM
    sailorsenshi
LEFT JOIN
    cats ON cats.id = sailorsenshi.cat_id
LEFT JOIN
    schools ON schools.id = sailorsenshi.school_id;