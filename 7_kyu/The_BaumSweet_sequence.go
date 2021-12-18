package kata

// 2-automaton for the Baum-Sweet sequence:
// Allouche, J.-.P. (1993). "Finite automata and arithmetic". Séminaire Lotharingien de Combinatoire: 23
// https://www.emis.de/journals/SLC/opapers/s30allouche.pdf

const state_i = 0
const state_a = 1
const state_b = 2

var zero_map = [3]int{state_a, state_i, state_b}
var one_map = [3]int{state_i, state_b, state_b}
var output_map = [3]int{1, 0, 0}

func BaumSweet(ch chan<- int) {
	for index := 0; true; index++ {
		// run the 2-automaton for i = index
		n := index
		state := state_i
		for n != 0 && state != state_b {
			if n%2 != 0 {
				state = one_map[state]
			} else {
				state = zero_map[state]
			}
			n /= 2
		}
		ch <- output_map[state]
	}

}
