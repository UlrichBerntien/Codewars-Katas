#include <inttypes.h>

/**
 *  Converts to maximum decimal number.
 *  Takes all the decimal digits of the argument and arranges them into the largest possible number.
 */
uint64_t descendingOrder(uint64_t n)
{
    // buffer to store all digits, without position information
    int digits[10] = {0};
    // divide the input number n into digits
    while(n>0) {
      ++digits[n%10];
      n /= 10;
    }
    // form the largest possible number from the digits
    uint64_t result = 0;
    for( int d = 9; d >= 0; --d )
      for(int i = digits[d]; i > 0; --i)
        result = result*10 + d;
    return result;
}
