package kata

import "math"

// Calculate the maximal possible number of units.
// recipies: Needed ingredients per unit (cake).
// available: available ingeredients.
func Cakes(recipe, available map[string]int) int {
	min := math.MaxInt
	for name, needed := range recipe {
		possible := available[name] / needed
		if possible < min {
			min = possible
		}
	}
	return min
}
