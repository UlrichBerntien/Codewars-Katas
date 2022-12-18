#include <limits.h>

// Calculates hotdog price.
// Arguments:
//    n - Number of hotdogs
// Return:
//    Price for all hotdogs
unsigned short sale_hotdogs(const unsigned short n) {
  // Invalid argument handling
  if( n > USHRT_MAX/90 )
    return USHRT_MAX;
  // Price per unit
  const unsigned short ppu = n <  5 ? 100:
                             n < 10 ?  95:
                                       90;
  // Total price
  return n * ppu;
}
