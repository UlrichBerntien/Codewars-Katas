def perimeter(n: int) -> int:
    "Returns the total length of the first n+1 squares."
    sum_length = 0  # sum of one edge length per square
    lengthI = 1     # edge length of square i
    lengthI1 = 0    # edge length of square i-1
    for i in range(n+1):
        sum_length += lengthI
        lengthI, lengthI1 = lengthI+lengthI1, lengthI
    return 4*sum_length