local solution = {}

-- Counts the letters in the inp string.
-- Returns a table ordered by the first occurence of each char in the input.
-- Each item in the table has the format {character,count}.
function solution.ordered_count(inp)
  -- Count the characters in the set count, key is the character, value is the count
  local count = {}
  -- prepare an array sorted by the first occurence of a character in the input
  local ordered = {}
  -- Count the letters
  for i = 1,#inp do
    local c = inp:sub(i, i)
    if count[c] then
      count[c] = count[c] + 1
    else
      count[c] = 1
      table.insert(ordered, {c,0})
    end
  end
  -- Copy the counts into the ordered array
  for i = 1,#ordered do
    ordered[i][2] = count[ordered[i][1]]
  end
  return ordered
end

return solution
