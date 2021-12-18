return function(l)
    local sum = 0
    for _,value in ipairs(l) do
        sum = sum + value
    end
    return sum > 0
end