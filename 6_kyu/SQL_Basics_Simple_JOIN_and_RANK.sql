WITH
    count_table AS
    (SELECT
        pt.*,
        count(st.id) AS sale_count
    FROM people AS pt
    JOIN sales AS st ON st.people_id = pt.id
    GROUP BY pt.id
    )
SELECT
    *,
    rank() OVER (ORDER BY sale_count) AS sale_rank
FROM count_table
ORDER By sale_count;