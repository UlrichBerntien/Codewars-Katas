package kata

// A bit map to mark the seen digits.
// The mapping ist digit x <-> bit 2^x
type decimalDigits uint16

// All decimal digits
const allDigits decimalDigits = 0b1111111111

// Index is 0..9, value is 2^i
var digit []decimalDigits = generateDigitMap()

// Generates the map i to 2^i for i=0..9.
func generateDigitMap() []decimalDigits {
	digit2bit := make([]decimalDigits, 10)
	for i, v := 0, decimalDigits(1); i < 10; i, v = i+1, v*2 {
		digit2bit[i] = v
	}
	return digit2bit
}

// Calculates the depths of inter n
func ComputeDepth(n uint) uint {
	if n <= 0 {
		panic("invalid argument")
	}
	// Count of needed multiplication steps
	var count uint = 0
	// Current number = n * step
	var number uint = n
	// Seen digits so far
	var seen decimalDigits = 0
	for seen < allDigits {
		// Split number into decimal digits
		remain := number
		for remain > 0 {
			seen |= digit[remain%10]
			remain /= 10
		}
		number += n
		count++
	}
	return count
}
