module Division
    export thirt
    const RESTS = [1, 10, 9, 12, 3, 4]
    function thirt(n::Int64)::Int64
        xi = n
        while true
            xi,xo = sum( p -> *(p...), zip( digits(xi), Iterators.cycle(RESTS) ) ), xi
            if xi ≥ xo break end
        end
        xi
    end
end