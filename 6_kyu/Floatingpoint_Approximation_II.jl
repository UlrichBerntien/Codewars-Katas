module FloatII
    export interp

    function interp(f, l, u, n)
        # no numerical error caused by adding a lot of small numbers.
        x(idx) = (l*(n-idx)+u*idx)/n
        map( idx -> floor(f(x(idx)),2), 0:(n-1) )
    end

end