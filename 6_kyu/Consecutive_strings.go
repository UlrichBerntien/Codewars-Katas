package kata

import "strings"

// Make array of length of the strings
func makeLenArray(stringArray []string) []int {
	lenArray := make([]int, len(stringArray))
	for i, s := range stringArray {
		lenArray[i] = len(s)
	}
	return lenArray
}

// Sum numbers in the array
func sum(num []int) int {
	accu := 0
	for _, v := range num {
		accu += v
	}
	return accu
}

func LongestConsec(stringArray []string, k int) string {
	n := len(stringArray)
	if n < k || k <= 0 {
		return ""
	}
	lenArray := makeLenArray(stringArray)
	maxIndex := 0
	maxLen := sum(lenArray[0:k])
	sumLen := maxLen
	for index := 1; index <= n-k; index++ {
		sumLen += lenArray[index-1+k] - lenArray[index-1]
		if sumLen > maxLen {
			maxLen = sumLen
			maxIndex = index
		}
	}
	return strings.Join(stringArray[maxIndex:maxIndex+k], "")
}
