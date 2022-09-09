#include <stdio.h>

// Clip x to the range 0..0xff
static int clip(const int x)
{
  if( x < 0 )
    return 0;
  if( x > 0xff )
    return 0xff;
  return x;
}

// Copies the RGB color in hex into the output buffer.
// Buffer size must be at least 7 chars.
int rgb(const int r, const int g, const int b, char output[])
{
  snprintf( output, 7, "%02X%02X%02X", clip(r), clip(g), clip(b) );
  return 0; 
}
