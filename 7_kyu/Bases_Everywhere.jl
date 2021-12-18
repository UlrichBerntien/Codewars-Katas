function base_finder(seq)
    maximum( s -> parse(Int,s[end]), seq ) + 1
end