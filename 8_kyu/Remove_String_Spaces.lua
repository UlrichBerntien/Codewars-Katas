local kata = {}

function kata.noSpace(str)
    return str:gsub("%s","")
end

return kata