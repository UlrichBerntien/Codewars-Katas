-- Sum of internal angles in an n-sided polygon.
-- Returns the angle sum in degrees.
return function(n)
  -- Return 0 on invalid n
  n = math. max(2,n)
  return 180 * (n-2)
end
