# Returns result of flower petals analysation.
how_much_i_love_you <- function(nbpetals) texts[(nbpetals-1) %% length(texts) + 1]

# All fixed retun texts.
texts <- c("I love you", "a little", "a lot", "passionately", "madly", "not at all")
