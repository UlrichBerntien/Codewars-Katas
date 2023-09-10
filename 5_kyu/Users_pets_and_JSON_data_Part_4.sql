WITH

-- Expand the needed data from JSON structure.
users_and_pets AS
(SELECT
    (info->'age')::INT as age,
    JSONB_PATH_QUERY(info, '$.pets[*]') ->> 'type' AS pet_type
FROM users),

-- Age groups for the statistic.
age_groups AS
(SELECT
    age_group, start_age, end_age
FROM (VALUES
    ('18-30', 18, 30),
    ('31-45', 31, 45),
    ('46-60', 46, 60),
    ('61 and above', 61, 999999))
    AS ag(age_group, start_age, end_age)
),

-- Pets counted in groups per user age
pets_grouped AS
(SELECT
    age_group,
    pet_type,
    COUNT(*) AS count
FROM age_groups
JOIN users_and_pets ON age BETWEEN start_age AND end_age
GROUP BY age_group, pet_type),

-- Maximal pet type count per user age.
max_pet_type_count AS
(SELECT
    age_group,
    MAX(count) AS count
FROM pets_grouped
GROUP BY age_group)

SELECT
    mp.age_group,
    ARRAY_AGG(pg.pet_type ORDER BY pg.pet_type) AS preferred_pet_type,
    MAX(mp.count) AS count
FROM max_pet_type_count AS mp
JOIN pets_grouped AS pg ON pg.age_group = mp.age_group AND pg.count = mp.count
GROUP BY mp.age_group
ORDER BY age_group ASC
;

