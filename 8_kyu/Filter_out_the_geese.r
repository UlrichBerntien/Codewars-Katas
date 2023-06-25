# Returns the array birds filtered out the geese.
goose_filter <- function(birds) birds[!(birds %in% geese)]

# Set of valuse to filter out.
geese <- c("African", "Roman Tufted", "Toulouse", "Pilgrim", "Steinbacher")
