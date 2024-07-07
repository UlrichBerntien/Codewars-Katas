#include <stdbool.h>

bool if_chuck_says_so(void) {
    static bool state = true;
    return state = !state;
}