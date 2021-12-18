local solution = {}

-- Walk from start point (x,y coordinates)
-- steps with len into direcection deg relativ to x-axis
function solution.walk( start, steps )
    local now = start
    for _,step in ipairs(steps) do
        rad = math.rad(step.deg)
        now.x = now.x + step.len * math.cos(rad)
        now.y = now.y + step.len * math.sin(rad)
    end
    return now
end  

-- Format the point C as specified in the kata
function solution.format( C )
    local dist = math.sqrt( C.x^2 + C.y^2 )
    local x = math.deg( math.atan( C.y, C.x ) )
    local degrees = {}
    for _ = 1,3 do
        local i,f = math.modf(x)
        table.insert( degrees, i)
        x = f * 60
    end
    return { math.floor(dist+0.5), table.unpack(degrees) }
end


function solution.solve(a, b, c, alpha, beta, gamma)
    -- convert: all angles starting at x-axis
    local steps = {
        {len = a, deg = alpha },
        {len = b, deg = beta+90 },
        {len = c, deg = gamma+180 }
    }
    local endpoint = solution.walk( {x=0,y=0}, steps )
    return solution.format( endpoint )
end

return solution