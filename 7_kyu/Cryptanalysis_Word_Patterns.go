package kata

import (
	"fmt"
	"strings"
	"unicode"
)

// Transforms word into word patters.
// Replaces each letter with the index of first occurrence.
func WordPattern(word string) string {
  // Build string fast in a strings builder
	var accu strings.Builder
	nextId := 0
  // Use map to support all runes
	ids := make(map[rune]int)
	for _, r := range word {
    // case insensitive
		r = unicode.ToLower(r)
		id, exists := ids[r]
		if !exists {
      // generate next index
			ids[r] = nextId
			id = nextId
			nextId++
		}
		fmt.Fprintf(&accu, "%d.", id)
	}
	str := accu.String()
	if len(str) > 0 {
    // strip last dot
		return str[:len(str)-1]
	} else {
		return str
	}
}
