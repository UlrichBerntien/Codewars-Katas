#include <string.h>

//  assign results from encoding *uncoded
//  to the pre-allocated pointer *encoded
void encode(const char uncoded[], char encoded[]) {
  if (encoded == NULL) return;
  if (uncoded == NULL || *uncoded == 0) {
    *encoded = 0;
    return;
  }
  const unsigned last = strlen(uncoded) - 1;
  const unsigned mid = last / 2;
  unsigned s = 0;
  for (unsigned d = 0; d <= last; ++d) {
    encoded[d] = uncoded[s];
    s = s <= mid ? last - s : last - s + 1;
  }
  encoded[last + 1] = 0;
}

//  assign results from decoding *encoded
//  to the pre-allocated pointer *decoded
void decode(const char encoded[], char decoded[]) {
  if (decoded == NULL) return;
  if (encoded == NULL || *encoded == 0) {
    *decoded = 0;
    return;
  }
  const unsigned last = strlen(encoded) - 1;
  const unsigned mid = last / 2;
  unsigned d = 0;
  for (unsigned s = 0; s <= last; ++s) {
    decoded[d] = encoded[s];
    d = d <= mid ? last - d : last - d + 1;
  }
  decoded[last + 1] = 0;
}