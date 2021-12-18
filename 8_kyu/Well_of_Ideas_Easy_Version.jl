function well(x::AbstractArray{<:AbstractString})::String
    number = count( it -> it == "good", x )
    number > 2 && return "I smell a series!"
    number > 0 && return "Publish!"
                  return "Fail!"
end