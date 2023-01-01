local solution = {}

-- Generate table with number step, 2*step, 3*step, ... <= limit.
function solution.find_multiples(step, limit)
  local result = {}
  for i = step, limit, step do
    table.insert(result,i)
  end
  return result
end

return solution
