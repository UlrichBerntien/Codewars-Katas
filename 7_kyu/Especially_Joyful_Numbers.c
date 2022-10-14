#include <stdbool.h>

// Calculates the sum of the decimal digiits of the number n.
static unsigned sum_digits(unsigned n) {
  unsigned accu = 0;
  while( n > 0) {
    accu += n % 10;
    n /= 10;
  }
  return accu;
}

// Calculates the reverse decimal number.
static unsigned reverse(unsigned n) {
  unsigned result = 0;
  while( n > 0 ) {
    result = result*10 + n % 10;
    n /= 10;
  }
  return result;
}

// Checks if the number is
// - a Harshad number
// - and number is the product of the digit sum * digit sum reversed.
bool number_joy(const unsigned number) {
  const unsigned sum = sum_digits(number);
  return number % sum == 0 && number == sum * reverse(sum);
}
