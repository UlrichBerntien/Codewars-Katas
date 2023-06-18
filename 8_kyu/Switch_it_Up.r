# Returns name of number value.
# Returns decimal number als fallback.
switch_it_up <- function(number){
  if( (number+1) %in% seq_along(number_names) ) 
    number_names[number+1]
  else
    as.character(number)
}

# Name of number index-1. 
number_names <- c("Zero","One","Two","Three","Four","Five","Six","Seven","Eight","Nine")
