local solution = {}

-- Checks if all characters in string s are unique.
-- Returns true of and only if all characters in s are unique.
-- Compares case sensetive, e.g. string "aA" is unique.
function solution.has_unique_chars(s)
  assert( type(s) == "string", "argument must be a string")
  local seen = {}
  for i = 1,#s do
    local c = s:sub(i,i)
    if seen[c] then
      return false
    else
      seen[c] = true
    end
  end
  return true
end

return solution