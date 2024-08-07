-- Select last part of the title.
-- Parts in the title are separated by '+' signs.
SELECT
    title,
    substring(title,'\+([^+]+)$') AS last_part
FROM
    split_titles
ORDER BY
    id DESC;