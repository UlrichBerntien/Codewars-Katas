#define __STDC_WANT_LIB_EXT2__ 1
#include <ctype.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


// Type to store name - numerical value pairs.
// factor indicates a factor to the value left hand side of the name, e.g. thousand.
typedef struct {
  const char *const name;
  const long value;
  const bool factor;
}
name_value_t;


// Table of english number words.
// All words are lower case.
// Table is SORTED by name to use bsearch!
static const name_value_t name_value_table[] = {
    { "and" ,0, false}, 
    { "eight" ,8, false},	
    { "eighteen" , 18, false},	
    { "eighty" , 80, false},
    { "eleven" , 11, false},
    { "fifteen" , 15, false},	
    { "fifty" , 50, false},	
    { "five" , 5, false},	
    { "forty" , 40, false},	
    { "four" , 4, false},
    { "fourteen" , 14, false},	
    { "hundred", 100, true},
    { "million", 1000000, true},
    { "nine" , 9, false},
    { "nineteen", 19, false},
    { "ninety", 90, false},
    { "one" , 1, false},
    { "seven" ,7, false},	
    { "seventeen" , 17, false},	
    { "seventy" , 70, false},	
    { "six" , 6, false},
    { "sixteen" , 16, false},
    { "sixty" , 60, false},	
    { "ten" , 10, false},
    { "thirteen" , 13, false},
    { "thirty" , 30, false},	
    { "thousand", 1000, true},
    { "three" ,3, false},	
    { "twelve" , 12, false},	
    { "twenty" , 20, false},	
    { "two" , 2, false},	
    { "zero" ,0, false}, 
};

// Number of entries in the table.
static const size_t name_value_table_len = sizeof name_value_table/ sizeof (name_value_t);


// Number separator characters.
static const char number_separators[] = "\t\n -";


// Compare names in the name_value_t struct.
// Compare function as needed in bsearch.
static int name_compare (const void *const p_key, const void *const p_element)
{
  const char *const key = p_key;
  const name_value_t *const element = p_element;
  return strcmp(key, element->name);
}


// Get name value information from internal table.
// Return NULL if word is not in the table.
static const name_value_t* get_value( const char name[] ) {
  const void *const result =
      bsearch(name,
              name_value_table, name_value_table_len, sizeof (name_value_t),
              name_compare );
  return result;
}


// Converts inplace the string to lowercase.
static void strtolower( char* str ) {
  while( *str++ ) {
    *str = tolower(*str);
  }
}


long parse_int (const char number []) {
  char *const work = strdup(number);
  strtolower(work);
  long accu = 0;
  long last_number = 0;
  long last_factor = 0;
  const char* word = strtok(work, number_separators);
  while( word != NULL ) {
    const name_value_t *const parsed = get_value(word);
    if( parsed == NULL )
      fprintf(stderr, "ERROR: ignore word '%s'\n", word);
    else if( parsed->factor ) {
      if( last_factor > parsed->value )
        accu = (accu-last_number) + last_number * parsed->value;
      else
        accu *= parsed->value;
      last_factor = parsed->value;
    } else {
      last_number = parsed->value;
      accu += last_number;
    }
    word = strtok(NULL, number_separators);
  }
  free(work);
  return accu;
}
