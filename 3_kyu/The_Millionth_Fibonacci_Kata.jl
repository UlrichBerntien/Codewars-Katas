function fib(n::Int)::BigInt
    # https://www.nayuki.io/page/fast-fibonacci-algorithms
    # fast doubling algorithm
    # Returns the tuple (fib(n), fib(n+1)).
    function F(n::Int)::Tuple{BigInt,BigInt}
	      if n == 0
		        (BigInt(0), BigInt(1))
	      else
            k,m = divrem(n,2)
		        Fk,Fkp1 = F(k)
		        c = Fk * (2 * Fkp1 - Fk)
		        d = Fk^2 + Fkp1^2
		        if m == 0
			          (c, d)
		        else
			          (d, c + d)
            end
        end            
    end

    if n < 0
        F(n)[1] * ( n%2 == 0 ? -1 : +1 )
    else
        F(n)[1]
    end
end
