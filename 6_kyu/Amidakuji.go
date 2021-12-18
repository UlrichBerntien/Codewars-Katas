package kata

func Amidakuji(ar []string) []int {
	if len(ar) == 0 || len(ar[0]) == 0 {
		return []int{}
	}
	number := make([]int, len(ar[0])+1)
	for i := range number {
		number[i] = i
	}
	for _, s := range ar {
		for i := range s {
			if s[i] == '1' {
				number[i], number[i+1] = number[i+1], number[i]
			}
		}
	}
	return number
}
