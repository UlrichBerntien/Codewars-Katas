module Step
    export oper_array
    export gcdi
    export lcmu
    export som
    export maxi
    export mini

    gcdi = gcd
    lcmu = lcm
    som = +
    maxi = max
    mini = min
    
    oper_array(fct, arr, init) = map( x -> init=fct(init,x), arr )

end