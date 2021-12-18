package kata

import (
	"bytes"
	"crypto/md5"
	"encoding/hex"
)

// fast fixed length int to bytes converter
func atoi(number, len int) []byte {
	dest := make([]byte, len)
	for i := len - 1; i >= 0; i-- {
		dest[i] = byte(number%10 + 0x30) // ASCII
		number /= 10
	}
	return dest
}

func Crack(hash string) string {
	targetHash, err := hex.DecodeString(hash)
	if err != nil {
		return ""
	}
	for i := 0; i < 100000; i++ {
		pin := atoi(i, 5)
		pinHash := md5.Sum(pin)
		if bytes.Compare(targetHash, pinHash[:]) == 0 {
			return string(pin)
		}
	}
	// PIN not found
	return ""
}
