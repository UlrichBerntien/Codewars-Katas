WITH

sum_ratings AS
(SELECT
    content_id AS id,
    SUM(rating) AS total_rating
FROM votes
GROUP BY content_id),

count_visits AS
(SELECT
    content_id AS id,
    COUNT(*) AS total_visits
FROM visits
GROUP BY content_id)

SELECT
    id,
    COALESCE(total_rating,0) AS total_rating,
    COALESCE(total_visits,0) AS total_visits
FROM topics
LEFT JOIN sum_ratings USING(id)
LEFT JOIN count_visits USING(id)
ORDER  BY topics.id DESC;
