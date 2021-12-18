package kata

func StringConstructing(a, s string) int {
	template := []rune(a)
	templateLen := len(template)
	target := []rune(s)
	targetLen := len(target)
	counter := 0
	templateIndex := templateLen
	usedChar := true
	for targetOk := 0; targetOk < targetLen; {
		if templateIndex >= templateLen {
			// append template
			counter++
			templateIndex = 0
			if !usedChar {
				panic("can not construct string with given template")
			}
			usedChar = false
		}
		for templateIndex < templateLen && template[templateIndex] != target[targetOk] {
			// delete one char
			counter++
			templateIndex++
		}
		if templateIndex < templateLen {
			// correct char, no operation needed
			targetOk++
			templateIndex++
			usedChar = true
		}
	}
	// delete char at end of the string
	counter += templateLen - templateIndex
	return counter
}