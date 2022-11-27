#include <stdlib.h>
#include <string.h>


// Constant array of language/welcome pairs.
// Item 2i: language
// Item 2i+1: welcome message
// Array must be sorted by language, prepared for bsearch.
static const char *const LANGUAGE_WELCOME [] = {
  "czech", "Vitejte",
  "danish", "Velkomst",
  "dutch", "Welkom",
  "english", "Welcome",
  "estonian", "Tere tulemast",
  "finnish", "Tervetuloa",
  "flemish", "Welgekomen",
  "french", "Bienvenue",
  "german", "Willkommen",
  "irish", "Failte",
  "italian", "Benvenuto",
  "latvian", "Gaidits",
  "lithuanian", "Laukiamas",
  "polish", "Witamy",
  "spanish", "Bienvenido",
  "swedish", "Valkommen",
  "welsh", "Croeso" };


// Fallback welcome message.
static const char FALLBACK_WELCOME [] = "Welcome";


// Compare string and item in list of strings. 
static int comp(const void *k, const void *pv)
{
  const char* key = (const char*) k;
  const char* value = *(const char**) pv;
  return strcmp(key, value);
}


// Returns welcome message in the given language.
// Returns englich welcome if language is unkown.
// Returns a static string. Caller must nt free the string.
const char* greet(const char language[] )
{
  if( language == NULL )
    return FALLBACK_WELCOME;
  void *const r = bsearch( language,
                           LANGUAGE_WELCOME,
                           (sizeof LANGUAGE_WELCOME)/(2 * sizeof (char*)),
                           2 * sizeof (char*),
                           (int (*)(const void *, const void *)) comp );
  const char *const *const result = (const char**) r;
  return result ? result[1] : FALLBACK_WELCOME;
}
