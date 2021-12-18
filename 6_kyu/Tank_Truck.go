package kata

import m "math"

// Area of a cirle with radius r
// https://en.wikipedia.org/wiki/Area_of_a_circle
func circleArea(r float64) float64 {
	return m.Pi * r * r
}

// Area of a cirle segment
// r - Radius of the circle
// h - height of the segment h <= r
// https://en.wikipedia.org/wiki/Circular_segment
func cicleSegmentArea(r, h float64) float64 {
	r2 := r * r
	rh := r - h
	return r2*m.Acos(1-h/r) - rh*m.Sqrt(r2-rh*rh)
}

func TankVol(h, d, vt int) int {
	if vt < 1 || d < 1 || d < h {
		// error exit
		return 0
	}
	r := float64(d) / 2
	volumeTotal := float64(vt)
	areaTotal := circleArea(r)
	var areaFilled float64
	if 2*h > d {
		areaFilled = areaTotal - cicleSegmentArea(r, float64(d-h))
	} else {
		areaFilled = cicleSegmentArea(r, float64(h))
	}
	volumeFilled := volumeTotal * areaFilled / areaTotal
	return int(volumeFilled)
}