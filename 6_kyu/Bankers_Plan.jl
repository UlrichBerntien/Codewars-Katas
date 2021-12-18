module Finance
    export fortune

    function fortune(f0, p, c0, n, i)::Bool
        addpercent(current,percent) = current+(current*percent)÷100
        f = f0
        c = c0
        for year in 2:n
            f = addpercent(f,p)-c
            c = addpercent(c,i)
        end
        f ≥ 0
    end

end