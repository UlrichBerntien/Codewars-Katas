package kata

import (
	"regexp"
	"strconv"
	"strings"
)

var pattern = regexp.MustCompile(`^[+-]?\d{0,2}(\.\d*)?,\s[+-]?\d{0,3}(\.\d*)?$`)

func IsValidCoordinates(coordinates string) bool {
	if !pattern.MatchString(coordinates) {
		return false
	}
	splited := strings.Split(coordinates, ", ")
	if len(splited) != 2 {
		return false
	}
	latitude, error0 := strconv.ParseFloat(splited[0], 64)
	longitude, error1 := strconv.ParseFloat(splited[1], 64)
	return error0 == nil && error1 == nil &&
		-90.0 <= latitude && latitude <= +90.0 &&
		-180.0 <= longitude && longitude <= +180.0
}
