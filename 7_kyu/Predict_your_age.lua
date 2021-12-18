Predicter = {};
function Predicter.predictAge(...)
    sum = 0
    for _,age in ipairs({...}) do
        sum = sum + age*age
    end
    return math.sqrt(sum)//2
end