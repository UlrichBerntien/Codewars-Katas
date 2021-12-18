package kata

import "math"

// Time to lift the harvester
const liftTime = 1.0

// Distance between two points.
func distance(a, b []int) float64 {
	if len(a) != 2 || len(b) != 2 {
		return math.NaN()
	}
	dx := float64(a[0] - b[0])
	dy := float64(a[1] - b[1])
	return math.Sqrt(dx*dx + dy*dy)
}

// Time to reach target.
func timeToTarget(target [2]int, runner [3]int) float64 {
	if runner[2] < 0 {
		return math.NaN()
	}
	return distance(target[:], runner[:2]) / float64(runner[2])
}

func HarvesterRescue(data Data) string {
	catchTime := timeToTarget(data.Harvester, data.Worm)
	rescueTime := liftTime + timeToTarget(data.Harvester, data.Carryall)
	if catchTime <= rescueTime {
		return "Damn the spice! I'll rescue the miners!"
	} else {
		return "The spice must flow! Rescue the harvester!"
	}
}
