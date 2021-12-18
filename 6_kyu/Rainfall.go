package kata

import (
	"strconv"
	"strings"
	"unicode"
)

// Check for separator rune in the data line.
// In the data line for one town fields are separated by spaces or ','.
func isSeparator(r rune) bool {
	return unicode.IsSpace(r) || r == ','
}

// Extract the values for one town.
// Returns nil if town is not found.
func extractTownData(town, data string) []float64 {
	townIndex := strings.Index(data, town+":")
	if townIndex < 0 {
		return nil
	}
	endIndex := strings.IndexRune(data[townIndex:], '\n')
	if endIndex == -1 {
		endIndex = len(data)
	} else {
		endIndex += townIndex
	}
	townData := data[townIndex:endIndex]
	numbers := make([]float64, 0, 12)
	for _, field := range strings.FieldsFunc(townData, isSeparator) {
		value, err := strconv.ParseFloat(field, 64)
		if err == nil {
			numbers = append(numbers, value)
		}
	}
	return numbers
}

// Mean value of the data.
func mean(data []float64) float64 {
	sum := 0.0
	for _, value := range data {
		sum += value
	}
	return sum / float64(len(data))
}

// Variance of the data.
func variance(data []float64) float64 {
	m := mean(data)
	sum2 := 0.0
	for _, value := range data {
		delta := value - m
		sum2 += delta * delta
	}
	return sum2 / float64(len(data))
}

func Mean(town, strng string) float64 {
	raindata := extractTownData(town, strng)
	if raindata == nil {
		return -1
	}
	return mean(raindata)
}

func Variance(town string, strng string) float64 {
	raindata := extractTownData(town, strng)
	if raindata == nil {
		return -1
	}
	return variance(raindata)
}
