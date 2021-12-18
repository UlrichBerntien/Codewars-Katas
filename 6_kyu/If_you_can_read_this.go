package kata

import "strings"

var nato = map[rune]string{
	'A': "Alfa",
	'B': "Bravo",
	'C': "Charlie",
	'D': "Delta",
	'E': "Echo",
	'F': "Foxtrot",
	'G': "Golf",
	'H': "Hotel",
	'I': "India",
	'J': "Juliett",
	'K': "Kilo",
	'L': "Lima",
	'M': "Mike",
	'N': "November",
	'O': "Oscar",
	'P': "Papa",
	'Q': "Quebec",
	'R': "Romeo",
	'S': "Sierra",
	'T': "Tango",
	'U': "Uniform",
	'V': "Victor",
	'W': "Whiskey",
	'X': "Xray",
	'Y': "Yankee",
	'Z': "Zulu",
	'0': "Zero",
	'1': "One",
	'2': "Two",
	'3': "Three",
	'4': "Four",
	'5': "Five",
	'6': "Six",
	'7': "Seven",
	'8': "Eight",
	'9': "Nine",
	'.': ".",
	',': ",",
	'!': "!"}

func ToNato(words string) string {
	var dest strings.Builder
	last := ""
	for _, r := range strings.ToUpper(words) {
		translation := nato[r]
		if len(translation) > 0 {
			if len(last) > 0 {
				dest.WriteRune(' ')
			}
			dest.WriteString(translation)
			last = translation
		}
	}
	return dest.String()
}