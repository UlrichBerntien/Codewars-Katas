kata = {}

-- Add matrix a and matrix b. 
function kata.matrixAddition(a, b)
  assert(#a==#b, "matrix sizes must be equal")
  local sum = {}
  for i = 1,#a do
    local row = {}
    local rowa = a[i]
    local rowb = b[i]
    assert(#rowa==#rowb, "matrix sizes must be equal")
    for j = 1,#rowa do
      row[j] = rowa[j] + rowb[j]
    end
    sum[i] = row
  end
  return sum
end

return kata
