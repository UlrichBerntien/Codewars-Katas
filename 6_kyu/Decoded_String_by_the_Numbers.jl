function decode(str::String)::Array{String}
    tokenformat = r"\\\d+|."
    result = String[]
    idx = 1
    while idx ≤ length(str)
        token = match( tokenformat, str, idx )
        idx += length(token.match)
        if length(token.match) == 1
            push!( result, token.match )
        else
            n = parse(Int,token.match[2:end])
            push!( result, str[idx:min(idx+n-1,end)] )
            idx += n
        end
    end
    result
end