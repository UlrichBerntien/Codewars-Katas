SELECT
    player_name,
    games,
    to_char(hits::float/at_bats,'FM0.000') AS batting_average
FROM yankees
WHERE at_bats >= 100
ORDER BY batting_average DESC;