// Replaces all digits of the decimal numer n by the square of the digit.
unsigned long long square_digits (unsigned n)
{
  long long accu = 0;
  long long factor = 1;
  while( n > 0 )
  {
    int r = n % 10;
    r *= r;
    accu += r * factor;
    factor *= r > 9 ? 100 : 10;
    n /= 10;
  }
  return accu;
}
