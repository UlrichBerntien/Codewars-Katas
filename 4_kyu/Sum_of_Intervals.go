package kata

import "sort"

// Interface to sort array of intervals by interval start.
// Each interval is an intervall {start, end} including start and end.
type byIntervalStart [][2]int

// Number of intervals.
func (a byIntervalStart) Len() int {
	return len(a)
}

// Swap two intervalls in the array.
// i, j are indices in the array.
func (a byIntervalStart) Swap(i, j int) {
	a[i][0], a[j][0] = a[j][0], a[i][0]
	a[i][1], a[j][1] = a[j][1], a[i][1]
}

// Less start point.
// i, j are indices in the array.
func (a byIntervalStart) Less(i, j int) bool {
	// This less compare is only a compare of the intervall start.
	return a[i][0] < a[j][0]
}

func SumOfIntervals(intervals [][2]int) int {
	if intervals == nil || len(intervals) == 0 {
		return 0
	}
	sorted := make([][2]int, len(intervals))
	copy(sorted, intervals)
	sort.Sort(byIntervalStart(sorted))
	sum := 0
	currentStart := sorted[0][0]
	currentEnd := sorted[0][1]
	for currentIndex := 1; currentIndex < len(sorted); currentIndex++ {
		if sorted[currentIndex][0] <= currentEnd {
			// overlap
			if currentEnd < sorted[currentIndex][1] {
        // the current interval expands the collected interval
        currentEnd = sorted[currentIndex][1]
      }
		} else {
			// add length of last interval
			sum += currentEnd - currentStart
			// the new current interval
			currentStart = sorted[currentIndex][0]
			currentEnd = sorted[currentIndex][1]
		}
	}
	// add last interval
	sum += currentEnd - currentStart
	return sum
}
