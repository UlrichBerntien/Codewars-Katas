package kata

func SpinningRings(innerMax, outerMax int) int {
	if innerMax < 1 || outerMax < 1 {
		panic("invalid arguments")
	}
	// Number of numbers on each ring (numbers are 0,1,..,max)
	innerN := innerMax + 1
	outerN := outerMax + 1
	// Start position: the rings are moved 0 step each
	counter := 1
	innerCurrent := innerMax
	outerCurrent := 1
	// Move the both rings until an equal number pair is showen
	for innerCurrent != outerCurrent {
		delta := innerCurrent - outerCurrent
		steps := delta / 2
		if delta&1 == 0 && steps >= 0 && steps <= innerCurrent && steps < outerN-outerCurrent {
			// The difference between the two rings is a multipe of 2.
			// The equal point is reached without one ring is turned through 0.
		} else if innerCurrent+1 < outerN-outerCurrent {
			// turn until inner rings goes through 0 to 1
			steps = innerCurrent + 1
		} else {
			// turn until outer ring gos through outerMax to 0
			steps = outerN - outerCurrent
		}
		innerCurrent -= steps
		if innerCurrent < 0 {
			innerCurrent += innerN
		}
		outerCurrent += steps
		if outerCurrent > outerMax {
			outerCurrent -= outerN
		}
		counter += steps
	}
	return counter
}
