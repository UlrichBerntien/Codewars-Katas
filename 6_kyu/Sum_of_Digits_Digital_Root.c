// Calculates recursive sum of all the digits in a number.
// Returns n if n is non-positive.
int digital_root(const int n) {
  int root = n;
  while( root > 9 ) {
    int remain = root;
    root = 0;
    while( remain > 0 ) {
      root += remain % 10;
      remain /= 10;
    }
  }
  return root;
}
