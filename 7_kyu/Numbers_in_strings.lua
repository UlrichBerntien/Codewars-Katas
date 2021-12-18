numstr = {}
function numstr.solve(s)
  local max = 0
  for str in string.gmatch(s,'%d+') do
    local number = math.tointeger(str)
    if number > max then max = number end
  end
  return max
end
return numstr