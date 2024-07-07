#include <stdbool.h>
#include <stddef.h>
#include <string.h>

/*
 *  Returns A bool for every string in the list.
 *  The value switchs if a string is "flick". Starts with true.
 *  Arguments:
 *    length = length of all arrays
 *    array = strings to check (input)
 *    result = write results into this array.
 */
void flick_switch(size_t length, const char *const array[length], bool result[length]) {
  bool state = true;
  for(size_t i = 0; i < length; ++i)
    result[i] = state = state != (strcmp(array[i], "flick") == 0);
}