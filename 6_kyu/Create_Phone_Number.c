#include <stdlib.h>

// Pattern of phone number.
// Digits in the pattern are indices in the array of digits.
static const char PHONE_NUMBER_PATTERN[15] = "(012) 345-6789";

// Formats digits in phone number format.
// Arguments:
//    phnum - buffer to fill with the phone number string.
//    nums - digits (values 0..9, not chars) of the phone number.
// Returns:
//    Pointer to the created string in phnum.
char *create_phone_number(char phnum[15], const unsigned char nums[10])
{
  // Handle invalid arguments
  if( phnum == 0 )
    return 0;
  if(nums == 0) {
    *phnum = 0;
    return phnum;
  }
  // Format phone number based on the pattern.
  for( size_t i = 0; i < sizeof PHONE_NUMBER_PATTERN; ++i ) {
    const char p = PHONE_NUMBER_PATTERN[i];
    if( '0' <= p && p <= '9' )
      phnum[i] = nums[p-'0'] + '0';
    else
      phnum[i] = p;
  }
  return phnum;
}
