local solution = {}

-- Sort table by area of geometric elements.
-- Elements in the table seq could be:
--    a number = radius of a circle
--    a table with 2 numbers = side lengths of a rectangle 
-- Returns a sorted list. (The seq argument remains unchanged).
function solution.sort_by_area(seq)
  -- Calculate the areas of the items
  local to_sort = {}
  for i,v in ipairs(seq) do
    local area = nil
    if type(v) == "number" then
      area = v * v * math.pi
    elseif type(v) == "table" and #v == 2 then
      area = v[1] * v[2]
    end
    if area ~= nil then
      table.insert(to_sort, {area,v})
    end
  end
  -- Sort table by area
  table.sort(to_sort, function(a,b) return a[1]<b[1] end )
  -- Prepare result as sorted list
  local result = {}
  for _,v in ipairs(to_sort) do
    table.insert(result, v[2])
  end
  return result
end

return solution
