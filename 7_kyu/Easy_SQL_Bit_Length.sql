SELECT
    id,
    bit_length(name) AS name,
    birthday,
    bit_length(race) AS race
FROM demographics;