module Irr
    export sum_fracts

    function sum_fracts(l::Array{Array{Int,1},1})
        result = sum( x -> x[1]//x[2], l )
        if denominator(result) == 1 || numerator(result) == 0
            numerator(result)
        else
            [numerator(result),denominator(result)]
        end
    end
    
    sum_fracts(l::Any) = nothing

end