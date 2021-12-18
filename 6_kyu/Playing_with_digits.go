package kata

import (
	"math/big"
	"strconv"
)

func DigPow(n, p int) int {
	accu := big.NewInt(0)
	for i, c := range strconv.Itoa(n) {
		base := big.NewInt(int64(c) - int64('0'))
		power := big.NewInt(int64(i + p))
		var x big.Int
		x.Exp(base, power, nil)
		accu.Add(accu, &x)
	}
	var q, m big.Int
	q.DivMod(accu, big.NewInt(int64(n)), &m)
	if m.Cmp(big.NewInt(0)) == 0 {
		return int(q.Int64())
	} else {
		return -1
	}
}
