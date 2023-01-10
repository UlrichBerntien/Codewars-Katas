local solution = {}

-- Returns mimium of array, format the string with "***" between all chars.
function solution.two_sort(array)
  -- handle missing argument
  if not array or #array == 0 then
    return ""
  end
  -- search minimum
  local minimum = array[1]
  for i = 2,#array do
    if minimum > array[i] then
      minimum = array[i]
    end
  end
  -- format result
  local result = minimum:gsub("(.)","%1***")
  return result:sub(1,-4)
end

return solution