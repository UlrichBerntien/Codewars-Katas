class Kata {
  // Sum of the natural numbers upto n (including).
  // Sum of 1,2,3,...,n
  private static gauss(n) {
    n < 1 ? 0 : (n*(n+1)).intdiv(2)
  }
  
  // Sum of all integers 3*i,5*i below limit.
  static solution(limit) {
	  def final n = limit - 1
	  // All multiples of 3 + all multiples of 5 - all multiples of 3*5
	  3*gauss(n.intdiv(3)) + 5*gauss(n.intdiv(5)) - 3*5*gauss(n.intdiv(3*5))
  }
}
