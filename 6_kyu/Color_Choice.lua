local solution = {}

-- Calculates x so than n over x == m.
-- Returns the smaller x if more then one solution exists.
-- Returns -1 if no solution exists.
function solution.checkChoose(m, n)
  -- handle invalid argument
  m = tonumber(m)
  n = tonumber(n)
  assert(m>0 and math.floor(m)==m,"argument #1 must be positive integer")
  assert(n>0 and math.floor(n)==n,"argument #2 must be positive integer")
  -- calculate binomial coeffizent over = n over x
  -- https://en.wikipedia.org/wiki/Binomial_coefficient
  local x = 0
  local over = 1
  -- handle floating point errors by "0.5" limit
  while over+0.5 < m and x < n do
    x = x + 1
    -- it is (n over x)=(n over x-1) * (n-x+1)/x
    over = over * ((n-x+1)/x)
  end
  if math.abs(m-over) < 0.5 then
    return x
  else
    -- no solution found, -1 indicates an error
    return -1
  end
end

return solution
