altcap = {}

function altcap.capitalize(str)
  local accu = {'',''}
  for i = 1,#str do
    local c = str:sub(i,i)
    local l = i%2+1
    local u = 3-l
    accu[u] = accu[u] .. c:upper()
    accu[l] = accu[l] .. c:lower()
  end
  return accu
end

return altcap