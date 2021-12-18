package kata

import "unicode"

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
    end := start + length
    if end > len(s) {
        end = len(s) 
    }
    return string( s[start:end] )
}

func Encode(s string, shift int) []string {
    input := []rune(s)
    encoded := make( []rune, 0, 2+len(input) )
    // create header
    firstLow := unicode.ToLower(input[0])
    encoded = append( encoded, firstLow )
    encoded = append( encoded, shiftRune(firstLow,shift) )
    // encode content
    for _,r := range input {
        encoded = append( encoded, shiftRune(r,shift))
    }
    // split
    partsLen := (len(encoded)+4) / 5
    result := make( []string, 0, 5 )
    for i := 0; i < len(encoded); i += partsLen {
        result = append(result,slice2string(encoded,i,partsLen))
    }
    return result
}

func Decode(arr []string) string {
    // Calculate shift from header
    shift := 26 + int(arr[0][0]) - int(arr[0][1])
    // decode all
    decoded := make( []rune, 0, len(arr)*len(arr[0]) )
    for _,a := range arr {
        for _,r := range a {
            decoded = append(decoded,shiftRune(r,shift))
        }
    }
    // return message without header characters
    return string( decoded[2:] )
}