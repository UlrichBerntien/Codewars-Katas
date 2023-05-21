function countsheep(num::Integer)
  accu = ""
  for i = 1:num
    accu *= "$i sheep..."
  end
  accu
end