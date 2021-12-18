WITH
    summary AS
        (SELECT
            customer_id,
            count(*) payments_count,
            sum(amount)::float AS total_amount
        FROM payment
        GROUP BY customer_id)
SELECT
    st.*,
    ct.email
FROM summary as st
RIGHT JOIN customer as ct ON ct.customer_id = st.customer_id
ORDER BY total_amount DESC
LIMIT 10;