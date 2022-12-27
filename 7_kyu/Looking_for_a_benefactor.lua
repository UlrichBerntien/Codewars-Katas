local solution = {}

-- Sum all values in the arr.
function solution.sum(arr)
  local accu = 0
  for _,x in ipairs(arr) do
    accu = accu + x
  end
  return accu
end

-- Returns x that arithmetic mean of arr and x = navg.
-- Returns x rounded to an integer value.
-- Returns -1 if a negative value is needed.
function solution.newAvg(arr, navg)
  local missing = navg * (1+#arr) - solution.sum(arr)
  missing = math.floor(missing+0.5)
  missing = math.max(-1,missing)
  return missing
end

return solution
