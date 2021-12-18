function maxtrisum(values::Array{T})::T where T <: Number
    sum(unique!(sort(values))[end-2:end])
end