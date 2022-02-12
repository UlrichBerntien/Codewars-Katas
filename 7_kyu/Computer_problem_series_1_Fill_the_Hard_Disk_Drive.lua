kata = {}

function kata.save(sizes, hd)
  local sum = 0
  for index = 1, #sizes do
    sum = sum + sizes[index]
    if sum > hd then
      return index - 1
    end
  end
  return #sizes
end

return kata