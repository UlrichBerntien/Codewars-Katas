package kata

// wrap length with a and b are the sides of the largest area.
func wrap(a, b, c int) int {
	// add 20 cm for the loop
	return 2*(a+b+2*c) + 20
}

func WrapPresent(a, b, c int) int {
	// calculate all areas
  // considers product of two int could be above max-int
	bc := float64(b) * float64(c)
	ac := float64(a) * float64(c)
	ab := float64(a) * float64(b)
	// wrap length depends on the largest area
	switch {
	case bc >= ac && bc >= ab:
		return wrap(b, c, a)
	case ac >= bc && ac >= ab:
		return wrap(a, c, b)
	default:
		return wrap(a, b, c)
	}
}
