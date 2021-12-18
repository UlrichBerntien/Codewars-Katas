function nthsmallest(arr::Array{T,1}, pos::Integer)::T where T <: Number
    sort(arr)[pos]
end