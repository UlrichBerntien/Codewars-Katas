alphsymm = {}

-- Count the letter which are at same position as in alphabet.
local function countAlphabetPositions(s)
  s = s:lower()
  local offset = string.byte("a")-1
  local count = 0
  for i = 1,#s do
    if s:sub(i,i):byte() == offset+i then
      count = count + 1
    end
  end
  return count
end

-- Counts the letters which are at same position as in alphabet.
-- Argument
--    Array of strings to count out.
-- Return
--    Array of counts.
function alphsymm.solve(arr)
  local accu = {}
  for i = 1,#arr do
    accu[i] = countAlphabetPositions(arr[i])
  end
  return accu
end

return alphsymm
