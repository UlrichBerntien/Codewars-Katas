def create_two_sets_of_equal_sum(n: int): 
    """
    Splits the set of integers 1,2,3..n into two sets with same sum.
    Returns one empty array if split is not possible.
    """
    if n < 2:
        # n negative, or only one number
        return []
    # sum of all numbers
    s = n*(n+1)/2
    if s%2 == 1:
        # can't split the sum into two equal parts
        return []
    # sum of each part must be
    h = int(s//2)
    # fill first array 1,2,3... up to the given sum is reached
    sa = 0
    i = 1
    while sa < h:
        sa += i
        i += 1
    a = [x for x in range(1,i)]
    b = [x for x in range(i,n+1)]
    # sum of first array could be to high.
    if sa > h:
        # Correct the sum difference by moving the integer j+1 at index j
        j = sa-h-1
        b.append(a[j])
        del a[j]
    return a,b
