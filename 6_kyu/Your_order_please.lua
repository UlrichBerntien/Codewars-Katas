-- Resort the words by the decimal number inside each word.
function order(words)
  local set = {}
  -- Split words into table indexed with the ID number.
  local byte0 = string.byte("0")
  for w in words:gmatch("%w+") do
    local id = tonumber(w:match("%d+"))
    if id then
      set[id] = w
    end
    -- else: ignore word without one ID number.
  end
  -- Build string sorted by ID number.
  return table.concat(set," ")
end