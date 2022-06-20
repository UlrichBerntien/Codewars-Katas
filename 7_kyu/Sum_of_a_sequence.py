# Returns sum of numbers begin_number,begin_number+step,...,end_number.
def sequence_sum(begin_number: int, end_number: int, step: int) -> int:
    if not (0 <= begin_number <= end_number and 0 < step):
        # Error exit
        return 0
    # Number of summands
    n = 1 + (end_number-begin_number)//step
    # with gauss sum
    return begin_number*n + step*n*(n-1)//2
