# Returns personalized greeting message
greet <- function(name, owner) ifelse(name == owner, "Hello boss", "Hello guest")  
