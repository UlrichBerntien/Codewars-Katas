local solution = {}

-- Search longest consecutive repetition of a chacacter.
-- Argument:
--    test - String to scan
-- Return 
--    Object {character=x,length=x} with data of longest repetition.
function solution.longest_repetition(text)
  local last = ""
  local last_len = 0
  local c = ""
  local len = 0
  for i = 1,#text do
    local now = text:sub(i,i)
    if last == now then
      last_len = last_len + 1
    else
      if last_len > len then
        len = last_len
        c = last
      end
      last = now
      last_len = 1
    end
  end
  if last_len > len then
    len = last_len
    c = last
  end
  return {character=c,length=len}
end

return solution
