CACHE = dict()

def count_ways(n: int, k: int) -> int:
    if n < 2:
        return 1
    parameter = (n,k)
    if parameter in CACHE:
        return CACHE[parameter]
    result = 0
    for i in range(1,min(k,n)+1):
        result += count_ways(n-i,k)
    CACHE[parameter] = result
    return result