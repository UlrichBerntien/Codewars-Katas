local solution = {}


-- Sum of numbers 1 + 2 + ... + last.
local function gauss(last)
	return (last * (last + 1)) / 2
end


-- Count of integer numbers which are multiples of 3 or 5 blow limit.
function solution.solution(limit)
  -- maximal possible number
	local n = limit - 1
	-- All multiples of 3: 1*3 + 2*3 + 3*3, ...
	-- + all multiples of 5: 1*5 + 2*5 + 3*5, ...
	-- - all multiples of 15: 1*15 + 2*15 + 3*15, ...
	return 3*gauss(n//3) + 5*gauss(n//5) - 15*gauss(n//15)
end

return solution
