odd_ones_out <- function(numbers){
  is_odd_count <- table(numbers) %% 2 == 0
  flag_odds <- is_odd_count[match(numbers,names(is_odd_count))]
  numbers[ flag_odds ]
}