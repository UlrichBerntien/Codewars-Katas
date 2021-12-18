local kata = {}

function kata.rgb(r, g, b)
    local function cut(x)
        if x <= 0 then
            return 0
        elseif x >= 255 then
            return 255
        else
            return x
        end
    end
    return string.format("%02X%02X%02X", cut(r), cut(g), cut(b) )
end

return kata