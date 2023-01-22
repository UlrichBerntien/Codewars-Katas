-- Generates list of numbers i in range 1..n with
-- and last bit of i is 1
return function(n)
  local accu = {}
  for i = 1,n,2 do
    table.insert(accu,i)
  end
  return accu
end
