package kata

import (
	"math/bits"
	"sort"
)

// Planet Twisted 3-7 number.
// The digit '3' has value 7. The digit '7' has value 3.
type twistedNumber struct {
	value   int // value of the number
	display int // this number as decimal is to display the number
}

// Convert a display integer into the internal stored twisted number.
// The value of x must be reinterpreted.
func display2twisted(number int) twistedNumber {
	digits := make([]int, 0, bits.UintSize/3)
	changed := false
	x := number
	// Handle negative values
	neg := x < 0
	if neg {
		x = -x
	}
	// Split number into digits
	for x > 0 {
		d := x % 10
		// reinterpret the values of digit '3' and '7'
		if d == 3 {
			d = 7
			changed = true
		} else if d == 7 {
			d = 3
			changed = true
		}
		digits = append(digits, d)
		x /= 10
	}
	v := 0
	if changed {
		// Rebuild number from digits
		for i := len(digits) - 1; i >= 0; i-- {
			v = v*10 + digits[i]
		}
		if neg {
			v = -v
		}
	} else {
		// runtime optimization: does not need to calculate a new value
		v = number
	}
	return twistedNumber{value: v, display: number}
}

// Array type for sort.Interface
// Store the structures in the array, not pointers to the structs because the structs are small.
type twistedNumberArray []twistedNumber

// Returns length of the array.
// Len is part of sort.Interface.
func (s twistedNumberArray) Len() int { return len(s) }

// Swap items i and j in the array.
// Swap is part of sort.Interface.
func (s twistedNumberArray) Swap(i, j int) { s[i], s[j] = s[j], s[i] }

// byValue implements sort.Interface by providing Less.
// Sorts the twisted numbers by value.
type byValue struct{ twistedNumberArray }

// Less compare operator between elements i and j in the array
// Less is part of sort.Interface.
func (s byValue) Less(i, j int) bool {
	return s.twistedNumberArray[i].value < s.twistedNumberArray[j].value
}

func SortTwisted37(arr []int) []int {
	// Convert the display numbers into the internal structure with real value inside.
	tNumbers := make(twistedNumberArray, len(arr))
	for i, x := range arr {
		tNumbers[i] = display2twisted(x)
	}
	// Sort the numbers by the real values.
	sort.Sort(byValue{tNumbers})
	// Return the integers to display the numbers, not the real values of the numbers.
	result := make([]int, len(arr))
	for i := 0; i < len(arr); i++ {
		result[i] = tNumbers[i].display
	}
	return result
}
