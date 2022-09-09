package kata

func Tops(msg string) string {
	runes := []rune(msg)
	msg_len := len(runes)
	if msg_len <= 1 {
		return msg
	}
	accu := make([]rune, 0)
	level := 1
	index := 1
	for index < msg_len {
		accu = append(accu, ' ')
		copy(accu[1:], accu)
		accu[0] = runes[index]
		index += 4*level + 1
		level += 1
	}
	return string(accu)
}
