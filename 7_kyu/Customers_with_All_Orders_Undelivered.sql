-- Table of customers with ALL orders UNDELIVERED. 
SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING bool_and(delivery_date IS NULL)
ORDER BY customer_id DESC;