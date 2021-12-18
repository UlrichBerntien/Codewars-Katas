package kata

import "math/big"

func FindNb(m int) int {
	// See: "https://proofwiki.org/wiki/Sum_of_Sequence_of_Cubes"
	// https://proofwiki.org/wiki/Sum_of_Sequence_of_Cubes
	// sum(i³,1..n) = n²(n+1)²/4
	var x big.Int
	x.Sqrt(big.NewInt(int64(m)))
	x.Mul(&x, big.NewInt(8))
	x.Add(&x, big.NewInt(1))
	x.Sqrt(&x)
	x.Sub(&x, big.NewInt(1))
	x.Div(&x, big.NewInt(2))
	n := int(x.Int64())
	c := int64(n) * (int64(n) + 1) / 2
	if c*c == int64(m) {
		return n
	} else {
		return -1
	}
}
