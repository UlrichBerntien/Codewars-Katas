module Parab
    export len_curve

    function len_curve(n)
        # Parameters
        f = x -> x^2
        a = 0
        b = 1
        # Calculation
        sum = 0
        h = (b-a)/n
        h² = h^2
        x0 = a
        f0 = f(x0)
        for i in 1:n
            x1 = a*(1-i/n) + b*(i/n) # no rounding error by added many h
            f1 = f(x1)
            sum += sqrt((f1-f0)^2+h²)
            x0, f0 = x1, f1
        end
        sum
    end

end