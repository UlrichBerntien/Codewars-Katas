package uniq

func Uniq(a []string) []string {
	accu := make([]string, 0, len(a))
	if len(a) > 0 {
		last := a[0]
		accu = append(accu, a[0])
		for _, str := range a[1:] {
			if str != last {
				last = str
				accu = append(accu, last)
			}
		}
	}
	return accu
}
