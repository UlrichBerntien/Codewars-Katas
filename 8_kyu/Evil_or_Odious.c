// Checks the number of 1 bits in the value.
// Returns Odious/Evil if number of bits is odd/even.
// Returns a static string. Do not free the string.
const char* evil(int value) {
  unsigned bit_count = 0;
  while( value != 0 ) {
    bit_count += value & 1;
    value >>= 1;
  }
  return bit_count & 1 ? "It's Odious!" : "It's Evil!";
}
