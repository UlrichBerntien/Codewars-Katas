// Converts num into a number printed as decimal looks like the binary format of num.
unsigned long long to_binary(unsigned short num)
{
  long long accu = 0;
  long long bit = 1;
  while( num ) {
    if( num & 1 ) accu += bit;
    bit *= 10;
    num >>= 1;
  }
  return accu;
}
