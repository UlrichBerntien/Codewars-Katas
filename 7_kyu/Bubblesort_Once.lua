local solution = {}

-- One bubble sort step.
-- Argument
--    arr - array to sort, must be unchanged.
-- Return
--    copy of arr, sorted by one bubble sort pass.
function solution.bubblesort_once(arr)
  -- Returns empty array on invalid or empty argument
  if type(arr) ~= "table" or #arr == 0 then
    return {}
  end
  local result = {}
  local n = #arr
  -- 1.) Copy the smaller one of the source pairs
  -- Index numbers of the source pair:
  local sourceA, sourceB = 1, 2
  for dest = 1,n-1 do
    if arr[sourceA] <= arr[sourceB] then
      result[dest] = arr[sourceA]
      sourceA = math.max(sourceA,sourceB) + 1
    else
      result[dest] = arr[sourceB]
      sourceB = math.max(sourceA,sourceB) + 1
    end
  end
  -- 2.) Copy the remaining item of the source pair
  result[n] = arr[math.min(sourceA,sourceB)]
  return result
end

return solution
