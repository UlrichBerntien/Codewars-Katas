local solution = {}

-- Sums all numbers in array a.
function solution.sum_array(a)
  local sum = 0
  for _,x in ipairs(a) do
    sum = sum + x
  end
  return sum
end

return solution