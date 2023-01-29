squaredigits(num) =
    foldr( (x,accu) -> (s=x^2; muladd(s<10 ? 10 : 100,accu,s)), digits(num); init=0 )