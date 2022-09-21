#include <assert.h>
#include <stdlib.h>
#include <string.h>


// The options for one input char.
// Index is the value of the input char, e.g. "1" at index 1.
static const char *const options[11] = {
  "08",    // options for 0
  "124",   // options for 1
  "2135",  // options for 2
  "326",   // options for 3
  "4157",  // options for 4
  "52468", // options for 5
  "6359",  // options for 6
  "748",   // options for 7
  "85790", // options for 8
  "968"    // options for 9
};



// Number of options for one input charter.
// Index is the value of the input char, e.g. "1" at index 1.
static size_t* options_len = NULL;


// Calculates length of array of strings.
// The caller must free the array.
static size_t* strlen10(const char *const strs[10])
{
  assert(strs != NULL);
  size_t *const lens = calloc(10, sizeof (size_t));
  for( int i = 0; i < 10; ++i )
    lens[i] = strlen(strs[i]);
  return lens;
}


// Calculates number of pin variants.
// Returns 0 if the observed string is invalid.
static size_t variantslen(const char* observed)
{
  if( observed == NULL || *observed == 0 )
    return 0;
  size_t n = 1;
  while( *observed )
  {
    const char c = *observed++;
    if( '0' <= c && c <= '9' )
      n *= options_len[c-'0'];
    else
      return 0;
  }
  return n;
}


// Creates buffer for the pins.
// Uses only one memory block for pointers and characters.
// The caller must call only free(*return).
static char** createptrs( const size_t n_variants, const size_t n_chars )
{
  assert( n_variants > 0 && n_chars > 0 );
  char *const buffer = malloc((n_chars+1 + sizeof (char*)) * n_variants);
  char* *const ptrs = (char**) buffer;
  const size_t str_n = n_chars + 1;
  char* ptr = buffer + n_variants * sizeof (char*);
  for( size_t i = 0; i < n_variants; ++i, ptr += str_n )
    ptrs[i] = ptr;
  return ptrs;
}


// Return array of c-strings with all possible PINs.
// Caller must free the memory with function free_pins.
// the number of elements is stored in count.
const char** get_pins(const char observed [], size_t *const count) {
  // Initialise the static options_len only once.
  if( options_len == NULL )
    options_len = strlen10(options);
  // Calculates the number of variants first, to allocate the buffer.
  const size_t n_variants = variantslen(observed);
  *count = n_variants;
  // Error exit if argument observed is invalid.
  if( n_variants == 0 )
    return NULL;
  const size_t n_chars = strlen(observed);
  char* *const pins = createptrs(n_variants,n_chars);
  memcpy(pins[0],observed,n_chars+1);
  size_t dst = 1;
  for( size_t i = 0; i < n_chars; ++i )
  {
    const size_t block_n = dst;
    assert( '0' <= observed[i] && observed[i] <= '9' );
    for( const char* vars = options[observed[i]-'0']+1; *vars; ++vars )
    {
      // Create a new variant of the pins.
      memcpy(pins[dst],pins[0],block_n*(n_chars+1));
      const char  v = *vars;
      for( size_t d=dst; d < dst+block_n; ++d )
        pins[d][i] = v;
      dst += block_n;
    }
  }
  assert(dst == n_variants);
  return (const char**) pins;
}


// Frees the allocated memory from function get_pins.
void free_pins(const char** pins)
{
  if( pins != NULL )
    free(pins);
}
