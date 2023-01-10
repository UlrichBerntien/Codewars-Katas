local solution = {}

-- Splits space separated words into words and calculate length.
-- Argument:
--    words - space separated word
-- Return:
--    array of {word,#word} items
function solution.split(words)
  local accu = {}
  for word in words:gmatch("[^%s]+") do
    table.insert(accu, {word,#word})
  end
  return accu
end

-- Joins array of {word,#word} into a string.
-- Separates words by one space and set the words in up/down case.
-- With special_end == true: last word upper case and space before or behind the last word.
function solution.upDownJoin(wordLengthArray,special_end)
  local accu = ""
  for i,wl in ipairs(wordLengthArray) do
    if special_end and i == #wordLengthArray then
      accu = accu .. string.rep(" ",i % 2) .. wl[1]:upper() .. string.rep(" ",2-(i % 2))
    elseif i % 2 == 0 then
      accu = accu .. wl[1]:upper() .. " "
    else
      accu = accu .. wl[1]:lower() .. " "
    end
  end
  return accu:sub(1,-2)
end

-- Bubble sort like.
-- Sorts the array to keep a length up, length down sequence of words.
function solution.upDownSort(wordLengthArray)
  local ok = false
  while ok == false do
    ok = true
    for i = 1,#wordLengthArray-1 do
      local swap
      if i % 2 == 0 then
        swap = wordLengthArray[i][2] < wordLengthArray[i+1][2]
      else
        swap = wordLengthArray[i][2] > wordLengthArray[i+1][2]
      end
      if swap == true then
        wordLengthArray[i], wordLengthArray[i+1] = wordLengthArray[i+1], wordLengthArray[i]
        ok = false
      end
    end
  end
  return wordLengthArray
end

-- Reorder the words in strng.
-- Word length must go up and down.
-- Word case must be lower UPPER..
function solution.arrange(strng)
  local special_end = strng:sub(-1,-1) == " "
  local wordLengthArray = solution.split(strng)
  solution.upDownSort(wordLengthArray)
  return solution.upDownJoin(wordLengthArray,special_end)
end

return solution
