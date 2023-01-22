local solution = {}

-- Filters an array of string by substring match.
-- Arguments:
--    input - Array of string to filter.
--    filter - Array of strings used as filter.
-- Returns:
--    Array of string, sorted unique.
--    Strings passed the filters which are substrings of a string in the filter array.
-- LIMITATION: input string does not contain \0 character.
function solution.inArray(input, filter)
  -- Concat all filter strings to reduce the find function calls.
  -- Use char 0 to separate the strings, it is never by a part of an input string.
  local filterString = table.concat(filter,string.char(0))
  -- Sort the input string to filter out doubled strings
  local inputSorted = input
  table.sort(inputSorted)
  local accu = {}
  for i,s in ipairs(inputSorted) do
    if (i == 1 or inputSorted[i-1] ~= s) and filterString:find(s,1,true) then
      table.insert(accu,s)
    end
  end
  return accu
end
  
return solution
