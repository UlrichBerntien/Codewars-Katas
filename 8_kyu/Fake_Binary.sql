-- Generates table:
--    x = input string
--    res = string x with all decimal digits replaced by 0 if less then 5 or else by 1.
SELECT
  x,
  translate(x,'123456789','000011111') AS res
FROM fakebin;
