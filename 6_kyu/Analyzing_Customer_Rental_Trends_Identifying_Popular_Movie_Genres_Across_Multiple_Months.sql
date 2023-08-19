WITH

-- Group of all customers which rent a film in each month May, June and July 2005.
customer_group AS
    (SELECT customer_id
    FROM rental
    WHERE rental_date BETWEEN TIMESTAMP '2005-05-01' AND TIMESTAMP '2005-07-31 24:00'
    GROUP BY customer_id
    HAVING COUNT(DISTINCT DATE_PART('MONTH',rental_date)) = 3)

-- The top 5 categories of the customer group. 
SELECT
    cat.name AS genre,
    COUNT(rent.rental_id) AS total_rentals
FROM customer_group
JOIN rental AS rent USING (customer_id)
JOIN inventory USING (inventory_id)
JOIN film_category USING (film_id)
JOIN category AS cat USING (category_id)
GROUP BY cat.category_id
ORDER BY total_rentals DESC, genre ASC
LIMIT 5;
