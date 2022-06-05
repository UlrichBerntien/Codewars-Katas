package kata

var text = []string{
	"I love you",
	"a little",
	"a lot",
	"passionately",
	"madly",
	"not at all"}

func HowMuchILoveYou(i int) string {
	if i > 0 {
		return text[(i-1)%len(text)]
	} else {
		return "error"
	}
}
