module Solution
  export rentalcarcost
  rentalcarcost(d) = 40d - (d≥7 ? 50 : d≥3 ? 20 : 0)
end