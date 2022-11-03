# Returns the sum of the decimal number num digits.
def get_sum_of_digits(num: int) -> int:
    accu = 0
    while num > 0:
        accu += num % 10
        num //= 10
    return accu
