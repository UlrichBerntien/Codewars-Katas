FindOutlier = {};

function FindOutlier.find(integers)
    local group = { [0] = {}, [1] = {} }
    for _,v in ipairs(integers) do
        index = v % 2
        if #group[index] < 2 then
            table.insert( group[index], v )
            if #group[0] + #group[1] == 3 then
                return group[#group[0]-1][1]
              end
        end
    end
    return nil
end