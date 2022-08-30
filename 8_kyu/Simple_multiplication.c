
// Multiplies even number by 8 otherwise by 9.
int simple_multiplication(const int number) {
  return number * (number & 1 ? 9 : 8);
}