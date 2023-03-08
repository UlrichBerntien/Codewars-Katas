package main

//
// Workflow:
// - Load the web site https://www.codewars.com/users/USERNAME/completed_solutions
// - Analyse the network traffic with chrome
// - Scroll down and down until end. A lot of pages are loaded and
//   included dynamical by the Javascript.
// - Store the network traffic in a HAR file (Http ARchive file).
// - Export the source code from the HAR file with this script.
//
// HAR (Http ARchive) uses the JSON file format.
// The file format is specified on:
// https://w3c.github.io/web-performance/specs/HAR/Overview.html#sec-har-object-types-entry
//
// - Parse JSON file.
// - Parse the HTML code.
//   A good alternative to the simple parsing is the htmlquery package.
//   (XQeury for HTML)
//

import (
	"encoding/base64"
	"encoding/json"
	"fmt"
	"golang.org/x/net/html"
	"golang.org/x/net/html/atom"
	"os"
	"path"
	"strings"
	"time"
)

// Part of the HAR JSON Data structure.
// The header of a HTTP request or response is an array of name-value Tuples.
type harHeaderType struct {
	Name  string
	Value string
}

// Part of the HAR JSON Data structure.
// The information stored for one cookie.
type harCookieType struct {
	Name     string
	Value    string
	Path     string
	Domain   string
	Expires  string
	HttpOnly bool
	Secure   bool
}

// Part of the HAR JSON Data structure.
// The content of a HTTP response with meta information about the content.
type harContentType struct {
	Size        int
	MimeType    string
	Compression int
	Text        string
	Encoding    string
}

// Part of the HAR JSON Data structure.
// A HTTP request is stored in this structure.
// The structure contains send data and meta information .
type harRequestType struct {
	Method      string
	Url         string
	HttpVersion string
	Cookies     []harCookieType
	Headers     []harHeaderType
	QueryString []interface{}
	PostData    interface{}
	HeadersSize int
	BodySize    int
}

// Part of the HAR JSON Data structure.
// A HTTP response is stored in this structure.
// The structure contains received data and meta information .
type harResponseType struct {
	Status      int
	StatusText  string
	HttpVersion string
	Cookies     []harCookieType
	Headers     []harHeaderType
	Content     harContentType
	RedirectURL string
	HeadersSize int
	BodySize    int
}

// Part of the HAR JSON Data structure.
// The pair of HTTP request to the server and response from the server.
type harEntryType struct {
	Pageref         string
	StartedDateTime string
	Time            float64
	Request         harRequestType
	Response        harResponseType
	ServerIPAddress string
	Connection      string
}

// Part of the HAR JSON Data structure.
// The meta information is about the creation of the HTTP communication log.
type harLogType struct {
	Version string
	Creator interface{}
	Pages   []interface{}
	Entries []harEntryType
}

// Part of the HAR JSON Data structure.
// Top level structure.
// The HAR file is one JSON object with one member.
type harArchiveType struct {
	Log harLogType
}

// Collect the information in a global variable.
// Quick and dirty solution.
// The information to a solution are spread over some nodes.
var item struct {
	destination string // store items in this path
	name        string
	level       string
	date        string
	language    string
	sourcecode  string
}

// Table of language -> file name extension
var language2extension = map[string]string{
	"c":      "c",
	"csharp": "cs",
	"cpp":    "cpp",
	"forth":  "fth",
	"go":     "go",
	"julia":  "jl",
	"kotlin": "kt",
	"lua":    "lua",
	"nasm":   "asm",
	"riscv":  "riscv.s",
	"python": "py",
	"r":      "r",
	"rust":   "rs",
	"shell":  "sh",
	"sql":    "sql",
}

// Mangels names to use as path and file names.
// Keep only ASCII letters and digits.
// Replace space(s) by an underline.
func mangleName(raw string) string {
	result := make([]rune, 0, len(raw))
	for _, r := range raw {
		switch {
		case 'a' <= r && r <= 'z',
			'A' <= r && r <= 'Z',
			'0' <= r && r <= '9':
			// Only ASCII letters and digits are passed through into the result
			result = append(result, r)
		case ' ' == r:
			// one or more spaces is replaced by a underline
			if len(result) > 0 && result[len(result)-1] != '_' {
				result = append(result, '_')
			}

		}
	}
	// No spaces = underlines at the end
	for len(result) > 1 && result[len(result)-1] == '_' {
		result = result[0 : len(result)-1]
	}
	return string(result)
}

