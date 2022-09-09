-- Input: table 'ntheven' with column 'n'
-- Output: table with column 'n' and column 'res' == n-th even number.
SELECT n, (n-1)*2 AS res FROM ntheven;
