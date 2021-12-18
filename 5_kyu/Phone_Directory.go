package kata

import (
	"fmt"
	"regexp"
	"strings"
)

// selectLines from dir containing the marker.
// Lines in dir are separated be \n.
func selectLines(dir, marker string) []string {
	accu := make([]string, 0)
	for _, line := range strings.Split(dir, "\n") {
		if strings.Contains(line, marker) {
			accu = append(accu, strings.TrimSpace(line))
		}
	}
	return accu
}

// entry can hold the content of one line in the directory.
type entry struct {
	phone, name, address string
}

// Regular expression pattern to extract parts of a phone book line.
var (
	namePattern       = regexp.MustCompile(`<.+>`)
	phonePattern      = regexp.MustCompile(`\+\d{1,2}-\d{3}-\d{3}-\d{4}`)
	multiSpacePattern = regexp.MustCompile(`[\s_$*:!?,;\\/]+`)
)

// extract substring given by a regular expresssion pattern.
// Reaplces the extractet substring by a space.
func extract(pattern *regexp.Regexp, data string) (hit, rest string) {
	index := pattern.FindStringIndex(data)
	if index != nil {
		hit = data[index[0]:index[1]]
		rest = data[0:index[0]] + " " + data[index[1]:]
	}
	return
}

// parse a line.
func parse(line string) (result entry) {
	hit, rest := extract(namePattern, line)
	if hit != "" {
		// Name without the < > around.
		result.name = strings.TrimSpace(hit[1 : len(hit)-1])
	}
	hit, rest = extract(phonePattern, rest)
	if hit != "" {
		// Phone number without the leading +.
		result.phone = hit[1:]
	}
	// Normalise spaces in address.
	// Replaces double spaces and characters used as separators by one space.
	rest = multiSpacePattern.ReplaceAllLiteralString(rest, " ")
	result.address = strings.TrimSpace(rest)
	return
}

func Phone(dir, num string) string {
	var hit *entry
	// All numbers starts with + in the dictionary.
	numCode := "+" + num
	// Parses only lines which could match the phone number
	for _, line := range selectLines(dir, numCode) {
		info := parse(line)
		// Now test the phone number to ensure the number is correct
		if info.phone == num {
			if hit != nil {
				return "Error => Too many people: " + num
			}
			hit = &info
		}
	}
	if hit == nil {
		return "Error => Not found: " + num
	}
	return fmt.Sprintf("Phone => %s, Name => %s, Address => %s", hit.phone, hit.name, hit.address)
}
