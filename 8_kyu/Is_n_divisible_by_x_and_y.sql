-- IN: table 'kata' with columns 'n', 'x', and 'y'.
-- OUT: the 'id' and result in a column 'res'.
select id, n % x = 0 AND n % y = 0 AS res from kata;