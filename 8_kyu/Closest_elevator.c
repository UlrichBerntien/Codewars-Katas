#include <stdlib.h>

const char* elevator(const int left, const int right, const int call)
{
  const int delta_left = abs(call-left);
  const int delta_right = abs(call-right);
  return delta_left < delta_right ? "left" : "right";
}
