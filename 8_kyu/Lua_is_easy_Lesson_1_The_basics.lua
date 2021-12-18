kata = {}

function kata.firstLua(a,b,c)
  result = a .. ' ' .. a*b
  if b >= c then
    result = result .. ' Lua'
  else
    result = result .. ' Codewars'
  end
  return result
end

return kata