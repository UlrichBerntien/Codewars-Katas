local solution = {}

-- Check ISBN-10 code.
-- Argument: A ISBN-10 code as string.
-- Return true if the ISBN-10 code is valid.
function solution.valid_ISBN10(isbn)
  -- ISBN must be a string of length 10
  if type(isbn) ~= "string" or #isbn ~= 10 then
    return false
  end
  -- checksum validation
  local offset = string.byte("0")
  local sum = 0
  for i = 1,10 do
    local c = isbn:sub(i,i)
    if "0" <= c and c <= "9" then
      sum = sum + i*(c:byte()-offset)
    elseif c == "X" and i == 10 then
      -- only last character can be an "X"
      sum = sum + 10*10
    else
      return false
    end
    sum = sum % 11
  end
  return sum == 0
end

return solution
