#include <math.h>
#include <stdbool.h>

// Checks if year is a lear year.
// Arguments:
//    orbit = time of one solar year in day units
//    year = year to check
// Return:
//    true - leap year / false - no leap year
bool is_leap_year(const double orbit, const unsigned year) {
  const double remain = orbit - floor(orbit);
  // no leap years at all
  if( remain <= 0 )
    return false;
  // leap year period
  const unsigned period = (int)( 1. / remain );
  // assume leap calculation starts at year 0
  return year % period == 0;
}
