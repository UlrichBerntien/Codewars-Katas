package kata

// ROT13 encoder/decoder.
// Only ASCII letters are transformed,
// all other characters are unchanged copied.
func Rot13(msg string) string {
	// Create buffer with capacity to hold all chars
	accu := make([]rune, 0, len(msg))
	// multibyte-characters safe via runes
	for _, r := range msg {
		switch {
		case 'a' <= r && r <= 'z':
			accu = append(accu, 'a'+(r-'a'+13)%26)
		case 'A' <= r && r <= 'Z':
			accu = append(accu, 'A'+(r-'A'+13)%26)
		default:
			// all other runes are unchanged copied
			accu = append(accu, r)
		}
	}
	return string(accu)
}
