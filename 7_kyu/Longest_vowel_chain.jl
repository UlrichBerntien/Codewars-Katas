function solve(s::String)
    maximum(regex -> length(regex.match), eachmatch(r"[aeiou]+"i, s))
end