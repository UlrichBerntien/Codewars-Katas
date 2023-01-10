local solution = {}

-- Generates a hash-tag base on a sentence.
-- Concats all words in CamelCase format.
-- Returns false on empty string/none string/too long string.
function solution.generate_hashtag(s)
  if type(s) ~= 'string' or #s == 0 then
    return false
  end
  local hash = "#"
  local s_upper = s:upper()
  local s_lower = s:lower()
  local upperMode = true
  for i = 1,#s do
    local c = s_upper:sub(i,i)
    if "A" <= c and c <= "Z" then
      if upperMode == true then
        hash = hash .. c
        upperMode = false
      else
        hash = hash .. s_lower:sub(i,i)
      end
    else
      upperMode = true
    end
  end
  if #hash > 140 then
    return false
  end
  return hash
end

return solution
