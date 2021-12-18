local kata = {}

function kata.potatoes(p0, w0, p1)
    -- dry mass T is constant
    -- before:  T = w0 (1 - p0/100)
    -- after:   T = w1 (1 - p1/100)
    -- so it is w1 (1 - p1/100) = w0 (1 - p0/100)
    local w1 = w0 * (100 - p0)/(100 - p1)
    return math.floor( w1 )
end

return kata