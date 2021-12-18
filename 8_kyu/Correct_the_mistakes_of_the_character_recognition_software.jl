function correct(string::AbstractString)::AbstractString
    function correct(c::Char)::Char
        c == '0' && return 'O'
        c == '1' && return 'I'
        c == '5' && return 'S'
                    return c
    end
    map(correct,string)
end