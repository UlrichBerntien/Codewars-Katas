local kata = {}


kata.eps = 1E-12


function kata.sign(x)
    if x < 0 then
        return -1
    elseif x > 0 then
        return 1
    else
        return 0
    end
end


function kata.linear(b,c)
    -- solve 0 = b x + c
    if math.abs(b) < kata.eps then
        if math.abs(c) < kata.eps then
            return 0
         else
            return nil
         end
    end
    return - c / b
end  


function kata.quadratic(a, b, c)
    -- solve 0 = a x^2 + b x + c
    if math.abs(a) < kata.eps then
        return kata.linear(b,c)
    end
    local q = c / a
    local p = b / a
    -- solve 0 = x^2 + p x + q
    local ph = p / 2
    local x1 = -ph - kata.sign(ph) * math.sqrt(ph^2-q)
    if math.abs(x1) < kata.eps then
        return x1
    end
    local x2 = q / x1
    if math.abs(x1) < math.abs(x2) then
        return x1
    else
        return x2
    end
end


return kata