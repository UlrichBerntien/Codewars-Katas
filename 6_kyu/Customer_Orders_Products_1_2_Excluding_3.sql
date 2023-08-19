WITH

-- Order counts per customer and product.
order_counts AS
    (SELECT
        customer_id,
        product_name,
        COUNT(*) order_count
    FROM orders
    GROUP BY customer_id, product_name),

-- Order counts per customer in array per product.
order_count_arrays AS
    (SELECT
        customer_id,
        ARRAY_AGG(product_name ORDER BY product_name) AS product_names,
        ARRAY_AGG(order_count ORDER BY product_name) order_count
    FROM order_counts
    GROUP BY customer_id)

-- Customers ordered exact 'Product 1' and 'Product 2' (not more not less),
-- with number of orders for each product in the product summary field.
SELECT
    customer_id,
    name,
    product_names[1]||': '||order_count[1]||' times || '||
      product_names[2]||': '||order_count[2]||' times'
      AS product_summary
FROM order_count_arrays
JOIN customers USING (customer_id)
WHERE ARRAY['Product 1','Product 2'] = product_names
ORDER BY customer_id DESC;
