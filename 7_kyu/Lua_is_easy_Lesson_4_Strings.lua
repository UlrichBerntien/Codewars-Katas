kata = {}

-- Checks if argument is a palindrome
function isPalindrome(str)
  str = str:lower()
  return str == str:reverse()
end

-- Converts into alternated lower/upper case
function alternatedCase(str)
  local accu = ''
  for i = 1,#str do
    local c = str:sub(i,i)
    if i%2 == 0 then
      accu = accu .. c:upper()
    else
      accu = accu .. c:lower()
    end
  end
  return accu
end

-- Counts number of vowels
function numberVowels(str)
  local count = 0
  for _ in str:gmatch('[AEIOUaeiou]') do
    count = count + 1
  end
  return count
end

-- Length of all strings
function len(...)
  local sum = 0
  for _,str in ipairs({...}) do
    sum = sum + #str
  end
  return sum
end

function kata.solve(a, b, c)
  local results = { tostring(isPalindrome(a)), alternatedCase(b), numberVowels(c), len(a,b,c) }
  return table.concat( results, ' ' )
end

return kata