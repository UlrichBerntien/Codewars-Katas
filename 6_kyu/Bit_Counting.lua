local sol = {}

-- Hash the bit count for b0000 - b1111.
-- Index is n, Value is the number of 1 bits in n.
local bitcount = {
  [0]=0,  [1]=1,  [2]=1,  [3]=2,
  [4]=1,  [5]=2,  [6]=2,  [7]=3,
  [8]=1,  [9]=2,  [10]=2, [11]=3,
  [12]=2, [13]=3, [14]=3, [15]=4}

-- Returns number of bit 1 in the binary number n.
function sol.count_bits(n)
  local sum = 0
  while n > 0 do
    sum = sum + bitcount[n&15]
    n = n >> 4
  end
  return sum
end

return sol
