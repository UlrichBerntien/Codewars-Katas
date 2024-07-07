#include <stdlib.h>

/**
 *  Structure to hold both inputs.
 */
struct values_to_merge {
    int value;    // Value to add or value to remove
    int index;    // index < 0: remove the value, else index in the output
};

/**
 *  Compares merged values by value first.
 *  Used to sort the merged values.
 *  Values to remove are placed direct in front of the value to add.
 */
static int values_cmp ( const void* a_void, const void* b_void ) {
    const struct values_to_merge *const a = a_void;
    const struct values_to_merge *const b = b_void;
    const int delta = a->value - b->value;
    if (delta) return delta;
    return a->index - b->index;
}

/**
 *  Compares merged values by value first.
 *  Used to sort the merged values in the order needed for output array.
 */
static int indices_cmp ( const void* a_void, const void* b_void ) {
    const struct values_to_merge *const a = a_void;
    const struct values_to_merge *const b = b_void;
    return a->index - b->index;
}


/**
 *  Copies values from source to merged array.
 *  Source index is used as destination index.
 *  This values are to add.
 */
static void copy_indexed(struct values_to_merge dest[], const int src[], const size_t n) {
  for( size_t i = 0; i < n; ++i) {
    dest[i].value = src[i];
    dest[i].index = i;
  }
}


/**
 *  Copies values from source to merged array.
 *  Index of the values is set to -1. Indicates to remove the items.
 */
static void copy_negative(struct values_to_merge dest[], const int src[], const size_t n) {
  for( size_t i = 0; i < n; ++i) {
    dest[i].value = src[i];
    dest[i].index = -1;
  }
}


/**
 *  Copies values from merged array into plain array.
 *  Copies the value in the order of the source (the merged) array.
 */
static void copy_array(int dest[], const struct values_to_merge src[], const size_t n) {
  for( size_t i = 0; i < n; ++i) {
    dest[i] = src[i].value;
  }
}

/**
 *  Removes items from array.
 *  Arguments:
 *    arr1, n1 = Source array.
 *    arr2. n2 = Items in this array must be removed from the source array.
 *    z = Store the length of the returned array here.
 *  Return:
 *    Array of the remaining items.
 *    Caller must free the returned array.
 */
int *array_diff(const int *arr1, size_t n1, const int *arr2, size_t n2, size_t *z) {
    const size_t merged_n = n1+n2;
    // Use additonal memory to reduce runtine.
    struct values_to_merge *const merged = calloc(merged_n, sizeof (struct values_to_merge));
    // Copies values to keep into the merged data array.
    copy_indexed(merged, arr1, n1);
    // Copies values to remove into the merged data array.
    copy_negative(merged + n1, arr2, n2);
    // Sort to place a value to remove direct before a value too keep.
    qsort(merged, merged_n, sizeof (struct values_to_merge), values_cmp);
    size_t filtered_n = 0;
    for( size_t i = 0; i < merged_n; ) {
      if( merged[i].index < 0 ) {
          // This value should be removed
          const int x = merged[i++].value;
          // Remove all occurencies in the data.
          while(i < merged_n && merged[i].value == x) ++i;
      } else {
        // Keep this value.
        // (because no value to delete before.)
        merged[filtered_n++] = merged[i++];
      }
    }
    // Rearrange the values in the original order.
    qsort(merged, filtered_n, sizeof (struct values_to_merge), indices_cmp);
    int *const result = calloc(filtered_n, sizeof (int));
    copy_array(result, merged, filtered_n);
    free(merged);
    // Return the array of not removed items.
    *z = filtered_n;
    return result;
}
