// Rounds up to next multiple of 5.
int round_to_next5(const int n) {
  int rounded = (n/5)*5;
  if( rounded < n ) rounded += 5;
  return rounded;
}
