local t = {}

-- Searchs the two oldest (greatest) ages in the array.
function t.twoOldestAges(ages)
  assert(#ages >= 2, "argument must be array of at least 2 numbers")
  local old, old2 = ages[1], ages[2]
  if old < old2 then
    old, old2 = old2, old
  end
  for i = 3,#ages do
    if ages[i] > old2 then
      if ages[i] > old then
        old, old2 = ages[i], old
      else
        old2 = ages[i]
      end
    end
  end
  return {old2,old}
end

return t
