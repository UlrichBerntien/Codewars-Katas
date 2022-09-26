package kata

const (
	// Minutes per Kata
	minutesPerKata = 6
	// Minutes for first pushup after error
	minutesFirstPushup = 5
)

// Calculates maximal number of mistakes alex can make.
func AlexMistakes(numberOfKatas, timeLimit int) int {
	// remaining time if no mistake was make
	remain := timeLimit - numberOfKatas*minutesPerKata
	if remain < 0 {
		panic("can't do all katas")
	}
	// calculate maximal possible errors
	errors := 0
	// needed times doubles after each error
	for units := remain / minutesFirstPushup; units > 0; units = (units - 1) / 2 {
		errors++
	}
	return errors
}
