local solution = {}

-- Returns the reversed array.
-- Argument:
--    Array (table) of items, will by unchanged.
-- Return:
--    Copy of the array in reversed order.
function solution.reverse(array)
  local reversed = {}
  for _,it in ipairs(array) do
    table.insert(reversed,1,it)
  end
  return reversed
end

return solution
