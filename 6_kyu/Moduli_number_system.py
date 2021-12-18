import functools
import math

def fromNb2Str(n, modsys):
    if functools.reduce(int.__mul__,modsys) <= n or \
    any( any(math.gcd(modsys[i],k) != 1 for k in modsys[i+1:]) for i in range(len(modsys)) ):
        return "Not applicable"
    else:
        return "-" + "--".join(str(n % k) for k in modsys) + "-"
