-- Table of all books by genre. 
SELECT
    genre,
    COUNT(*) AS count,
    ARRAY_AGG(bo.title ORDER BY bo.title) AS books
FROM
    (SELECT DISTINCT
        UNNEST(genres) AS genre
    FROM books) as ge
JOIN books AS bo ON ge.genre = ANY(bo.genres)
GROUP BY genre
ORDER BY count DESC, genre ASC;
