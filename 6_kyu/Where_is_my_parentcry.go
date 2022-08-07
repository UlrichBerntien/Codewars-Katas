package kata

import "strings"

// ASCII alphabet letters length
const lenAZ = int('Z') - int('A') + 1

// Sorts string like 'AaaBbbDdddd'.
// Removes all non-ASCII letters.
func FindChildren(dancingBrigade string) string {
	// bucket sort, linear in run time O(n)
	var uppers [lenAZ]int
	var lowers [lenAZ]int
	for _, r := range dancingBrigade {
		if 'A' <= r && r <= 'Z' {
			uppers[r-'A']++
		} else if 'a' <= r && r <= 'z' {
			lowers[r-'a']++
		}
	}
	var accu strings.Builder
	// Allocate maximal possible size
	accu.Grow(len(dancingBrigade))
	for i := 0; i < lenAZ; i++ {
		for k := 0; k < uppers[i]; k++ {
			accu.WriteByte(byte(i + 'A'))
		}
		for k := 0; k < lowers[i]; k++ {
			accu.WriteByte(byte(i + 'a'))
		}
	}
	return accu.String()
}
