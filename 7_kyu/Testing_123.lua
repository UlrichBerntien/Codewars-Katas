-- Returns the strings lines numbered.
-- Argument:
--    Array (table) of string
-- Return:
--    Array (table) of string in the format "index: lines[index]"
--    Number of the string is printed as decimal number in front of the string.
function number(lines)
  local accu = {}
  for i,s in ipairs(lines) do
    table.insert(accu,tostring(i)..": "..s)
  end
  return accu
end

return number
