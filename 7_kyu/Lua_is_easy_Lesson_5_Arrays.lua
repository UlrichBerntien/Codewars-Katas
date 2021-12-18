luaarrys = {}
function luaarrys.solve(arr)
  if #arr < 3 then
    return 0
  end
  local tops = { arr[1], arr[2] } -- array to hold the largest 2 elements
  table.sort(tops)
  for i = 3,#arr do
    local it = arr[i]
    if it > tops[2] then
      tops[1] = tops[2]
      tops[2] = it
    elseif it > tops[1] then
      tops[1] = it
    end
  end
  -- count the number of elements less than the 2-largest element
  local count = 0
  for i = 1, #arr do
    if arr[i] < tops[1] then count = count + 1 end
  end
  return count
end 
return luaarrys
