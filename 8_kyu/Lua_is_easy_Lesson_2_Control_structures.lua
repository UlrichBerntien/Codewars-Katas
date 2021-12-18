kata = {}

-- Fast doubling Fibonacci algorithm
-- https://www.nayuki.io/page/fast-fibonacci-algorithms

-- Returns the F(n), F(n+1)
function fib(n)
	if n == 0 then
		return 0, 1
	else
		a, b = fib(n // 2)
		c = a * (b * 2 - a)
		d = a * a + b * b
		if n % 2 == 0 then
			return c, d
		else
			return d, c + d
    end
  end
end


function fibonacci(n)
  if n < 0 then
		error("Negative arguments not implemented")
  end
  local a,_ = fib(n)
	return a
end


function kata.solve(n) 
  return 2*fibonacci(n+1) - 1
end

return kata