LuaArrays = {}
function LuaArrays.solve(arr)
    local limit = math.max(table.unpack(arr))
    local exists = {}
    for _,value in ipairs(arr) do
        exists[value] = true
    end
    local missing = {}
    for i = 1,limit do
        if not exists[i] then
            table.insert(missing,i)
        end
    end
    return missing
end
return LuaArrays