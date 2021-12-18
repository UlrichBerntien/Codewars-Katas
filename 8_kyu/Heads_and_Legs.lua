local kata = {}

function kata.animals(heads, legs)
  -- It is:
  -- heads = cows + chickens
  -- legs = 4*cows + 2*chickens
  -- solve this system of 2 linear equations
  local cows = legs/2 - heads
  local chickens = 2*heads - legs/2
  if cows < 0 or chickens < 0 or legs%2 ~= 0 then
    return 'No solutions'
  else
    return { chickens, cows }
  end
end

return kata