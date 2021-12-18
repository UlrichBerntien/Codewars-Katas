package kata

func DNAStrand(dna string) string {
	accu := make([]rune, 0, len(dna))
	for _, r := range dna {
		var c rune
		switch r {
		case 'A':
			c = 'T'
		case 'T':
			c = 'A'
		case 'C':
			c = 'G'
		case 'G':
			c = 'C'
		default:
			c = r
		}
		accu = append(accu, c)
	}
	return string(accu)
}
