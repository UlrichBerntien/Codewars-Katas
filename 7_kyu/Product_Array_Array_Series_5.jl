# Assumption: the product of all elements could be stored in a variable::T
function productarray(numbers::Array{T,1})::Array{T,1} where T <: Number
    all = reduce( *, numbers )
    map( x -> all÷x, numbers )
end