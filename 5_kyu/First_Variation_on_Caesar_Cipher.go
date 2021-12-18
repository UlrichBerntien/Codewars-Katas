package kata

// Shift letters by n, others are unchanged
func shiftRune(c rune, shift int) rune {
    switch {
        case 'A' <= c && c <= 'Z' :
            return rune(int('A') + (int(c)-int('A')+shift) % 26)
        case 'a' <= c && c <= 'z' :
            return rune(int('a') + (int(c)-int('a')+shift) % 26)
        default:
            return c
    }
}

// Convert sub slice into string
func slice2string(s []rune, start, length int) string {
    if start >= len(s) {
        return ""
    }
    end := start + length
    if end > len(s) {
        end = len(s) 
    }
    return string( s[start:end] )
}

func MovingShift(s string, shift int) []string {
    input := []rune(s)
    encoded := make( []rune, 0, len(input) )
    // encode content
    for _,r := range input {
        encoded = append( encoded, shiftRune(r,shift))
        shift = ( shift + 1 ) % 26
    }
    // split
    partsLen := (len(encoded)+4) / 5
    result := make( []string, 5 )
    for i,_ := range result {
        result[i] = slice2string(encoded,i*partsLen,partsLen)
    }
    return result
}

func DemovingShift(arr []string, shift int) string {
    // reverse shift
    shift = 26 - shift
    // decode all
    decoded := make( []rune, 0, len(arr)*len(arr[0]) )
    for _,a := range arr {
        for _,r := range a {
            decoded = append(decoded,shiftRune(r,shift))
            shift = ( shift + 25 ) % 26
        }
    }
    return string( decoded )
}
