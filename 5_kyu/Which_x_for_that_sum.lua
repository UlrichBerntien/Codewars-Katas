local kata = {}
function kata.solve(m)
    -- The infinite sum is U = x/(1-x)² for |x| < 1
    -- With g = 1/2U + 1 the inverse is
    -- x = g +/- sqrt(g² - 1)
    local g = 1 + 1/(2*m)
    return g - math.sqrt(g^2 - 1)
end
return kata