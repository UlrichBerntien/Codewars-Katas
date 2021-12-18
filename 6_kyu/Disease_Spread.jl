module Disease
    export epidemic

    function epidemic(tm::Number, n::Number, s0::Number, i0::Number, b::Number, a::Number)
        dt::Float64 = tm/n
        dta::Float64 = dt * a
        dtb::Float64 = -dt * b
        s::Float64 = s0
        i::Float64 = i0
        r::Float64 = 0
        for t::Float64 = 0:dt:tm
            ds = dtb * s * i
            dr = dta * i
            di = -ds -dr
            if di < 0
                break
            end
            s += ds
            r += dr
            i += di
        end
        return i
    end
end