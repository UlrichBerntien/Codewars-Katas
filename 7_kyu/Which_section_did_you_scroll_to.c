#include <stdlib.h>

int get_section_id(int scroll, int *sizes, size_t sizes_length) {
  for( size_t i = 0; i < sizes_length; ++i )
    if( (scroll -= sizes[i]) < 0 )
      return (int) i;
  return -1;
}
