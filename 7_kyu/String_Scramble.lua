local kata = {}

function kata.scramble(str, idxs)
    buffer = {}
    for source,dest in ipairs(idxs) do
        buffer[dest] = str:sub(source,source)
    end
    return table.concat(buffer)
end

return kata