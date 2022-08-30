package kata

import "unicode"

//---------- Lexer for the symbols ----------------------------------------

// Possible
type lexemeType int

const (
	start      lexemeType = iota // lexer not started
	eos                          // end of string reached
	singleRune                   // a single rune founc
	backspace                    // a backspace with optional multiplier found
)

//
type lexer struct {
	buffer     []rune     // string to analyse
	start      int        // start index of current lexeme
	length     int        // length of current lexeme
	lexeme     lexemeType // current lexeme
	multiplier int        // multiplier, only for backspace
}

// Initialise data structure.
// Parameter s: Analyse this string.
func newLexer(s string) *lexer {
	return &lexer{
		buffer:     []rune(s),
		start:      0,
		length:     0,
		lexeme:     start,
		multiplier: 0,
	}
}

// Check is rune 'r' is at 'index' in the buffer.
// Handles index behind buffer as no matching rune.
func (this *lexer) isRuneAt(index int, r rune) bool {
	return index < len(this.buffer) && this.buffer[index] == r
}

// Check is digit(0..9) at 'index' in the buffer.
// Handles index behind buffer as no matching rune.
func (this *lexer) isDigitAt(index int) bool {
	return index < len(this.buffer) && unicode.IsDigit(this.buffer[index])
}

// The code name of a backspace
var backspaceCode = []rune("[backspace]")

// Try if the current lexeme is a backspace with optional multiplier.
// Return: true -> backspace was handled, false -> no backspace
func (this *lexer) tryBackspace() bool {
	// check code string
	for i, r := range backspaceCode {
		if !this.isRuneAt(this.start+i, r) {
			// no backspace code here
			return false
		}
	}
	// found the backspace code here.
	this.lexeme = backspace
	this.length = len(backspaceCode)
	// default multiplier is 1
	this.multiplier = 1
	index := this.start + this.length
	// Search multiplier
	if index+1 >= len(this.buffer) {
		// no multiplier because end of string
		return true
	}
  // Multiplier is in format "*number"
  if !(this.isRuneAt(index, '*') && this.isDigitAt(index+1)) {
		// no multiplier because other characters are found
		return true
	}
	// A multiplier is given, skip the '*'
	index++
	// Parse decimal number
	this.multiplier = 0
	for this.isDigitAt(index) {
		this.multiplier = this.multiplier*10 + int(this.buffer[index]) - '0'
		index++
	}
	// Update length of the parsed lexeme
	this.length = index - this.start
	return true
}

// Read next lexeme from buffer.
// Return: True: lexeme is ready, False: end of buffer
func (this *lexer) next() bool {
	this.start += this.length
	if this.start == len(this.buffer) {
		// end of string
		this.length = 0
		this.lexeme = eos
		return false
	}
	if this.buffer[this.start] != '[' || !this.tryBackspace() {
		// a single rune
		this.length = 1
		this.lexeme = singleRune
		return true
	}
	// else: tryBackspace did the work
	return true
}

// Get type of current lexeme
func (this *lexer) current() lexemeType {
	return this.lexeme
}

// Get current rune
func (this *lexer) getRune() rune {
	if this.lexeme != singleRune {
		panic("no current rune")
	}
	return this.buffer[this.start]
}

// Get multiplier of the current backspace
func (this *lexer) getMultiplier() int {
	if this.lexeme != backspace {
		panic("no current backspace")
	}
	return this.multiplier
}

//---------- Main ---------------------------------------------------------

func Solve(s string) string {
	accu := make([]rune, 0, len(s))
	l := newLexer(s)
	for l.next() {
		switch l.current() {
		case singleRune:
			accu = append(accu, l.getRune())
		case backspace:
			newLen := len(accu) - l.getMultiplier()
			if newLen < 0 {
				newLen = 0
			}
			accu = accu[0:newLen]
		}
	}
	return string(accu)
}
