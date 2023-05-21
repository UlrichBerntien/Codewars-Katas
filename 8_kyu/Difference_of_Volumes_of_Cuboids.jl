"Returns the difference between the volumes of a and b."
function finddifference(a::AbstractVector{<:Integer}, b::AbstractVector{<:Integer})::Int
  abs(prod(a) - prod(b))
end