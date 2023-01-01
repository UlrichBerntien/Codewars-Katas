local solution = {}

-- Add two decimal numbers stored in strings.
-- Returns a string with the decimal number.
-- LIMITATION: Does not support negative numbers.
function solution.sumstrings(a, b)
  local lena = #a
  local lenb = #b
  local r = ""
  local lenr = math.max(#a,#b)+1 -- maximal length of the result
  local carry = 0
  local byte0 = string.byte("0")
  -- add the numbers
  for i = 1,lenr do
    local valuea = a:byte(-i) or byte0
    local valueb = b:byte(-i) or byte0
    local sum = carry + valuea - byte0 + valueb - byte0
    r = string.char(byte0 + sum%10) .. r
    carry = (sum - sum%10)/10
  end
  -- strip leading zeros
  while #r > 1 and r:sub(1,1) == "0" do
    r = r:sub(2)
  end
  return r
end

return solution