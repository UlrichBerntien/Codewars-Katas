-- Tests vector (x1,y1) is collinear to vector (x2,y2).
-- Test ignores small difference to the collinearity.
-- Returns true if vectors are collinear.
local function collinearity(x1, y1, x2, y2)
  return math.abs(x1*y2 - y1*x2) < 1
end

return collinearity