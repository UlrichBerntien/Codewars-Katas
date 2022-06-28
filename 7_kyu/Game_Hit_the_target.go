package kata

// Given a matrix n x n,
// determine if the arrow is directed to the target.
// Arrow is '>' and Target is 'x'.
func Solution(mtrx [][]rune) bool {
	// Arrow and target must be in one row.
	// So scan independent row by row.
	for _, row := range mtrx {
		seen_arrow := false
		for _, r := range row {
			switch {
			case r == '>':
				// In this row is an arrow
				seen_arrow = true
			case r == 'x' && seen_arrow:
				// Target behind the arrow!
				return true
			case r == 'x':
				// Target found but no arrow before to the target.
				return false
			}
		}
	}
	// No target in the matrix
	return false
}
