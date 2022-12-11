#include <stdbool.h>

// Converts boolean into Yes/No string constant.
// Returns pointer to static buffer. Do not free the returned string.
const char* bool_to_word (const bool value)
{
  return value ? "Yes" : "No";
}
