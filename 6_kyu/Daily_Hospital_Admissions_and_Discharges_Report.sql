-- Sum of daily admissions and discharges.
SELECT
    date::TEXT,
    joins,
    exits,
    net,
    SUM(net) OVER (ORDER BY date) AS cumulative_net
FROM
    (SELECT
        date,
        COALESCE(joins,0)::INT AS joins,
        COALESCE(exits,0)::INT AS exits,
        (COALESCE(joins,0)-COALESCE(exits,0))::INT AS net
    FROM
        (SELECT join_date::DATE AS date, COUNT(*) AS joins FROM admissions GROUP BY join_date::DATE) as j
    FULL JOIN
        (SELECT exit_date::DATE AS date, COUNT(*) AS exits FROM exits GROUP BY exit_date::DATE) as x
        USING (date)
    ) AS jx
ORDER BY
    date;
