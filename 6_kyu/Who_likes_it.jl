module Kata
  export likes
  
  "Returns 'like' statement including the firsts of the given names."
  function likes(names::Vector{String}) :: String
    len = length(names)
    len == 0 && return "no one likes this"
    len == 1 && return "$(names[1]) likes this"
    len == 2 && return "$(names[1]) and $(names[2]) like this"
    len == 3 && return "$(names[1]), $(names[2]) and $(names[3]) like this"
    "$(names[1]), $(names[2]) and $(len-2) others like this"
  end
end
