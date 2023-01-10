-- Generates array a, a+1, ... b.
local function between(a, b)
  local result = {}
  for i = a,b do
    table.insert(result, i)
  end
  return result
end

return between
