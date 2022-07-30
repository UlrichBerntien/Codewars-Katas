package kata

// Table of all small prime numbers.
// The prime numbers below 1000.
var primes_less_1000 = [...]int{
	 2,    3,   5,   7,  11,  13,  17,  19,  23,  29,
	 31,  37,  41,  43,  47,  53,  59,  61,  67,  71,
	 73,  79,  83,  89,  97, 101, 103, 107, 109, 113,
	127, 131, 137, 139, 149, 151, 157, 163, 167, 173,
	179, 181, 191, 193, 197, 199, 211, 223, 227, 229,
	233, 239, 241, 251, 257, 263, 269, 271, 277, 281,
	283, 293, 307, 311, 313, 317, 331, 337, 347, 349,
	353, 359, 367, 373, 379, 383, 389, 397, 401, 409,
	419, 421, 431, 433, 439, 443, 449, 457, 461, 463,
	467, 479, 487, 491, 499, 503, 509, 521, 523, 541,
	547, 557, 563, 569, 571, 577, 587, 593, 599, 601,
	607, 613, 617, 619, 631, 641, 643, 647, 653, 659,
	661, 673, 677, 683, 691, 701, 709, 719, 727, 733,
	739, 743, 751, 757, 761, 769, 773, 787, 797, 809,
	811, 821, 823, 827, 829, 839, 853, 857, 859, 863,
	877, 881, 883, 887, 907, 911, 919, 929, 937, 941,
	947, 953, 967, 971, 977, 983, 991, 997}

// Return True if n is a multiple of a prime number below 1000.
// Uses trial divisions by all small prime numbers.
func isMultipleOfPrime1000(n int) bool {
	for _, p := range primes_less_1000 {
		if n%p == 0 {
			// n is multiple of prime number p.
			// case n == p -> n is a prime number
			// case n == k*p with k > 1-> n is not prime
			return n != p
		}
	}
	// n is not a multiple of all prime numbers below 1000
	return false
}

// Miller-Rabin primality test.
// Returns false if n is not a prime number.
// https://de.wikipedia.org/wiki/Miller-Rabin-Test
func mrt(n int, a int) bool {
	m := n - 1
	d := m >> 1
	e := 1
	for d&1 == 0 {
		d >>= 1
		e++
	}
  // calculate in the for loop: p = a^d mod n
	p := a
	q := a
	for d >= 2 {
		d >>= 1
		q *= q;	q %= n  // square modula: q = q^2 mod n
		if d&1 > 0 {
			p *= q; p %= n // multiplication modula: p = (p * q) mod n
		}
	}
	if p == 1 || p == m {
		return true // n is probably prime
	}
	for ;e > 0 && p > 1; e-- {
		p *= p;	p %= n // square modula: p = p^2 mod n
		if p == m {
			return true // n is probably prime
		}
	}
	return false // n is no prime number
}

// Miller-Rabin primality test.
// Returns: false -> the number is no prime number
//          true -> the number is a prime number
// https://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test
func isPrime_MillerRabin(n int) bool {
	// Base values to deterministic check for n less than 4.759.123.141
	a_set := [...]int{2, 7, 61}
	for _, a := range a_set {
		if !mrt(n, a) {
			// Miller-Rabin test failed for base a => n is not a prime number
			return false
		}
	}
	// The number n passed enough tests
	// The number n is probably primary
	return true
}

// Primality test.
// Returns true if and only if n is a prime number.
// https://en.wikipedia.org/wiki/Primality_test
func IsPrime(n int) bool {
	// First step:
	// Trail division test sufficent for small numbers
	if n < 2 {
		// By definition 1 is no prime number
		// and false as error fallback return value if n is negative
		return false
	}
	up_to_prime := primes_less_1000[len(primes_less_1000)-1]
	failed := isMultipleOfPrime1000(n)
	if failed {
		return false
	}
	// The trial division test finds all small non-primes
	if n < up_to_prime*up_to_prime {
		return true
	}
	// Second step:
	// A probabilistic test for the big numbers.
	// Not a perfect but sufficient for a lot of cases.
	return isPrime_MillerRabin(n)
}
