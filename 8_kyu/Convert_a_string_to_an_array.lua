kata = {}

-- Split s into words (alphanumeric sub-strings).
function kata.stringToArray(s)
  local accu = {}
  for word in s:gmatch("%w*") do
    table.insert(accu,word)
  end
  return accu
end

return kata
