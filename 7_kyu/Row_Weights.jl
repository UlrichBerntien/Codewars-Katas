function rowweights(array::Array{T})::Array{T} where T <: Number
    [sum(array[1:2:end]), sum(array[2:2:end])]
end