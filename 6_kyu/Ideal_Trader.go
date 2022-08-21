package kata

// Calculates the maximum possible profit from the trading.
// Input is a list of price points for buying or selling.
// Output is maximum achievable factor for the starting money.
func IdealTrader(prices []float64) float64 {
	accuFactor := 1.0
  // start calculation at the last point
	i := len(prices) - 1
	for i > 0 {
		max := prices[i]
		// sell on last local max
		for i > 0 && prices[i-1] >= max {
			i--
			max = prices[i]
		}
		// buy on last local min
		min := prices[i]
		for i > 0 && prices[i-1] <= min {
			i--
			min = prices[i]
		}
    // add the profit of the last bull market 
		accuFactor *= max / min
	}
	return accuFactor
}
