WITH

-- Extract the needed values from the json structure.
-- Assumption: only one row per user "name".
users_extracted AS
(SELECT
    id,
    info->>'name' AS name,
    (info->'age')::INT AS age,
    jsonb_array_length(info->'pets') AS pet_count
FROM users),

-- Add the age groups for the adult users.
users_age_grouped AS
(SELECT
    id,
    name,
    pet_count,
    CASE
        WHEN age <= 30 THEN '18-30'
        WHEN age <= 45 THEN '31-45'
        WHEN age <= 60 THEN '46-60'
        ELSE '61 and above'
    END AS age_group
FROM users_extracted
WHERE age >= 18),

-- Calculate statistic values per age group. 
age_groups AS
(SELECT
    age_group,
    ROUND(AVG(pet_count),1) AS avg_pet_count,
    MAX(pet_count) AS max_pet_count
FROM users_age_grouped
GROUP BY age_group)

-- Table of age groups.
SELECT
    age_group,
    avg_pet_count,
    (SELECT name
     FROM users_age_grouped AS u
     WHERE u.age_group = ag.age_group AND u.pet_count = ag.max_pet_count
     ORDER BY id ASC
     LIMIT 1) AS max_pet_owner,
    max_pet_count
FROM age_groups AS ag
ORDER BY avg_pet_count DESC, age_group ASC;
