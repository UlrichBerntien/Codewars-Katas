module Weight
    export order_weight

    function order_weight(strng)
        modweight = w -> sum( c -> c-'0', w )
        modless = (x,y) -> x[2] == y[2] ? x[1] < y[1] : x[2] < y[2]
        weights_modified = map( w -> (w,modweight(w)), split(strng))
        sort!( weights_modified, lt=modless )
        join( map( wm -> wm[1], weights_modified ), ' ' )
    end

end