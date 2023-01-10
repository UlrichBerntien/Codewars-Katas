package kata

import "strings"

func TwoSort(arr []string) string {
	if arr == nil || len(arr) == 0 {
    // error exit: emptry input array
		return ""
	}
  // get first element of sorted array fast 
	first := arr[0]
	for _, s := range arr[1:] {
		if s < first {
			first = s
		}
	}
  // format the string as given by the instruction
	return strings.Join(strings.Split(first,""), "***")
}
