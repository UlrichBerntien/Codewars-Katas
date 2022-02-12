package kata

import "math"

// Gravity acceleration at earth surface
const earth_gravity float64 = 9.81

// Factor to convert km/h into m/s
const ms2kmh float64 = 3.6

func Dist(v, mu float64) float64 {
	// convert from km/h to m/s
	v /= ms2kmh
	// Reaction time: 1 second
	return v + v*v/2/mu/earth_gravity
}

func Speed(d, mu float64) float64 {
	mug := mu * earth_gravity
	v := (math.Sqrt(1+2*d/mug) - 1) * mug
	// Convert m/s in km/h
	return v * ms2kmh
}
