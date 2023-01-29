local solution = {}

-- Returns number of trailing zeros in n!.
function solution.zeros(n)
  -- The prime factors 2 and 5 results in one tailing zero 0.
  local count = 0
  while n >= 5 do
    count = count + n // 5
    n = n // 5
  end
  return count
end

return solution
