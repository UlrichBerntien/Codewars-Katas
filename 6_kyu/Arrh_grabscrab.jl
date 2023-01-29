function grabscrab(anagram::String, dictionary::Array{String})::Array{String}
    sorted_anagram = sort!([c for c in anagram])
    filter( word -> sorted_anagram == sort!([c for c in word]), dictionary )
end