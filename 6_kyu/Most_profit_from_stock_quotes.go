package kata

// Return the most profit from stock quotes.
// Parameter: Stock quotes in order of date.
func GetMostProfitFromStockQuotes(quotes []int) int {
	// For best stragie: knwolege of the maximal quote in future
	n := len(quotes)
	futureMax := make([]int, n)
	max := quotes[n-1]
	for i := n - 1; i >= 0; i-- {
		if quotes[i] > max {
			max = quotes[i]
		}
		futureMax[i] = max
	}
	// total profit by all past solds
	profit := 0
	// current number stocks
	in := 0
	// cost of current stocks
	cost := 0
	for i, q := range quotes {
		if q < futureMax[i] {
			// Price will go up -> buy
			// Buy is limited to 1 per day.
			in++
			cost += quotes[i]
		}
		if q == futureMax[i] {
			// Price never go higher in future -> sell
			profit += in*quotes[i] - cost
			in = 0
			cost = 0
		}
	}
	return profit
}
