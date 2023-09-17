WITH

-- Rabates with purchase intervalls min..max.
-- One max value is NULL: the upper most interval has only a lower limit.
rabates_min_max AS
    (SELECT
        min_purchase,
        max_purchase,
        rebate_percentage
    FROM
        (SELECT
            min_purchase,
            LEAD(min_purchase) OVER (ORDER BY min_purchase)-1 max_purchase,
            rebate_percentage
        FROM rebates) AS r
    WHERE min_purchase < max_purchase OR max_purchase IS NULL -- ensures no empty interval
    ORDER BY min_purchase)

-- Customers with rebates in September 2023
SELECT
    customer_id,
    total_orders,
    rebate_percentage
FROM
    (SELECT
        customer_id,
        SUM(order_amount) AS total_orders
    FROM orders
    WHERE order_date BETWEEN DATE '2023-09-01' AND DATE '2023-09-30'
    GROUP BY customer_id) AS c
JOIN rabates_min_max ON min_purchase <= total_orders AND COALESCE(total_orders <= max_purchase,TRUE)
ORDER BY customer_id DESC;
