#include <string.h>

// The one and only lightsaber owner.
static const char owner[] = "Zach";
static const int count = 18;

// Returns number of lightsabers of the given owner name.
int HowManyLightsabersDoYouOwn(const char *const name) {
  return strcmp(name,owner) == 0 ? count : 0;
}
