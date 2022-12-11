// Power of i.
// Returns i^n as constant string.
// Do not free the returnd string.
const char * pofi(const unsigned n) {
  switch (n % 4) {
  case 0:
    return "1";
  case 1:
    return "i";
  case 2:
    return "-1";
  case 3:
    return "-i";
  };
  return "";
}
