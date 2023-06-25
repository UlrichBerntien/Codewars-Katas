-- Generate table
--    res = maximal multiple of 'divisor' less or equal 'bound'
--          divisor and bound are the columns of max_multiple.
SELECT
  (bound::Integer/divisor::Integer) * divisor AS res
FROM max_multiple;
