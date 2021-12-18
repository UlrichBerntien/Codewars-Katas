local kata = {}

function kata.number_of_pairs(gloves)
    local count_color = {}
    for _,v in ipairs(gloves) do
        count_color[v] = 1 + (count_color[v] or 0)
    end
    local count_pairs = 0
    for _,v in pairs(count_color) do
        count_pairs = count_pairs + v // 2
    end
    return count_pairs
end

return kata