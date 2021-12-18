package kata

import "regexp"

var consonantsPattern = regexp.MustCompile("[aeiou]")

func valueOfString(str string) int {
    accu := 0
    for _,c := range str {
        accu += int(c) - int('a')+1
    }
    return accu
}

func solve(str string) int {
    maxValue := 0
    for _,substring := range consonantsPattern.Split(str,-1) {
        subValue := valueOfString(substring)
        if subValue > maxValue { maxValue = subValue }
    }
    return maxValue  
}