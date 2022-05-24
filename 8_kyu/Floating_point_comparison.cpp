#include <cmath>
using namespace std;

bool approx_equals(const double a, const double b) {
  return fabs(a-b) <= 0.001;
}