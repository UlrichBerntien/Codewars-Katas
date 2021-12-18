module Solution
export spinwords

spinwords(s::String) = join( map( w -> length(w)≥5 ? reverse(w) : w, split(s) ), " " )

end