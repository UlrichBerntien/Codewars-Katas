package kata

import (
	"sort"
	"strings"
)

func InArray(array1 []string, array2 []string) []string {
	toTestSorted := array1[:]
	sort.Strings(toTestSorted)
	result := make([]string, 0, len(toTestSorted))
	for idx, test := range toTestSorted {
		if idx == 0 || toTestSorted[idx-1] != test {
			for _, str := range array2 {
				if strings.Contains(str, test) {
					result = append(result, test)
					break
				}
			}
		}
	}
	return result
}
