local kata = {}

function kata._if(condition, trueCase, falseCase)
  if condition then
    return trueCase()
  else
    return falseCase()
  end
end

return kata