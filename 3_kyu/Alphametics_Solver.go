package kata

import (
	"strings"
	"unicode"
)

// ----------------------- STORAGE ----------------------------------

// A digit in the problem.
// The digit is a letter in the problem.
// During the calculation the value of the digit will be found.
// value < 0 if the value of the digit is unknown.
type aDigit struct {
	name        rune
	zeroAllowed bool
	value       int
}

func (digit aDigit) String() string {
	switch {
	case digit.value >= 0:
		return string(digit.name) + "=" + string(digit.value)
	case digit.zeroAllowed:
		return string(digit.name) + "=?"
	default:
		return string(digit.name) + ">0"
	}
}

// A number in the problem.
// A number is a sequence of digits.
// Weight of digit i is 10^i.
type aNumber []*aDigit

func (num aNumber) String() string {
	runes := make([]rune, len(num))
	o := len(runes) - 1
	for i, d := range num {
		if d.value >= 0 {
			runes[o-i] = rune('0' + d.value)
		} else {
			runes[o-i] = d.name
		}
	}
	return string(runes)
}

// The problem has summands and a sum.
// Each digit used in any number is stored only once in the digits.
type aProblem struct {
	digits   []*aDigit
	summands []aNumber
	sum      aNumber
}

func (prob aProblem) String() string {
	var result strings.Builder
	for i, s := range prob.summands {
		result.WriteString(s.String())
		if i < len(prob.summands)-1 {
			result.WriteString(" + ")
		}
	}
	result.WriteString(" = ")
	result.WriteString(prob.sum.String())
	return result.String()
}

// ----------------------- PARSER -----------------------------------

type aToken int8

const (
	tokenOperator aToken = iota
	tokenSummand
	tokenSum
	tokenEnd
)

func isLetter(s string) bool {
	for _, r := range s {
		if !unicode.IsLetter(r) {
			return false
		}
	}
	return true
}

func parse(task string) aProblem {
	problem := aProblem{
		digits:   make([]*aDigit, 0, 10),
		summands: make([]aNumber, 0, 7),
		sum:      aNumber{}}
	rune2digit := make(map[rune]*aDigit)
	nextToken := tokenSummand
	for _, w := range strings.Fields(task) {
		switch {
		case w == "+" && nextToken == tokenOperator:
			nextToken = tokenSummand
		case w == "=" && nextToken == tokenOperator:
			nextToken = tokenSum
		case isLetter(w) && (nextToken == tokenSum || nextToken == tokenSummand):
			num := make(aNumber, len(w))
			for i, r := range w {
				d := rune2digit[r]
				if d == nil {
					d = &aDigit{
						name:        r,
						zeroAllowed: true,
						value:       -1}
					problem.digits = append(problem.digits, d)
					rune2digit[r] = d
				}
				if i == 0 {
					d.zeroAllowed = false
				}
				num[len(w)-1-i] = d
			}
			if nextToken == tokenSummand {
				problem.summands = append(problem.summands, num)
				nextToken = tokenOperator
			} else {
				problem.sum = num
				nextToken = tokenEnd
			}
		default:
			panic("invalid problem string")
		}
	}
	if len(problem.digits) > 10 {
		panic("more than 10 digits to find")
	}
	return problem
}

// ----------------------- SOLVER -----------------------------------

type aStepOperation int8

const (
	stepTrial aStepOperation = iota
	stepCalculate
	stepCheck
)

type aStep struct {
	operation aStepOperation
	operator  *aDigit
}

func (step aStep) String() string {
	switch step.operation {
	case stepTrial:
		return "try:" + string(step.operator.name)
	case stepCalculate:
		return "calc:" + string(step.operator.name)
	case stepCheck:
		return "check:" + string(step.operator.name)
	default:
		panic("invalid step operation")
	}
}

func plan(prob aProblem) []aStep {
	result := make([]aStep, 0, 10)
	toFind := make(map[*aDigit]bool, len(prob.digits))
	for _, d := range prob.digits {
		toFind[d] = true
	}
	for col := 0; col < len(prob.sum); col++ {
		for _, s := range prob.summands {
			if len(s) > col {
				d := s[col]
				if toFind[d] {
					toFind[d] = false
					result = append(result, aStep{
						operation: stepTrial,
						operator:  d})
				}
			}
		}
		d := prob.sum[col]
		result = append(result, aStep{operator: d})
		if toFind[d] {
			result[len(result)-1].operation = stepCalculate
			toFind[d] = false
		} else {
			result[len(result)-1].operation = stepCheck
		}
	}
	if len(prob.digits) > len(result) {
		panic("invalid length of plan")
	}
	return result
}

func solve(prob aProblem, app []aStep) aProblem {
	// Array of avaiable digits 0,1,..,9
	digits := [10]bool{true, true, true, true, true, true, true, true, true, true}
	setValue := func(stepIndex int, v int) {
		digits[v] = false
		app[stepIndex].operator.value = v
	}
	backtrack := func(stepIndex int) int {
		for goon := true; goon; {
			if app[stepIndex].operation != stepCheck {
				v := app[stepIndex].operator.value
				if v >= 0 {
					digits[v] = true
				}
				app[stepIndex].operator.value = -1
			}
			stepIndex--
			goon = stepIndex > 0 && app[stepIndex].operation != stepTrial
		}
		return stepIndex
	}
	calculate := func(digit *aDigit) int {
		result := -1
		hasValue := true
		accu := 0
		for col := 0; col < len(prob.sum) && hasValue; col++ {
			for _, s := range prob.summands {
				if col < len(s) {
					accu += s[col].value
					hasValue = hasValue && s[col].value >= 0
				}
			}
			if hasValue {
				if digit == prob.sum[col] {
					result = accu % 10
				}
				if prob.sum[col].value >= 0 {
					hasValue = accu%10 == prob.sum[col].value
				}
				if !hasValue {
					result = -1
				}
			}
			accu /= 10
		}
		return result
	}
	// Current step in the plan.
	for currentStep := 0; currentStep < len(app); {
		switch app[currentStep].operation {
		case stepTrial:
			// Try next available value or backtrack to the last trial step.
			v := app[currentStep].operator.value
			if v >= 0 {
				digits[v] = true
			}
			v++
			if v == 0 && !app[currentStep].operator.zeroAllowed {
				v++
			}
			for v < len(digits) && !digits[v] {
				v++
			}
			if v < len(digits) {
				setValue(currentStep, v)
				currentStep++
			} else {
				currentStep = backtrack(currentStep)
			}
		case stepCalculate:
			// Calculate the value of the digit or backtrack.
			v := calculate(app[currentStep].operator)
			if v >= 0 && digits[v] && (v > 0 || app[currentStep].operator.zeroAllowed) {
				setValue(currentStep, v)
				currentStep++
			} else {
				currentStep = backtrack(currentStep)
			}
		case stepCheck:
			// Check the value of the digit or backtrack.
			v := calculate(app[currentStep].operator)
			if v >= 0 {
				currentStep++
			} else {
				currentStep = backtrack(currentStep)
			}
		default:
			panic("invalid operation code in plan")
		}
	}
	return prob
}

// ----------------------- MAIN -------------------------------------

func Alphametics(task string) string {
	// Parse the problem.
	problem := parse(task)
	// Plan the approach.
	approach := plan(problem)
	// Solve the problem.
	problem = solve(problem, approach)
	// Return the solution.
	return problem.String()
}