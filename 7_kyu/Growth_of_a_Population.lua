local kata = {}

function kata.nbYear(p0, percent, aug, p)
  local f = 1+percent/100
  local year = 0
  while p0 < p do
    year = year + 1
    p0 = p0*f + aug
  end
  return year
end

return kata