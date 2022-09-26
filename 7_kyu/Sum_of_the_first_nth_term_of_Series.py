# Sum serie 1/(1+3i) for i in range 0..n-1.
# Returns the sum as string with 2 digits.
def series_sum(n: int) -> str:
    if n <= 0:
        return "0.00"
    s = sum(1/float(1+3*it) for it in range(n))
    return "%0.2f" % s
