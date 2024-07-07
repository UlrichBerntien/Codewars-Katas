#include <stdbool.h>
#include <math.h>

bool is_square(int n) {
    return fmod(sqrt(n),1) == 0.;
}