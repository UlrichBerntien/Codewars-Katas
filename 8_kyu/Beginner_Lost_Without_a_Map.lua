local solution = {}

-- Multiplies all array items by 2.
function solution.maps(a)
  local result = {}
  for _,v in ipairs(a) do
    table.insert(result,2*v)
  end
  return result
end

return solution
