module Dif
    export mxdiflg

    function mxdiflg(a1::Array, a2::Array)
        if isempty(a1) || isempty(a2)
            -1
        else
            min1, max1 = extrema( map( length, a1 ) )
            min2, max2 = extrema( map( length, a2 ) )
            max( abs(min1-min2), abs(min1-max2), abs(max1-min2), abs(max1-max2) )
        end            
    end

end