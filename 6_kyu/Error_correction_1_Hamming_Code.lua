local codewars = {}

-- Strings for bit 0 and bit 1
local ZERO = "000"
local ONE = "111"

-- Translate strings of triple-bit into bit value.
local TRIPLE2BIT = {
  ["000"]=0,["001"]=0,["010"]=0,["011"]=1,
  ["100"]=0,["101"]=1,["110"]=1,["111"]=1,
}

-- Converts text into Hamming bit sequence.
function codewars.encode(text)
  text = tostring(text)
  local bits = ""
  for i = 1,#text do
    local value = text:sub(i,i):byte()
    local byte = ""
    for b = 1,8 do
      if value % 2 == 1 then
        byte = ONE .. byte
      else
        byte = ZERO .. byte
      end
      value = value // 2
    end
    bits = bits .. byte
  end
  return bits
end

-- Converts Hamming bit sequence into string.
function codewars.decode(bits)
  local text = ""
  local byte = 0
  local bit = 0
  for triple in bits:gmatch("...") do
    local value = TRIPLE2BIT[triple]
    if value then
      byte = byte * 2 + value
      bit = bit + 1
      if bit == 8 then
        text = text .. string.char(byte)
        bit = 0
        byte = 0
      end
    end
    -- else: ignore an invalid text part
  end
  return text
end

return codewars
