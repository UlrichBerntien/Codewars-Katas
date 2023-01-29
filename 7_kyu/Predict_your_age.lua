Predicter = {};
function Predicter.predictAge(...)
    local sum = 0
    for _,age in ipairs({...}) do
        sum = sum + age*age
    end
    return math.sqrt(sum)//2
end