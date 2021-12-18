package kata

import (
	"errors"
	"regexp"
	"strings"
)

// Container of all header data items
type fileHeader struct {
	program     string
	author      string
	corporation string
	phone       string
	date        string
	version     string
	level       string
}

// Regexp of a valid phone number
var validPhone = regexp.MustCompile(`^\+1\-\d{3}\-\d{3}\-\d{4}$`)

// Regexp of a valid version number
var validVersion = regexp.MustCompile(`^\d{1,}\.\d{1,}$`)

// General error message
const errorMessage = "ERROR: VERSION or PHONE"

// Read header data from string in old multi line format
func parseOldFormat(s string) (fileHeader, error) {
	var data fileHeader
	var err error
	for _, line := range strings.Split(s, "\n") {
		splitter := strings.SplitN(line, ":", 2)
		name := strings.TrimSpace(splitter[0])
		value := strings.TrimSpace(splitter[1])
		switch name {
		case "Program title":
			data.program = value
		case "Author":
			data.author = value
		case "Corporation":
			data.corporation = value
		case "Phone":
			if validPhone.MatchString(value) {
				data.phone = value
			} else {
				err = errors.New(errorMessage)
				// no return, continue to try parsing most possible values
			}
		case "Date":
			data.date = value
		case "Version":
			if validVersion.MatchString(value) {
				data.version = value
			} else {
				err = errors.New(errorMessage)
			}
		case "Level":
			data.level = value
		default:
			// irgnoe
		}
	}
	return data, err
}

// Convert header data into a string with new format
func (header *fileHeader) StringNewFormat() string {
	var accu strings.Builder
	accu.WriteString("Program: ")
	accu.WriteString(header.program)
	accu.WriteString(" Author: ")
	accu.WriteString(header.author)
	accu.WriteString(" Phone: ")
	accu.WriteString(header.phone)
	accu.WriteString(" Date: ")
	accu.WriteString(header.date)
	accu.WriteString(" Version: ")
	accu.WriteString(header.version)
	return accu.String()
}

func Change(s string, prog string, version string) string {
	header, err := parseOldFormat(s)
	if err != nil {
		return err.Error()
	}
	header.date = "2019-01-01"
	header.author = "g964"
	header.phone = "+1-503-555-0090"
	header.program = prog
	if header.version != "2.0" {
		header.version = version
	}
	return header.StringNewFormat()
}
