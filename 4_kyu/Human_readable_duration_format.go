package kata

import "fmt"

// Information block for a time unit
type unit_t struct {
	name1  string // name string singular
	nameN  string // name string plural
	factor int64  // 1 unit = factor * next smaller unit
}

// All units sorted ascending
var units = [...]unit_t{
	{"second", "seconds", 1},
	{"minute", "minutes", 60},
	{"hour", "hours", 60},
	{"day", "days", 24},
	{"year", "years", 365},
}

// Separator for last and all other parts
var separators = [...]string{
	" and ",
	", ",
}

// Formats duration human readable.
func FormatDuration(seconds int64) string {
	result := ""
	separatorId := 0
	time := seconds
	for i, u := range units {
		part := time
		if i < len(units)-1 {
			part %= units[i+1].factor
			time /= units[i+1].factor
		}
		if part > 0 {
			name := u.nameN
			if part == 1 {
				name = u.name1
			}
			if len(result) > 0 {
				result = fmt.Sprintf("%d %s%s%s", part, name, separators[separatorId], result)
				separatorId = 1
			} else {
				result = fmt.Sprintf("%d %s", part, name)
			}
		}
	}
	if len(result) == 0 {
		return "now"
	} else {
		return result
	}
}
