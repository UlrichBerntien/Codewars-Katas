package kata

import (
	"sort"
	"strings"
)

// Map rune (A-Z) to bit translation
var runeToBit = map[rune]int{
	'A': 1,
	'B': 2,
	'C': 4,
	'D': 8,
	'E': 16,
	'F': 32,
	'G': 64,
	'H': 128,
	'I': 256,
	'J': 512,
	'K': 1024,
	'L': 2048,
	'M': 4096,
	'N': 8192,
	'O': 16384,
	'P': 32768,
	'Q': 65536,
	'R': 131072,
	'S': 262144,
	'T': 524288,
	'U': 1048576,
	'V': 2097152,
	'W': 4194304,
	'X': 8388608,
	'Y': 16777216,
	'Z': 33554432}

// Convert string to bit pattern
func stringToBits(s string) int {
	accu := 0
	for _, r := range s {
		if 'A' <= r && r <= 'Z' {
			// upper case = 1, lower case = 0
			accu += runeToBit[r]
		}
	}
	return accu
}

// Bit pattern (0 or 1) plus masked bits (1 means bit is ignored)
type trinaries struct {
	patternBits int
	ignoredBits int
}

//
func (tri *trinaries) String(N int) string {
	var dest strings.Builder
	bitn := 1
	bitSymbol := 'A'
	for n := 0; n < N; n++ {
		if tri.ignoredBits&bitn == 0 {
			if tri.patternBits&bitn != 0 {
				dest.WriteRune(bitSymbol)
			} else {
				dest.WriteRune(bitSymbol - ('A' - 'a'))
			}
		}
		bitn *= 2
		bitSymbol++
	}
	return dest.String()
}

func MinQuine(s string) []string {
	// store all patterns as ints for fast search
	patterns := strings.Split(s, " ")
	N := len(patterns[0])
	var setOfBits = make(map[int]bool)
	for _, pattern := range patterns {
		setOfBits[stringToBits(strings.TrimSpace(pattern))] = true
	}
	// collect all N-1 terms
	var setOfTrinaries = make(map[trinaries]bool)
	bitn := 1
	for n := 0; n < N; n++ {
		for pattern := range setOfBits {
			if setOfBits[pattern^bitn] {
				// value of bitn can be masked, because 0 and 1 gives same result
				tri := trinaries{pattern &^ bitn, bitn}
				setOfTrinaries[tri] = true
			}
		}
		bitn *= 2
	}
	// convert patterns back to strings
	var result = make([]string, 0, len(setOfTrinaries))
	for tri := range setOfTrinaries {
		result = append(result, tri.String(N))
	}
	// sort the strings
	sort.Strings(result)
	return result
}
