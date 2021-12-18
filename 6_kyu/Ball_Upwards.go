package kata

import "math"

func MaxBall(v0 int) int {
    // earth gravity acceleration in m/s²
    const g float64 = 9.81
    // factor unit m/s to km/h
    const ms_to_kmh float64 = 3.6
    // time to maximal height
    t_max := float64(v0) / ms_to_kmh / g
    return int(math.Round(t_max * 10))
}