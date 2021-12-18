def oddOrEven(arr):
    return "odd" if sum( x & 1 for x in arr ) & 1 else "even"