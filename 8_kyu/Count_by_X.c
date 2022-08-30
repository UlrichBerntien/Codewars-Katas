// Fills the array result with 1*x, 2*x, 3*x ,, n*x.
void count_by(const unsigned x, const unsigned n, unsigned result[n]) {
  unsigned accu = x;
  for( unsigned it = 0; it < n; ++it, accu += x )
    result[it] = accu;
}
