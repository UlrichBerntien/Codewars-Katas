package kata

import "strings"

// Returns a string array filled with a "*" triangle.
func TowerBuilder(nFloors int) []string {
	if nFloors < 1 {
		// Error exit
		return []string{}
	}
	floor := make([]string, 0, nFloors)
	base := nFloors*2 - 1
	// Prepare maximal needed number of stars and spaces in a string
	stars := strings.Repeat("*", base)
	spaces := strings.Repeat(" ", base/2)
	for level := 1; level <= nFloors; level++ {
		// number of stars at the level
		nb := level*2 - 1
		// number of spaces left and right of the stars
		ns := (base - nb) / 2
		floor = append(floor, strings.Join([]string{spaces[:ns], stars[:nb], spaces[:ns]}, ""))
	}
	return floor
}
