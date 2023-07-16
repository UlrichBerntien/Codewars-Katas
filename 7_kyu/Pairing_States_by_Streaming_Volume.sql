-- Selects pairs with total_streams value is nearly the same (less 1000 difference).
SELECT
  a.state AS state_a,
  b.state AS state_b,
  abs(a.total_streams-b.total_streams) AS difference
FROM state_streams AS a
INNER JOIN state_streams AS b
        ON abs(a.total_streams-b.total_streams) < 1000
       AND a.state < b.state 
ORDER BY state_a, state_b;
