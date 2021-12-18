package kata

import (
	"fmt"
	"math"
)

func Amort(rate float64, balance int, term int, num_payments int) string {
	bal := float64(balance)
	r := rate / 1200
	n := r * bal
	d := 1 - math.Pow(1+r, float64(-term))
	c := n / d
	var interest, princ float64
	for num := 1; num <= num_payments; num++ {
		interest = r * bal
		princ = c - interest
		bal -= princ
	}
	return fmt.Sprintf("num_payment %d c %.0f princ %.0f int %.0f balance %.0f", num_payments, c, princ, interest, bal)
}
