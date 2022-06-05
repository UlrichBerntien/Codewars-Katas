package kata

import "sort"

// Additional time between the jobs
const service_time = 2

func Barista(coffees []int) int {
	sorted := make([]int, len(coffees))
	copy(sorted, coffees)
	// Use the shortest-job-first sheduling to minimise the total wait time
	sort.Ints(sorted)
	// wait time until job start
	waitTime := 0
	// total time until all jobs finished
	totalTime := 0
	for _, t := range sorted {
		waitTime += t
		totalTime += waitTime
		// additional time until next job can run
		waitTime += service_time
	}
	return totalTime
}
