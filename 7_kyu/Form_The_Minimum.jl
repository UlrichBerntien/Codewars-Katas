function minvalue(values::Array{T,1})::T where T <: Number
    foldl( (lhs,rhs) -> muladd(10,lhs,rhs), unique(sort(values)) )
end