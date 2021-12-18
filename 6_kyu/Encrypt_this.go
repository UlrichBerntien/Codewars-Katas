package kata

import (
	"regexp"
	"strconv"
)

var aWord = regexp.MustCompile(`\w+`)

func encryptWord(word string) string {
	cdr := word[1:]
	if len(cdr) > 1 {
		cdr = cdr[len(cdr)-1:] + cdr[1:len(cdr)-1] + cdr[0:1]
	}
	return strconv.Itoa(int(word[0])) + cdr
}

func EncryptThis(text string) string {
	return aWord.ReplaceAllStringFunc(text, encryptWord)
}

