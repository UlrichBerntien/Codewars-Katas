local solution = {}

function solution.permute_a_palindrome(input)
  -- Check input
  assert(type(input)=="string", "Argument must be a string")
  -- Count number of each character in the string (case independent)
  input = input:lower()
  local letterCount = {}
  for i = 1,#input do
    local c = input:sub(i,i)
    letterCount[c] = (letterCount[c] or 0) + 1
  end
  -- Count number of character could not be on left and right side
  local notsymmetric = 0
  for _,count in pairs(letterCount) do
    notsymmetric = notsymmetric + count % 2
  end
  -- Only one unique letter in the middle of a even length string is possibe
  return notsymmetric == #input % 2
end

return solution
