#include <assert.h>
#include <stdlib.h>
#include <string.h>

// Returns the complementary DNA.
// The caller must free the returned string.
// Supprts only upper case A-T,C-G.
char *dna_strand(const char dna [])
{
  // NULL pointer error
  if( dna == NULL )
    return NULL;
  const size_t n = strlen(dna);
  char *const output = malloc(n+1);
  for( size_t i = 0; i < n; ++i )
    switch( dna[i] ) {
        case 'A' : output[i] = 'T'; break;
        case 'T' : output[i] = 'A'; break;
        case 'C' : output[i] = 'G'; break;
        case 'G' : output[i] = 'C'; break;
    }
  output[n] = 0;
  assert( output[n] == 0 );
  return output;
}
