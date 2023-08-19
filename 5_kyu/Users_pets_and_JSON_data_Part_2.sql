-- JSON in postgesql exercise.
WITH

-- Table of users and pets extracted from JSON data.
-- Only first letter of pet names are needed.
users_and_pets AS
    (SELECT
        id AS user_id,
        LEFT(jsonb_array_elements(info->'pets')->>'name',1) AS first_letter,
        info ->> 'name' AS user_name
    FROM users),

-- Count of pets with same first letter.
pets_count AS
    (SELECT
        first_letter,
        COUNT(*) AS pet_count
    FROM users_and_pets
    GROUP BY first_letter
    ORDER BY first_letter),

-- Users distinct of pets with first letter.
pets_users AS
    (SELECT DISTINCT
        first_letter,
        user_id,
        user_name
    FROM users_and_pets
    ORDER BY first_letter)

-- Count of pets with same first letter in name and thier users.
SELECT
    first_letter,
    MAX(pet_count) AS pet_count, -- there is only one pet_count per first_letter by construction.
    STRING_AGG(user_name, ', ' ORDER BY user_id) AS user_names
FROM pets_count
JOIN pets_users USING(FIRST_LETTER)
GROUP BY first_letter
ORDER BY pet_count DESC, first_letter ASC;
