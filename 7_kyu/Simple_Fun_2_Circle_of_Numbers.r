circle_of_numbers <- function(n, first_number) {
    (first_number + n %/% 2) %% n
}