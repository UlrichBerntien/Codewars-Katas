local kata = {}

function kata._if(bool, func1, func2)
  if bool then
    return func1()
  else
    return func2()
  end
end

return kata