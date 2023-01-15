local RANGE = string.byte("z") - string.byte("a") + 1
local OFFSET = string.byte("a") - 1

-- Alphabetic addition with overflow.
-- a = 1, b = 2, ... z, only lower case letters.
-- There is no value 0. So the overflow is z+a=a.
-- Argument is a table of strings (not a single string).
-- Returns a string "a" ... "z".
return function(letters)
  if type(letters) ~= "table" or #letters == 0 then
    return "z"
  end
  local sum = 0
  for i = 1,#letters do
    sum = sum + string.byte(letters[i]) - OFFSET
    if sum > RANGE then
      sum = sum - RANGE
    end
  end
  return string.char(sum+OFFSET)
end
