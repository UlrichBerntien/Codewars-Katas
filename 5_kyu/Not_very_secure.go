package kata

import "regexp"

var allowed = regexp.MustCompile("^[0-9A-Za-z]+$")

func alphanumeric(str string) bool {
    return allowed.MatchString(str)
}