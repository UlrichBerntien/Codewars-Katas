package kata

import "regexp"

// Pattern to match a pair of bears.
var bears = regexp.MustCompile("B8|8B")

func CheckPairs(nbBear int, bearList string) (bearCouple string, hasEnoughCouple bool) {
	found := bears.FindAllString(bearList, -1)
	return ListToString(found), 2*len(found) >= nbBear
}

