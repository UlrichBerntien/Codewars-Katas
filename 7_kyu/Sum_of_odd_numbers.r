# Returns sum of the number in the n-th row of the "odd number triangle".
#     1
#    3 5
#   7 9 11
#
# Calculation based in the Gauss sum formula.
# Start number in the n-th row is
#     start = 1 + (n - 1) * n
# There a n numbers in the n-th row. The sum is
#     start * n + (n - 1) * n
# = (1 + (n - 1) * n) * n + (n - 1) * n
# = n + (n - 1) * n² + n² - n
# = n + n³ - n² + n² - n
# = n³
row_sum_odd_numbers <- function(n) n**3
