local solution = {}

function solution.string2table(str)
    local tbl = {}
    for value in str:gmatch("%d+") do
        local obj = {}
        obj.str = value
        obj.weight = - value:len() * ("0"):byte()
        for i = 1,value:len() do
            obj.weight = obj.weight + value:byte(i,i)
        end
        table.insert(tbl,obj)
    end
    return tbl    
end

function solution.table2string(tbl)
    local strs = {}
    for _,value in ipairs(tbl) do
        table.insert(strs,value.str)
    end
    return table.concat(strs," ")
end

function solution.compare(a,b)
    if a.weight == b.weight then
        return a.str < b.str
    else
        return a.weight < b.weight
    end
end  

function solution.orderWeight(str)
    local list = solution.string2table(str)
    table.sort(list,solution.compare)
    return solution.table2string(list)
end

return solution