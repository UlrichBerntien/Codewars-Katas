package kata

// First and last index in the string
type positions struct {
    first, last int
}

// Map of first and last index of the rune in the string
type runePositionsMap map [rune] *positions

// collect all positions (first and last) of the runes in the string
func makeRunePositions(s string) runePositionsMap {
    runePositions := make(runePositionsMap)
    for index, char := range s {
        pos := runePositions[char]
        if pos != nil {
            pos.last = index
        } else {
            pos = new(positions)
            pos.first = index
            pos.last = index
            runePositions[char] = pos
        }
    }
    return runePositions
}

// Returns the rune with maximal last-first delta.
// Returns the smaller rune if the max delta critera find more than one
func maxPositionsDelta(runePositions runePositionsMap) rune {
    var maxChar rune
    var maxDelta int = -1
    for char, pos := range runePositions {
        delta := pos.last - pos.first
        if delta > maxDelta || ( delta == maxDelta && char < maxChar ) {
            maxChar = char
            maxDelta = delta
        }
    }
    return maxChar
}

// Solves the kata
func Solve(s string) rune {
    runePositions := makeRunePositions(s)
    return maxPositionsDelta(runePositions)
}
