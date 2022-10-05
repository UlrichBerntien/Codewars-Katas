package kata

// Calculates the level of the biggest beer pyramide
// can be paid with the bonus and the price per can.
func Beeramid(bonus int, price float64) int {
	if bonus <= 0 || price <= 0.0 {
		// error exit
		return 0
	}
	// number of cans be paid by the bonus
	number_cans := int(float64(bonus) / price)
	next_level := 1
	for number_cans > 0 {
		// number of paid cans after the next level
		number_cans -= next_level * next_level
		if number_cans >= 0 {
			// if the next level can be paid
			next_level++
		}
	}
	return next_level - 1
}
