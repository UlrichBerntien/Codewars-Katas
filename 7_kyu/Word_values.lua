wordvalues = {}

-- Returns value of a word.
-- The value of a word is the sum of all lower case letter values.
-- a=1, b=2, ...
-- Limitation: NEEDS a character with all lower case letters in a sequence, e.g. ASCII.
function wordvalues.value(word)
  local sum = 0
  local a_offset = string.byte("a")-1
  for i=1,#word do
    local c = word:sub(i,i)
    if 'a' <= c and c <= 'z' then
      sum = sum + c:byte() - a_offset
    -- else: ignores all not lower case letters.
    end
  end
  return sum
end

-- Converts array of words into array if numbers.
-- Limitation: NEEDS a character with all lower case letters in a sequence, e.g. ASCII.
-- Argument:
--    arr - Array (table) of strings.
-- Returns:
--    Array (table) of numbers, earch item has the value index * wordvalue(arr[index])
function wordvalues.wordValues(arr)
  local accu = {}
  for i,word in ipairs(arr) do
    accu[i] = i * wordvalues.value(word)
  end
  return accu
end

return wordvalues
