#include <string.h>

// Generates a static translation table.
// character -> '1'/'0' if character is a vowel.
static const char* vowel_one_translate_generate ()
{
  static const char vowels[] = "aeiouAEIOU";
  static char buffer[0x100];
  memset(buffer, '0', 0x100 );
  for( int i = 0; vowels[i] != 0; ++i )
    buffer[(unsigned int) vowels[i]] = '1';
  return buffer;
}

// Translates string into a vowel indicator string.
// Character 1 indicates a vowel, else the output character is 0.
// Parameters:
//    input - string to translate
//    output - buffer to hold the output string.
// Return:
//    output
char *vowel_one(const char input[], char output[])
{
  static const char* vowel_one_translate = NULL;
  if( vowel_one_translate == NULL )
    vowel_one_translate = vowel_one_translate_generate();
  size_t i = 0;
  for( ; input[i] != 0; ++i )
    output[i] = vowel_one_translate[(unsigned int) input[i]];
  output[i] = 0;
  return output;
}
