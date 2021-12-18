local solution = {}

function solution.f(x) 
    if math.abs(x) < 1e-3 then
        -- Taylor serie
        local sum = 0
        local xi = x
        for _,v in ipairs({1/2, -1/8, 1/16, -5/128}) do
            sum = sum + xi * v
            xi = xi * x
        end
        return sum
    else
        return math.sqrt(1+x)-1
    end
end

return solution