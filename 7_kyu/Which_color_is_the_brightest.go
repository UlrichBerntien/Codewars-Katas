package kata

// Gets value of the brightes channel of the color.
// Color must be in format "#rrggbb" with hex values 00..FF
func brightestChannel(color string) string {
	if len(color) != 7 || color[0] != '#' {
		// Error exit
		return "#00"
	}
	accu := color[1:3]
	for n := 3; n < 6; n += 2 {
		t := color[n : n+2]
		if t > accu {
			accu = t
		}
	}
	return accu
}

// Returns color with brightes color channel.
// Returns first of maximal color channel is more than one in the list.
func Brightest(colors []string) string {
	if len(colors) < 1 {
		// Error exit
		return "#000000"
	}
	accu := colors[0]
	maxChannel := brightestChannel(accu)
	for i := 1; i < len(colors); i++ {
		m := brightestChannel(colors[i])
		if m > maxChannel {
			accu = colors[i]
			maxChannel = m
		}
	}
	return accu
}
