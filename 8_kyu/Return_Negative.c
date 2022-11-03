// Return always a non-positive value: -abs(num).
int makeNegative(const int num)
{
  return num <= 0 ? num : -num;
}