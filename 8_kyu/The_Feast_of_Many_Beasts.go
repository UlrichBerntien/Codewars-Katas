package kata

func Feast(beast string, dish string) bool {
	if len(beast) == 0 || len(dish) == 0 {
		// Error exit
		return false
	}
	beastRunes := []rune(beast)
	dishRunes := []rune(dish)
	return beastRunes[0] == dishRunes[0] && beastRunes[len(beastRunes)-1] == dishRunes[len(dishRunes)-1]
}
