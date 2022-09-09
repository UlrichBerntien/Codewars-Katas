// Calculates the area if it is a square or the perimeter if it is a rectangle.
int area_or_perimeter(const int l , const int w) {
  return l == w ? l*l : 2*(l+w);
}