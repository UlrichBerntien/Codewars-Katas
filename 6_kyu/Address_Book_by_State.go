package kata

import (
	"bytes"
	"fmt"
	"sort"
	"strings"
)

// stateCodeToName is map from state code to state name.
var stateCodeToName = map[string]string{
	"AZ": "Arizona",
	"CA": "California",
	"ID": "Idaho",
	"IN": "Indiana",
	"MA": "Massachusetts",
	"OK": "Oklahoma",
	"PA": "Pennsylvania",
	"VA": "Virginia",
}

// parse extracts address and state from a book line.
// State is translated from code to name.
// Separators ',' are removed from address.
func parse(line string) (address, state string) {
	if len(line) > 3 {
		stateCode := line[len(line)-2:]
		state = stateCodeToName[stateCode]
		address = strings.ReplaceAll(line[:len(line)-3], ",", "")
	}
	return
}

// sortAndPrints the address book.
// Side effect: Sorts the addresses in the lists.
func sortAndPrint(addressListByState map[string][]string) string {
  // sort the state names
	var states []string
	for state := range addressListByState {
		states = append(states, state)
	}
	sort.Strings(states)
	var accu bytes.Buffer
  // print sorted by state
	for index, state := range states {
		if index > 0 {
			accu.WriteString("\n ")
		}
		accu.WriteString(state)
    // in a state sort the addesses
		sort.Strings(addressListByState[state])
		for _, address := range addressListByState[state] {
			fmt.Fprintf(&accu, "\n..... %s %s", address, state)
		}
	}
	return accu.String()
}

func ByState(str string) string {
	// 1. Parse the address book
	addressListByState := make(map[string][]string)
	for _, line := range strings.Split(str, "\n") {
		addr, state := parse(line)
		if state != "" {
			addressListByState[state] = append(addressListByState[state], addr)
		}
		// else: ignore lines with unknown state code
	}
	// 2. sortAndPrint the address book
	return sortAndPrint(addressListByState)
}
