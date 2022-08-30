int enough(const int cap, const int on, const int wait)
{
  const int overload = wait + on - cap;
  return overload > 0 ? overload : 0;
}