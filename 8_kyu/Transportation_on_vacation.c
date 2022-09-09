unsigned rental_car_cost(const unsigned d)
{
  unsigned cost = 40u * d;
  if( d >= 7u )
    cost -= 50u;
  else if( d >= 3u )
    cost -= 20u;
  return cost;
}