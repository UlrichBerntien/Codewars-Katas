package kata

import (
	"math/big"
	"sort"
	"strconv"
	"strings"
)

// Statistics
// Values truncated to integers.
type statistics struct {
	span, average, median int
}

func calculateStatistics(data []int) statistics {
	sort.Ints(data)
	dataLen := len(data)
	var result statistics
	// calculate range
	result.span = data[dataLen-1] - data[0]
	// calculate median
	if dataLen&1 != 0 {
		result.median = data[(dataLen-1)/2]
	} else {
		result.median = (data[dataLen/2-1] + data[dataLen/2]) / 2
	}
	// calculate average, keep in mind many ints result in big sum
	sum := big.NewInt(0)
	for _, x := range data {
		sum.Add(sum, big.NewInt(int64(x)))
	}
	sum.Div(sum, big.NewInt(int64(dataLen)))
	result.average = int(sum.Int64())
	return result
}

// Parses a time hh|mm|ss and returns the value in seconds.
func parseTime(time string) int {
	error := func() { panic("time is invalid:" + time) }
	splits := strings.Split(time, "|")
	if len(splits) != 3 {
		error()
	}
	accu := 0
	for _, s := range splits {
		value, err := strconv.Atoi(strings.TrimSpace(s))
		if err != nil {
			error()
		}
		accu = accu*60 + value
	}
	return accu
}

// Formats a time in seconds into hh|mm|ss string.
func formatTime(time int) string {
	buffer := make([]string, 3)
	for i := 0; i < 3; i++ {
		buffer[2-i] = strconv.Itoa(time % 60)
		if len(buffer[2-i]) < 2 {
			buffer[2-i] = "0" + buffer[2-i]
		}
		time /= 60
	}
	return strings.Join(buffer, "|")
}

// Parses a list of times separated by comma.
// Returns the times in seconds.
func parseTimeList(list string) []int {
	// speed up: set capacity to maximal possible length
	seconds := make([]int, 0, len(list)/6)
	for _, time := range strings.Split(list, ",") {
		seconds = append(seconds, parseTime(time))
	}
	return seconds
}

func Stati(strg string) string {
	strg = strings.TrimSpace(strg)
	if len(strg) < 6 {
		// error exit, no time in strg
		return ""
	}
	times := parseTimeList(strg)
	stat := calculateStatistics(times)
	return strings.Join([]string{"Range:", formatTime(stat.span),
		"Average:", formatTime(stat.average),
		"Median:", formatTime(stat.median)}, " ")
}