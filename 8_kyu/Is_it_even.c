#include <math.h>
#include <stdbool.h>

bool is_even(double n)
{
    return fmod(n,2) == 0;
}