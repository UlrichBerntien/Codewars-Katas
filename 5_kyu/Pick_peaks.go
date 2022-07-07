package kata

// Positions and values of the peaks.
type PosPeaks struct {
	Pos   []int // index of the peak
	Peaks []int // value of the peak
}

// Find peaks in the array.
// No peaks at the edges of the array.
func PickPeaks(array []int) PosPeaks {
	peaks := PosPeaks{Pos: make([]int, 0), Peaks: make([]int, 0)}
	if len(array) < 3 {
		// No values inside the data, only edges in the array.
		return peaks
	}
	last := len(array) - 1
	peakCandidate := 0
	for index := 1; index < last; index++ {
		if array[index] > array[index-1] {
			// The current position could be a peak because it is above than left hand side
			peakCandidate = index
		}
		if array[index] > array[index+1] && peakCandidate > 0 {
			// The peakCandidate is above the right hand side.
			// Hence ths candiate is a peak, a local maximum.
			peaks.Pos = append(peaks.Pos, int(peakCandidate))
			peaks.Peaks = append(peaks.Peaks, array[peakCandidate])
			peakCandidate = 0
		}
	}
	return peaks
}
