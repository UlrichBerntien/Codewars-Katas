local solution = {}

-- ASCII code of a
local codea = string.byte("a")

-- Ecodes the string.
-- LIMITATION: Workd with charset like ASCII
function solution.decode(s)
  assert(type(s)=="string", "argument must be a string")
  local number, encoded = s:match("(%d+)(.*)")
  number = tonumber(number) % 26
  -- create decode table
  local decode_table = {}
  for i = 0,25 do
    local i_encoded = (i*number) % 26
    if decode_table[i_encoded] then
      return "Impossible to decode"  
    end
    decode_table[i_encoded] = string.char(codea+i)
  end
  -- decode message
  local decoded = ""
  for i = 1,#encoded do
    decoded = decoded .. decode_table[encoded:sub(i,i):byte()-codea]
  end
  return decoded
end

return solution
