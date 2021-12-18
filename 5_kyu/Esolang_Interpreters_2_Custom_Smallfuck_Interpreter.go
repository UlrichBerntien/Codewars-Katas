package kata

// All commands are implemented as functions on the machine structure
type command = func(work *machine)

// Dataset of the running Smallfuck machine
// The code string is stored as array of command functions
type machine struct {
	tape           []bool
	tapePointer    int
	program        []command
	commandPointer int
}

// Command No operation
func commandNop(work *machine) {
	work.commandPointer++
}

// Command > - Move pointer to the right (by 1 cell)
func commandMoveRight(work *machine) {
	work.tapePointer++
	work.commandPointer++
}

// Command < - Move pointer to the left (by 1 cell)
func commandMoveLeft(work *machine) {
	work.tapePointer--
	work.commandPointer++
}

// Command * - Flip the bit at the current cell
func commandFlip(work *machine) {
	work.tape[work.tapePointer] = !work.tape[work.tapePointer]
	work.commandPointer++
}

// Generate command [ - Jump past matching ] if value at current cell is 0
func generateJumpPast(targetCommandPointer int) command {
	return func(work *machine) {
		if !work.tape[work.tapePointer] {
			work.commandPointer = targetCommandPointer
		} else {
			work.commandPointer++
		}
	}
}

// Generate command ] - Jump back to matching [ (if value at current cell is nonzero)
func generateJumpBack(targetCommandPointer int) command {
	return func(work *machine) {
		if work.tape[work.tapePointer] {
			work.commandPointer = targetCommandPointer
		} else {
			work.commandPointer++
		}
	}
}

// Translate tape string
func translateTape(tape string) []bool {
	runes := []rune(tape)
	result := make([]bool, len(runes))
	for i, r := range runes {
		result[i] = r == '1'
	}
	return result
}

// Translate internal []bool to tape string
func translateTapeToString(tape []bool) string {
	result := make([]rune, len(tape))
	for i, t := range tape {
		if t {
			result[i] = '1'
		} else {
			result[i] = '0'
		}
	}
	return string(result)
}

// Translate code string
func translateCode(code string) []command {
	program := make([]command, 0, len(code))
	jumpStack := make([]int, 0)
	for _, c := range code {
		switch c {
		case '>':
			program = append(program, commandMoveRight)
		case '<':
			program = append(program, commandMoveLeft)
		case '*':
			program = append(program, commandFlip)
		case '[':
			jumpStack = append(jumpStack, len(program))
			program = append(program, commandNop)
		case ']':
			i := len(jumpStack) - 1
			jumpStart := jumpStack[i]
			program[jumpStart] = generateJumpPast(len(program))
			program = append(program, generateJumpBack(jumpStart))
			jumpStack = jumpStack[:i]
		}
	}
	return program
}

// run the program
func run(work *machine) {
	nc := len(work.program)
	nt := len(work.tape)
	for work.commandPointer < nc && 0 <= work.tapePointer && work.tapePointer < nt {
		work.program[work.commandPointer](work)
	}
}

func Interpreter(code, tape string) string {
	work := machine{
		tape:           translateTape(tape),
		tapePointer:    0,
		program:        translateCode(code),
		commandPointer: 0}
	run(&work)
	return translateTapeToString(work.tape)
}
