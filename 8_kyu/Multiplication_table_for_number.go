package kata

import (
	"bytes"
	"fmt"
)

func MultiTable(number int) string {
	var accu bytes.Buffer
	for i := 1; i < 11; i++ {
		fmt.Fprintf(&accu, "%d * %d = %d\n", i, number, i*number)
	}
	// remove the trailing \n. It has 1 byte length.
	accu.Truncate(accu.Len() - 1)
	return accu.String()
}
