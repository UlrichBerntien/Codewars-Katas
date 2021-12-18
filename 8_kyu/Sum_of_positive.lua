local kata = {}

function kata.positive_sum(arr)
    local sum = 0
    for _,value in ipairs(arr) do
        if value > 0 then
            sum = sum + value
        end
    end
    return sum
end

return kata