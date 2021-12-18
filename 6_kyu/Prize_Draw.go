package kata

import (
	"sort"
	"strings"
)

// Name and winning number.
type nameNumber struct {
	// The Name.
	name string
	// Upper case name, e.g. for alphabetically sort.
	nameUpper string
	// The winning number defined in the kata.
	number int
}

// Create name&number.
func makeNameNumber(name string, weight int) nameNumber {
	name = strings.TrimSpace(name)
	upper := strings.ToUpper(name)
	sum := len(upper)
	for _, r := range upper {
		if 'A' <= r && r <= 'Z' {
			sum += int(r-'A') + 1
		}
	}
	return nameNumber{name: name, nameUpper: upper, number: sum * weight}
}

// Array of name&number structures.
type nameNumberArray []nameNumber

// Length of the array.
func (a nameNumberArray) Len() int {
	return len(a)
}

// Swap two elements in the array.
func (a nameNumberArray) Swap(i, j int) {
	a[i], a[j] = a[j], a[i]
}

// Compare two elements in the array.
// Sort order: 1. decreasing winning number
//             2. increasing alphabetically names.
func (a nameNumberArray) Less(i, j int) bool {
	return (a[i].number > a[j].number) || (a[i].number == a[j].number && a[i].nameUpper < a[j].nameUpper)
}

func NthRank(nameList string, weights []int, index int) string {
  names := strings.Split(nameList, ",")
	numberNames := len(names)
  if len(nameList) == 0 || numberNames < 1 {
		return "No participants"
	}
	if index < 1 {
		return "index error"
	}
	if numberNames < index {
		return "Not enough participants"
	}
	if len(weights) < numberNames {
		return "Not enough weights"
	}
	a := make(nameNumberArray, numberNames)
	for i := 0; i < numberNames; i++ {
		a[i] = makeNameNumber(names[i], weights[i])
	}
	sort.Sort(a)
	return a[index-1].name
}
