local solution = {}

function solution.wave(str)
  local lowstr = str:lower()
  local upstr = str:upper()
  local accu = {}
  for i = 1,#str do
    local u = upstr:sub(i,i)
    local l = lowstr:sub(i,i)
    if u ~= l then
      table.insert(accu, lowstr:sub(1,i-1)..u..lowstr:sub(i+1))
    end
  end
  return accu
end

return solution