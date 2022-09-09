#include <inttypes.h>

// Returns number n with bit k set to zero.
int32_t kill_kth_bit (const int32_t n, const int32_t k)
{
	return n & ~(1 << (k-1) );
}