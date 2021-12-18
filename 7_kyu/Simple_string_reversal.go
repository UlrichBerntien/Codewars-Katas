package kata

import "unicode"

func Solve(s string) string {
	srcRunes := []rune(s)
	srcIndex := len(srcRunes) - 1
	dstRunes := make([]rune, len(srcRunes))
	for dstIndex, originalRune := range srcRunes {
		if unicode.IsSpace(originalRune) {
      // keep the spaces
			dstRunes[dstIndex] = originalRune
		} else {
			for unicode.IsSpace(srcRunes[srcIndex]) {
				srcIndex--
			}
			dstRunes[dstIndex] = srcRunes[srcIndex]
			srcIndex--
		}
	}
	return string(dstRunes)
}
