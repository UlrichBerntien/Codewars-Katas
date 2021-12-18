local kata = {}

function kata.runningAverage()
    N = 0
    Average = 0
    return function(x)
        Nold = N
        N = N + 1
        Average = Average * (Nold/N) + x/N
        return math.floor(Average*100+0.5)/100
    end
end

return kata