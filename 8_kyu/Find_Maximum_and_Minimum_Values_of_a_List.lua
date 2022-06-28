local solution = {}

-- Return minimum of values in arr.
-- Return nil if arr is empty.
function solution.min(arr)
  if arr == nil or #arr == 0 then
    return nil
  end
  min = arr[1]
  n = #arr
  for i = 1,n do
    if arr[i] < min then
      min = arr[i]
    end
  end
  return min
end

-- Return maximum of values in arr.
-- Return nil if arr is empty.
function solution.max(arr)
  if arr == nil or #arr == 0 then
    return nil
  end
  max = arr[1]
  n = #arr
  for i = 1,n do
    if arr[i] > max then
      max = arr[i]
    end
  end
  return max
end

return solution
