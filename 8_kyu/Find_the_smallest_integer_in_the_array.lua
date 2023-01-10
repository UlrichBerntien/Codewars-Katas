-- Functions returns the minimum of the items in the table t.
return function(t)
  if not t or #t == 0 then
    return
  end;
  local minimum = t[1]
  for i =1,#t do
    if t[i] < minimum then
      minimum = t[i]
    end
  end
  return minimum
end