-- Returns pattern of charaters.
-- The parameter 1 is the number of rows.
-- Alternating stars (*) and decimal number, the number of stars before. 
PREPARE alternate_star_and_number(INT) AS
SELECT
  CASE
      WHEN i % 2 = 1
      THEN REPEAT('*',(i+1)/2)
      ELSE (i/2)::TEXT
  END AS pattern
FROM generate_series(1,$1) AS i;
