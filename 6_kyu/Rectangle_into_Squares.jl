module Sq
    export sq_in_rect

    function sq_in_rect(a::T, b::T) where T<:Number
        if a == b
            return nothing
        else
            result::Array{T} = []
            while a > 0 && b > 0
                if a > b
                    a -= b
                    push!(result,b)
                else
                    b -= a
                    push!(result,a)
                end
            end
            return result
        end
    end
  
end