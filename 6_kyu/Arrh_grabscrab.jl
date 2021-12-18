function grabscrab(anagram::String, dictionary::Array{String})::Array{String}
    result = String[]
    sorted_anagram = sort!([c for c in anagram])
    for word in dictionary
        if sorted_anagram == sort!([c for c in word])
            push!(result,word)
        end
    end
    result
end