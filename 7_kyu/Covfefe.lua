local kata = {}

function kata.covfefe(str)
    local src = "coverage"
    local dst = "covfefe"
    if str:find(src) then
        return str:gsub(src,dst)
    else
        return str .. " " .. dst
    end
end

return kata