"""
  Calculates number of pages for n pages per m persons.
  Returns 0 if n or m is less then 0.
"""
function paperwork(n::T, m::T)::T where T<:Real
  n > 0 && m > 0 ? n*m : 0
end
