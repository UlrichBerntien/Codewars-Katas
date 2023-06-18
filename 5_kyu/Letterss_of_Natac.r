# Returns the result of the check if the hand is playable.
# Returns a list of TRUE/FALSE and the resulting hand.
# All items are coded as characters in the strings.
play_if_enough <- function(hand, play){
  hand_table <- string_to_table(hand)
  play_table <- string_to_table(play)
  missing <- hand_table[names(play_table)] < play_table
  if( any(is.na(missing)) || any(missing) )
    list(FALSE,hand) 
  else
    list(TRUE,rest_to_string(hand_table,play_table))
}

# Split a string into characters.
# Returns a table of all characters.
string_to_table <- function(str) table(strsplit(str,"",fixed=TRUE))

# Reduce the characters in table x by the characters in table minus.
# Returns a string build from all remaining characters.
rest_to_string <- function(x, minus) {
  n <- names(minus)
  x[n] <- x[n] - minus
  paste0(strrep(names(x),x),collapse="")
}
