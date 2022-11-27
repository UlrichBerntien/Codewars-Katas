#include <stddef.h>
#include <string.h>

size_t mag_number(const char weapon_name[], const size_t streets) {
  size_t bullets = 1;
  if( strcmp(weapon_name, "PT92") == 0 )
     bullets = 17;
  else if( strcmp(weapon_name, "M4A1") == 0 )
     bullets = 30;
  else if( strcmp(weapon_name, "M16A2") == 0 )
      bullets = 30;
  else if( strcmp(weapon_name, "PSG1") == 0 )
      bullets = 5;
  return (streets*3 + bullets - 1) / bullets;
}
