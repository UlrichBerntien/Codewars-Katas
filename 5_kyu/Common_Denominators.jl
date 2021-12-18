module Denom
    export convert_fracts

    function convert_fracts(lst::Array{Array{Int,1},1})::Array{Array{BigInt,1},1}
        rats = map( x -> x[1]//x[2], lst )
        lcmt = lcm( map( BigInt∘denominator, rats ) )
        collect( map( x -> [lcmt*x,lcmt], rats ) )
    end
end