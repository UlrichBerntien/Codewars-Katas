local kata = {}

function kata.reverse_seq(n)
  list = {}
  for i = 1,n do
    list[i] = n+1-i
  end
  return list
end

return kata