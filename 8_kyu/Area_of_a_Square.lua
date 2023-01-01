function squareArea(A)
  local area = (2*A/math.pi)^2
  -- Round with two decimal digits
  return math.floor(100*area+0.5)/100
end

return squareArea