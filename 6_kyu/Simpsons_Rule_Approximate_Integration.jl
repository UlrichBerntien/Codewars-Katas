module Simpson
    export simpson

    function simpson(n)
        # parameters
        f(x) = (3/2)*sin(x)^3
        a = 0
        b = π
        # calculation
        h = (b-a)/n
        sum = f(a)+f(b)
        for i in 1:2:n
            ai = muladd(h,i,a)
            sum += 4f(ai)
            sum += 2f(ai+h)
        end
        h*sum/3
    end

end