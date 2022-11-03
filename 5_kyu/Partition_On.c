#include <stdbool.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>

// Sorts array in place: first all with pedicate(x) == false, then all other.
  size_t partition_on (
        void *const base,	// Pointer to the array
		const size_t nmemb,	// Number of items in the array
		const size_t size,	// Size of one item
		bool (*const predicate) (const void *))	// Partition function
{
  
    // Null/0 argument exit
    if (base == NULL || nmemb == 0 || size == 0 || predicate == NULL)
        return 0;
    // buffer of elements for the second partition
    void *const true_array = malloc (nmemb * size);
    size_t n_true = 0;
    // false items are stored in the base array
    size_t n_false = 0;
    // sort into base array and true_array
    for (size_t i = 0; i < nmemb; ++i)
    {
        const void *const item = base + i * size;
        if (predicate (item))
	    {
            memcpy (true_array + n_true * size, item, size);
            n_true++;
        }
        else
	    {
            if (n_false < i)
	            memcpy (base + n_false * size, item, size);
            n_false++;
        }
    }
    // copy from true array to second partition in the base array
    if (n_true > 0)
        memcpy (base + n_false * size, true_array, n_true * size);
    free (true_array);
    return n_false;
}
