-- Calculates the range of the numbers in the array.
-- Returns distance between maximal and minimal value.
local function sum_of_differences(arr)
  if #arr == 0 then
    return 0
  end
  min = arr[1]
  max = arr[1]
  for _,v in pairs(arr) do
    if max < v then
      max = v
    elseif min > v then
      min = v
    end
  end
  return max - min
end

return sum_of_differences
