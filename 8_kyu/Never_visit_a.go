package kata

var names = []string{"kiwi",
	"pear",
	"kiwi",
	"banana",
	"melon",
	"banana",
	"melon",
	"pineapple",
	"apple",
	"pineapple",
	"cucumber",
	"pineapple",
	"cucumber",
	"orange",
	"grape",
	"orange",
	"grape",
	"apple",
	"grape",
	"cherry",
	"pear",
	"cherry",
	"pear",
	"kiwi",
	"banana",
	"kiwi",
	"apple",
	"melon",
	"banana",
	"melon",
	"pineapple",
	"melon",
	"pineapple",
	"cucumber",
	"orange",
	"apple",
	"orange",
	"grape",
	"orange",
	"grape",
	"cherry",
	"pear",
	"cherry",
	"pear",
	"apple",
	"pear",
	"kiwi",
	"banana",
	"kiwi",
	"banana",
	"melon",
	"pineapple",
	"melon",
	"apple",
	"cucumber",
	"pineapple",
	"cucumber",
	"orange",
	"cucumber",
	"orange",
	"grape",
	"cherry",
	"apple",
	"cherry",
	"pear",
	"cherry",
	"pear",
	"kiwi",
	"pear",
	"kiwi",
	"banana",
	"apple",
	"banana",
	"melon",
	"pineapple",
	"melon",
	"pineapple",
	"cucumber",
	"pineapple",
	"cucumber",
	"apple",
	"grape",
	"orange",
	"grape",
	"cherry",
	"grape",
	"cherry",
	"pear",
	"cherry",
	"apple",
	"kiwi",
	"banana",
	"kiwi",
	"banana",
	"melon",
	"banana",
	"melon",
	"pineapple",
	"apple",
	"pineapple"}

func SubtractSum(n int) string {
	for n > 9 {
		r := n
		for r > 0 {
			n -= r % 10
			r /= 10
		}
		if n < 1 {
			return "ERROR"
		}
		if n <= 100 {
			return names[n-1]
		}
	}
	return "ERROR"
}