// Returns the file extension for the source file.
// The dot is also in the returned string.
func languageExtension(language string) string {
	ext, found := language2extension[language]
	if !found {
		fmt.Println("ERROR: no file name extension defined for", language)
		ext = language
	}
	return "." + ext
}

// Write an item (a solution in one language) into a file.
// If more than one solution to a kata exists the newest solution is stored in the file.
func writeItem() {
	if len(item.name) == 0 || len(item.sourcecode) == 0 {
		// error case:
		fmt.Println("ERROR: try to write empty item")
		return
	}
	dirname := path.Join(item.destination, mangleName(item.level))
	filename := path.Join(dirname, mangleName(item.name)) + languageExtension(item.language)
	filetime, err := time.Parse("2006-01-02T15:04:05.999-0700", item.date)
	if err != nil {
		fmt.Println("ERROR: invalid date-time format", item.date)
		// error fallback: use the current time
		filetime = time.Now()
	}
	err = os.MkdirAll(dirname, 0755)
	if err != nil {
		fmt.Println("ERROR: creating directory", err)
	}
	info, err := os.Stat(filename)
	// Write if not exists or the current solution is newer.
	if err != nil || info.ModTime().Unix() < filetime.Unix() {
		if err == nil {
			// Set old file writeable. Typical the files are readonly.
			os.Chmod(filename, 0644)
		}
		err = os.WriteFile(filename, []byte(item.sourcecode), 0444)
		if err != nil {
			fmt.Println("ERROR: creating file", err)
		}
		// Set the date of the solution as modification date of the file.
		// Set the access time stamp to the current time.
		os.Chtimes(filename, time.Now(), filetime)
		// Ensures the file is readonly.
		os.Chmod(filename, 0444)
	}
}

// Gets the value of a node attribute.
// Returns empty string if the attribute does not exists or is an empty string.
func getAttribute(node *html.Node, key string) string {
	if node != nil {
		for _, a := range node.Attr {
			if a.Key == key {
				return a.Val
			}
		}
	}
	return ""
}

// Gets the content of the text child.
// Returns empty string if no text exists of the text is empty.
func getText(node *html.Node) string {
	if node != nil {
		for child := node.FirstChild; child != nil; child = child.NextSibling {
			if child.Type == html.TextNode {
				return child.Data
			}
		}
	}
	return ""
}

// Processes the nodes in the HTML document.
// Goes recursive down in the HTML entry structure and
// iterations over list of childs
// until the code tag is reached.
func processNode(node *html.Node) {
	switch {
	case node.DataAtom == atom.Code:
		item.language = getAttribute(node, "data-language")
		item.sourcecode = getText(node)
	case node.Type == html.ElementNode && node.Data == "time-ago":
		item.date = getAttribute(node, "datetime")
		writeItem()
	case node.DataAtom == atom.Div && getAttribute(node, "class") == "item-title":
		child := node.FirstChild
		if child == nil || child.FirstChild == nil {
			return
		}
		item.level = getText(child.FirstChild.FirstChild)
		child = child.NextSibling
		item.name = getText(child)
	default:
		for child := node.FirstChild; child != nil; child = child.NextSibling {
			processNode(child)
		}
	}
}

// Processes one HTML formated data blob from the codewars server.
func processContentText(content string) {
	reader := strings.NewReader(content)
	doc, err := html.Parse(reader)
	if err != nil {
		fmt.Println(err)
		return
	}
	processNode(doc)
}

func main() {
	if len(os.Args) != 3 {
		fmt.Println("arguments: HAR-file destination-path")
		return
	}
	harFileName := os.Args[1]
	item.destination = os.Args[2]
	fmt.Println("Parse", harFileName, "and export to", item.destination)
	harFile, err := os.Open(harFileName)
	if err != nil {
		fmt.Println(err)
		return
	}
	harDecoder := json.NewDecoder(harFile)
	var archive harArchiveType
	err = harDecoder.Decode(&archive)
	if err != nil {
		fmt.Println(err)
		return
	}
	for _, entry := range archive.Log.Entries {
		if entry.Response.Status == 200 && strings.Contains(entry.Request.Url, "completed_solution") {
			text := entry.Response.Content.Text
			switch enc := entry.Response.Content.Encoding; enc {
			case "": // nothing to do
			case "base64":
				dec, _ := base64.StdEncoding.DecodeString(text)
				text = string(dec)
			default:
				fmt.Println("Unknown content encoding:", enc)
			}
			processContentText(text)
		}
	}
	return
}
