package kata

func NbMonths(startPriceOld, startPriceNew, savingperMonth int, percentLossByMonth float64) [2]int {
	// Current price of old and new car
	currentPriceOld := float64(startPriceOld)
	currentPriceNew := float64(startPriceNew)
	// Current lost per month, relative value
	currentLost := 1. - percentLossByMonth/100.
	// Savings per month and total sum, in float for easy typing formulas
	savingPerMonth := float64(savingperMonth)
	savingTotal := 0.
	month := 0
	for currentPriceNew > savingTotal+currentPriceOld {
		// The next month
		month++
		// Car price lost increased every second month
		if month&1 == 0 {
			currentLost -= 0.5 / 100.
		}
		// Car prices goes down each month
		currentPriceOld *= currentLost
		currentPriceNew *= currentLost
		// Saving goes up each month
		savingTotal += savingPerMonth
	}
	// Return number of month to buy the car and the remaining money (rounded to int)
	return [2]int{month, int(savingTotal + currentPriceOld - currentPriceNew + 0.5)}
}
