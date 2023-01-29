local kata = {}

function kata.runningAverage()
    local n = 0
    local average = 0
    return function(x)
        local nOld = n
        n = n + 1
        average = average * (nOld/n) + x/n
        return math.floor(average*100+0.5)/100
    end
end

return kata