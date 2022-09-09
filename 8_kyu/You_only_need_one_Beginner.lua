local solution = {}

-- Checks if item x is in the table a.
function solution.check(a, x)
  for _,item in pairs(a) do
    if item == x then
      return true
    end
  end
  return false
end

return solution