function hexwordsum(string)
    sum( split(string,' ') ) do s
        s = replace(s, 'S' => '5' )
        s = replace(s, 'O' => '0' )
        if !isempty(s) && all(isxdigit,s)
            parse(Int,s,base=16)
        else
            0
        end            
    end
end