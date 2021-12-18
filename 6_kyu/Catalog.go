package kata

import (
	"fmt"
	"regexp"
	"strings"
)

// Search pattern in the input data.
// The % must be replaced by the product name part to search.
const pattern = `<prod><name>(.*%.*)</name><prx>(\d*\.?\d*)</prx><qty>(\d+)</qty></prod>`

// Output format.
// The fields are name, price and quantity
const format = "%s > prx: $%s qty: %s"

func Catalog(s string, article string) string {
	articlePattern := strings.Replace(pattern, "%", regexp.QuoteMeta(article), 1)
	compiledPattern := regexp.MustCompile(articlePattern)
	matches := compiledPattern.FindAllStringSubmatch(s, -1)
	if matches == nil {
		return "Nothing"
	}
	var result strings.Builder
	for i, m := range matches {
		if i > 0 {
			result.WriteRune('\n')
		}
		fmt.Fprintf(&result, format, m[1], m[2], m[3])
	}
	fmt.Println(matches)
	return result.String()
}
