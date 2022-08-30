typedef struct Laps_Pairing {
    int bob;
    int charles;
} laps;

// Returns greatest common diivsor.
static int gcd(int a, int b)
{
  // Eucilidian algorithm.
  while(b > 0)
  {
    const int t = b;
    b = a % b;
    a = t;
  }
  return a;
}

// Calculate number of laps for each runner after they meet again.
// Assumption: Each runner has the same speed.
laps nbr_of_laps(const int bob_lap_length, const int charles_lap_length)
{
  const int g = gcd(bob_lap_length, charles_lap_length);
  const laps result = {charles_lap_length/g, bob_lap_length/g};
  return result;
}
