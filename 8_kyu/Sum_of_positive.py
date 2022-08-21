# the sum of all of the positives ones.
def positive_sum(arr: list[int]) -> int:
    return sum( it for it in arr if it > 0 )
