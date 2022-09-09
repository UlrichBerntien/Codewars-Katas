long zeros(long n) {
  long counter = 0;
  while( n >= 5 )
  {
    n /= 5;
    counter += n;
  }
  return counter;
}
