"""
  Returns an array with the root of each item if the item is a perfect square, otherwise the item squared.
"""
function square_or_square_root(arr::Array{T})::Array{T} where T<:Real
  function s_or_r(x::T)::T
    r = sqrt(x)
    isinteger(r) ? T(r) : x^2
  end
  map(s_or_r, arr)
end
