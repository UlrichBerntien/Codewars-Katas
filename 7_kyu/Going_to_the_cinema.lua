local solution = {}

-- Calculates number of cinema visits until pay system A is not cheaper.
-- Arguments
--    card - card price to start pay system B
--    ticker - ticket price per visit in pay system A
--    perc - reducing factor for ticket at each visit in pay system B
-- Return
--    Number of visits until pay system A is not cheaper
function solution.movie(card, ticket, perc)
  assert(card >= 0, "argument #1 error: card price must be not-negative")
  assert(ticket > 0, "argument #2 error: ticket price must be postive")
  assert(0 <= perc and perc < 1, "argument +3 error: fraction must be in range [0,1[")
  local n = 0
  local sumA = 0
  local sumB = card
  local reducedTicket = ticket
  while sumA <= math.ceil(sumB) do
    n = n + 1
    sumA = sumA + ticket
    reducedTicket = reducedTicket * perc
    sumB = sumB + reducedTicket
  end
  return n
end

return solution
