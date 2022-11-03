int duty_free(const int price, const int discount, const int holiday_cost)
{
  return ((long long) holiday_cost * 100)/((long long) price * discount);
}
