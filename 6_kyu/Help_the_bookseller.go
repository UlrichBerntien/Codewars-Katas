package kata

import (
	"strconv"
	"strings"
)

// Number of possible categories
const categoriesLen = 'Z' - 'A' + 1

// Simplified stocklist: Index is Categorie A = 0, Value is quantity
type stocklist [categoriesLen]int

// Convert text stocklist to simple stocklist
func readTextStocklist(list []string) stocklist {
	var simpleList stocklist
	for _, s := range list {
		field := strings.Fields(s)
		// Ignore invalid formated texts
		if len(field) != 2 || len(field[0]) == 0 {
			continue
		}
		count, err := strconv.Atoi(field[1])
		if err != nil {
			continue
		}
		idx := int(field[0][0] - 'A')
		// Ignore invalid category code.
		if 0 <= idx && idx < len(simpleList) {
			simpleList[idx] += count
		}
	}
	return simpleList
}

// Creates a sublist of the stocklist.
// Format of the result string is defined in the kata
func compileSubList(simpleList stocklist, itemList []string) string {
	var accu strings.Builder
	for _, item := range itemList {
		if len(item) == 0 {
			continue
		}
		idx := int(item[0] - 'A')
		// Ignore invalid category codes
		if 0 <= idx && idx < len(simpleList) {
			if accu.Len() > 0 {
				accu.WriteString(" - ")
			}
			accu.WriteRune('(')
			accu.WriteByte(item[0])
			accu.WriteString(" : ")
			accu.WriteString(strconv.Itoa(simpleList[idx]))
			accu.WriteRune(')')
		}
	}
	return accu.String()
}

func StockList(listArt []string, listCat []string) string {
	// Error case: if input is empty then return an empty string
	if len(listArt) == 0 || len(listCat) == 0 {
		return ""
	}
	simpleList := readTextStocklist(listArt)
	return compileSubList(simpleList, listCat)
}