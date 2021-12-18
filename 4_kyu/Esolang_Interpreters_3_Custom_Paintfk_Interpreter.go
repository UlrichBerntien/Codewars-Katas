package kata

import "strings"

// All commands are implemented as functions on the machine structure
type command = func(work *machine)

// Dataset of the running Custom Paintfuck machine
// The code string is stored as array of command functions
type machine struct {
	grid           [][]bool
	gridXN         int        // width of the grid
	gridYN         int        // height of the grid
	gridPointerX   int        // index (x and y) of current cell in the grid
	gridPointerY   int
	program        []command
	commandPointer int        // index of next command to execute
  commandCounter int        // number of exceuted commands
}

// Command No operation
func commandNop(work *machine) {
	work.commandPointer++
  // nop's are not counted, commandCount is unchanged
}

// Command n - Move data pointer north (up)
func commandMoveNorth(work *machine) {
	work.gridPointerY = (work.gridPointerY - 1 + work.gridYN) % work.gridYN
	work.commandPointer++
  work.commandCounter++
}

// Command s - Move data pointer south (down)
func commandMoveSouth(work *machine) {
	work.gridPointerY = (work.gridPointerY + 1) % work.gridYN
	work.commandPointer++
  work.commandCounter++
}

// Command e - Move data pointer east (right)
func commandMoveEast(work *machine) {
	work.gridPointerX = (work.gridPointerX + 1) % work.gridXN
	work.commandPointer++
  work.commandCounter++
}

// Command w - Move data pointer west (left)
func commandMoveWest(work *machine) {
	work.gridPointerX = (work.gridPointerX - 1 + work.gridXN) % work.gridXN
	work.commandPointer++
  work.commandCounter++
}

// Command * - Flip the bit at the current cell
func commandFlip(work *machine) {
	work.grid[work.gridPointerY][work.gridPointerX] = !work.grid[work.gridPointerY][work.gridPointerX]
	work.commandPointer++
  work.commandCounter++
}

// Generate command [ - Jump past matching ] if value at current cell is 0
func generateJumpPast(targetCommandPointer int) command {
	return func(work *machine) {
		if !work.grid[work.gridPointerY][work.gridPointerX] {
			work.commandPointer = targetCommandPointer
		} else {
			work.commandPointer++
		}
    work.commandCounter++
	}
}

// Generate command ] - Jump back to matching [ (if value at current cell is nonzero)
func generateJumpBack(targetCommandPointer int) command {
	return func(work *machine) {
		if work.grid[work.gridPointerY][work.gridPointerX] {
			work.commandPointer = targetCommandPointer
		} else {
			work.commandPointer++
		}
  // back jumps are not counted, commandCount is unchanged
	}
}

// Make grid filled with 0
func makeGrid(width, height int) [][]bool {
	grid := make([][]bool, height)
	for indexY := 0; indexY < height; indexY++ {
		grid[indexY] = make([]bool, width)
	}
	return grid
}

// Translate internal grid to string
func translateGridToString(grid [][]bool) string {
	var accu strings.Builder
	for indexY := 0; indexY < len(grid); indexY++ {
		if indexY > 0 {
			accu.WriteString("\r\n")
		}
		row := grid[indexY]
		for indexX := 0; indexX < len(row); indexX++ {
			if row[indexX] {
				accu.WriteRune('1')
			} else {
				accu.WriteRune('0')
			}
		}
	}
	return accu.String()
}

// Translate code string
func translateCode(code string) []command {
	program := make([]command, 0, len(code))
	jumpStack := make([]int, 0)
	for _, c := range code {
		switch c {
		case 'n':
			program = append(program, commandMoveNorth)
		case 's':
			program = append(program, commandMoveSouth)
		case 'e':
			program = append(program, commandMoveEast)
		case 'w':
			program = append(program, commandMoveWest)
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
func run(work *machine, iterations int) {
	nc := len(work.program)
	for work.commandCounter < iterations && work.commandPointer < nc {
    work.program[work.commandPointer](work)
	}
}

func Interpreter(code string, iterations, width, height int) string {
	work := machine{
		grid:           makeGrid(width, height),
		gridXN:         width,
		gridYN:         height,
		gridPointerX:   0,
		gridPointerY:   0,
		program:        translateCode(code),
		commandPointer: 0,
    commandCounter: 0}
	run(&work, iterations)
	return translateGridToString(work.grid)
}
