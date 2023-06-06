module Kata
export thetaformula

"""
  Returns true if equation angle = arc/radius is fulfilled.
"""
function thetaformula(radius::Real, arc::Real, angle::Real)
  abs(angle*radius-arc) < 1e-4
end

"""
  Calculates the radius by the equation angle = arc/radius.
  Returns result rounded, returns the result only if the string is "?".
"""
function thetaformula(radius::String, arc::Real, angle::Real)
  if radius != "?"
    return
  end
  rd(arc / angle)
end

"""
  Calculates the arc by the equation angle = arc/radius.
  Returns result rounded, returns the result only if the string is "?".
"""
function thetaformula(radius::Real, arc::String, angle::Real)
  if arc != "?" 
    return
  end
  rd(angle * radius)
end

"""
  Calculates the angle by the equation angle = arc/radius.
  Returns result rounded, returns the result only if the string is "?".
"""
function thetaformula(radius::Real, arc::Real, angle::String)
  if angle != "?" 
    return
  end
  rd(arc/radius)
end

"""
  Returns nothing.
  The function catches all invalid argument types errors.
"""
function thetaformula(args...)
  nothing
end

"""
  Returns x rounded as the kata demands, 3 digits.
"""
rd(x::Real) = round(x,digits=3)

end#module
