local solution = {}

-- Calculates mortagage payment.
-- Arguments:
--    rate     - annual rate, percent
--    balance  - original balance
--    term     - number of monthly payments (loan's term)
--    nPayment - number of payment to calculate (from 1 to term)
-- Return:
--    Report as a string
--    "num_payment %d c %.0f princ %.0f int %.0f balance %.0f"
--    with arguments number of payment, payment c, princ, int, current balance
-- See:
--    https://en.wikipedia.org/wiki/Mortgage_calculator
function solution.amort(rate, balance, term, nPayment)
  if type(rate) ~= "number" or rate <= 0 or rate > 100 then
    return "ARGUMENT ERROR: invalid rate"
  end
  if type(balance) ~= "number" or balance <= 0 then
    return "ARGUMENT ERROR: invalid balance"
  end
  if type(balance) ~= "number" or term <= 0 then
    return "ARGUMENT ERROR: invalid term"
  end
  if type(nPayment) ~= "number" or nPayment <= 0 or nPayment > term then
    return "ARGUMENT ERROR: invalid nPayment"
  end
  local rate_monthly_factor = rate/1200
  local f = (1+rate_monthly_factor)^term
  local payment_monthly = (rate_monthly_factor*f*balance)/(f-1)
  local princ, int
  for n = 1,nPayment do
    int = balance * rate_monthly_factor
    princ = payment_monthly - int
    balance = balance - princ
  end
  return string.format("num_payment %.0f c %.0f princ %.0f int %.0f balance %.0f",nPayment,payment_monthly,princ,int,balance)
end

return solution