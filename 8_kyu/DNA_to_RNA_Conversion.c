#include <stdlib.h>
#include <string.h>

/**
 *  Translates DNA into RNA code sequence.
 *  dna: ASCII string.
 *  Return: ASCII string, caller must free the memory.
 */
char *dna_to_rna(const char *dna)
{
  // error exit on NULL argument
  if (!dna) return NULL;
  // allocate return data buffer
  const size_t len = strlen(dna);
  char *const rna = malloc(len+1);
  // error exit on out off memory
  if (!rna) return rna;
  // convert dna to rna
  for(size_t i = 0; i <= len; ++i)
    rna[i] = dna[i] == 'T' ? 'U' : dna[i];
  return rna;
}
