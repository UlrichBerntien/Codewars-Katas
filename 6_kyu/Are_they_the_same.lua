local solution = {}

-- Checks if the table b contains all number of table a squared.
-- The order of the items could be different.
function solution.comp(a, b)
  if type(a) ~= 'table' or type(b) ~= 'table' or #a ~= #b then
    return false
  end
  table.sort(a, function(x1,x2) return math.abs(x1)<math.abs(x2) end)
  table.sort(b)
  for i = 1,#a do
    if a[i]^2 ~= b[i] then
      return false
    end
  end
  return true
end

return solution
