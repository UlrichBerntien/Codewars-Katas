local kata = {}

kata.romanDigits = { I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000 }

kata.romanDecoder = function(roman) 
    local accu = 0
    local last = 0
    for idx = #roman,1,-1 do
        local value = kata.romanDigits[roman:sub(idx,idx)]
        if not value then
            error("invalid roman number")
        elseif value < last then
            accu = accu - value
        else
            accu = accu + value
            last = value
        end
    end
    return accu
end

return kata