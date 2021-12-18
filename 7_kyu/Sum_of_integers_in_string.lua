kata = {}
function kata.sumOfIntegersInString(s)
  local accu = 0
  for str in s:gmatch('%d+') do
    accu = accu + math.tointeger(str)
  end
  return accu
end

return kata