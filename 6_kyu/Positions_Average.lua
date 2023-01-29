local solution = {}

-- Calculates average string character match.
-- Argument
--    List of string stored in one string seprated by comma and/or spaces.
--    e.g. "string1, string2, string3"
-- Return
--    Percetange of equal characters at the same position in all possible string compares
--    e.g. 85.7142857143
function solution.posAverage(s)
  assert(type(s)=="string","argument must be a string")
  -- split into substrings, allows comma and spaces as separators
  local substring = {}
  for sub in s:gmatch("[^%s,]+") do
    table.insert(substring, sub)
  end
  local n = #substring
  if n < 2 then
    -- no substrings to compare
    return 0
  end
  -- length of each substring:
  local len = #substring[1]
  -- count the same characters at same position, compared between all strings
  local count = 0
  for pos = 1,len do
    for i = 1,n do
      local ci = substring[i]:sub(pos,pos)
      for j = i+1,n do
        if ci == substring[j]:sub(pos,pos) then
          count = count + 1
        end
      end
    end
  end
  -- return percentage of maximal possible count
  return 100 * count / (len*n*(n-1)/2)
end

return solution
