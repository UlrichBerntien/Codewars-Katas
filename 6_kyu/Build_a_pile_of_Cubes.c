// Calculates n so that n³ + (n-1)³ ... + 1³ = m.
// Returns n or -1 if no such n exists.
long long findNb(const long long m)
{
  // It is n³ + (n-1)³ ... + 1³ = (n(n+1)/2)²
  // https://www.math-only-math.com/sum-of-the-cubes-of-first-n-natural-numbers.html
  long long n = 1;
  long long s = 1;
  while( s < m ) {
    ++n;
    const long long q = (n*(n+1))/2;
    s = q*q;
  }
  return s == m ? n : -1;
}
