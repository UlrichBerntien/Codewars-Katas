local solution = {}

-- Reverses or rotates string s.
-- Reverses the string if the sum of all digits square is even.
local function revRot(s)
  local sum = 0
  for i = 1,#s do
    -- x is even if and only x² is even.
    -- digit value of x is even if ASCII value of x is even.
    sum = (sum + s:sub(i,i):byte()) % 2
  end
  if sum == 0 then
    return s:reverse()
  else
    return s:sub(2) .. s:sub(1,1)
  end
end

-- Splits string s into chunks of chunkSize length, reverse or rotates the chunks.
function solution.revRot(s, chunkSize)
  if #s < chunkSize or chunkSize < 1 then
    return ""
  end
  local result = ""
  for start = 1,chunkSize*(#s//chunkSize),chunkSize do
    local chunk = s:sub(start,start+chunkSize-1)
    result = result .. revRot(chunk)
  end
  return result
end
  
return solution
