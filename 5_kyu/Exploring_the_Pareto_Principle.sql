WITH

-- Count of all rentals
total_rentals_count AS
(SELECT
    COUNT(*)
FROM rental),

-- Sum of rentals of the top 20% of all customers
top_20_rental_count AS
(SELECT
    SUM(count)::INT as count
FROM
    (SELECT
        COUNT(*)
    FROM rental
    GROUP BY customer_id
    ORDER BY count DESC
    LIMIT ((SELECT COUNT(*) FROM customer)*20+40)/100)
    AS sub)

-- Table of
--    count rentals of top 20% of customers
--    count rentals of all customers
--    percentage of top 20%
SELECT
    (SELECT count FROM top_20_rental_count) AS "top_20%_rentals_count",
    (SELECT count FROM total_rentals_count) AS total_rentals_count,
    ROUND(100.0*(SELECT count FROM top_20_rental_count)/(SELECT count FROM total_rentals_count),2) AS "percentage_of_top_20%";
