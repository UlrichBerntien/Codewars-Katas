import math
import numpy

def is_prime(num: int) -> bool:
    # 2 is the first prime
    if num < 2:
        return False
    # with Eratosthenes sieve generate primes
    limit = math.floor(math.sqrt(num))+1
    primes = numpy.ones(limit, dtype=bool)
    for i in range(2, limit):
        if primes[i]:
            if num % i == 0:
                return False
            primes[i*i::i] = False
    return True
