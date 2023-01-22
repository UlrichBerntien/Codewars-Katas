local solution = {}

-- Length of eac hstring in strarr.
-- Returns array of string lengths.
local function lengthOfStrings(strarr)
  local accu = {}
  for i,s in ipairs(strarr) do
    accu[i] = #s
  end
  return accu
end

-- Sum numbers in index range first..last
local function subSum(numbers,first,last)
  local accu = 0
  for i=first,last do
    accu = accu + numbers[i]
  end
  return accu
end

-- Concat strings in index range first..last
local function subConcat(strings,first,last)
  local accu = ""
  for i = first,last do
    accu = accu .. strings[i]
  end
  return accu
end

-- Finds longest set of consecutive strings.
-- Argruments:
--    strarr - Array of strings
--    k - Number of strings in the subset
-- Returns:
--    Concated of the longest consecutive subset.
function solution.longestConsec(strarr, k)
  if type(k) ~= "number" or k <= 0 then
    -- invalid argument k
    return ""
  end
  if type(strarr) ~= "table" or #strarr < k then
    -- invalid type or to short 
    return ""
  end
  local lenarr = lengthOfStrings(strarr)
  local sum = subSum(lenarr,1,k)
  -- Search maximal concated length of k strings
  local maxi = 1
  local maxsum = sum
  for i = 1,#lenarr-k do
    -- now sum length string at (i+1) ... (i+k)
    sum = sum - lenarr[i] + lenarr[i+k]
    if sum > maxsum then
      maxsum = sum
      maxi = i+1
    end
  end
  return subConcat(strarr,maxi,maxi-1+k)
end

return solution
