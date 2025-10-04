-- Returns list with all non-negative numbers.
-- Eg. the returned list does not contain strings, booleans, negative numbers
local function filter_list(l)
  local accu = {}
  for i,x in pairs(l) do
    if type(x) == "number" and x >= 0 then
      table.insert(accu,x)
    end
  end
  return accu
end

return filter_list