local solution = {}

-- Lookup table to speed up the bit counting.
-- Number of 1 bits in the numbers 0..2^4-1.
solution.bitcount = {
  [0]=0, [1]=1, [2]=1, [3]=2, [4]=1, [5]=2, [6]=2, [7]=3,
  [8]=1, [9]=2, [10]=2, [11]=3, [12]=2, [13]=3, [14]=3, [15]=4
}

-- Count 1 bits in number n.
function solution.hamming_weight(n)
  local count = 0
  -- Process the number in 4 bit blocks
  while n > 0 do
    count = count + solution.bitcount[n % 16]
    n = n // 16
  end
  return count
end

return solution
