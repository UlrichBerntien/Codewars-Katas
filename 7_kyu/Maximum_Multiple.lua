kata = {}

-- Calculates maximal x with x is multipe of divisor and maximal bound.
function kata.maxMultiple(divisor, bound)
  return (bound//divisor)*divisor
end

return kata
