WITH

-- Timestamp of the last hour start.
-- Value fixed in this CTE for the following queries.
last_hour AS
(
    SELECT NOW() - INTERVAL '1 hour' AS t)

-- Percentage of errors in the last hour.
-- NULL if no errors in the last hour.
SELECT
    CASE WHEN orders.count > 0 THEN ROUND(errors.count::NUMERIC*100/orders.count,2) END AS error_percentage
FROM
-- Count of orders in the last hour.
(
    SELECT COUNT(id) AS count
    FROM order_processing
    WHERE order_time > (SELECT t FROM last_hour)) AS orders,
-- Count of errors in the last hour.
(
    SELECT COUNT(id) AS count
    FROM order_errors
    WHERE order_time > (SELECT t FROM last_hour)) AS errors;
