package kata

import "math"

func FindNextSquare(sq int64) int64 {
	// Calculate estimation for integer root
	rootFloat := math.Sqrt(float64(sq))
	root := int64(math.Trunc(rootFloat))
	// Try to calculate exact root
	for root*root < sq {
		root++
	}
	if root*root != sq {
		// No root found
		return -1
	}
	// Goto next square
	root++
	return root * root
}
