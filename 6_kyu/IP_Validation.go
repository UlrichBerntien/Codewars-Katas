package kata

import (
	"net"
	"regexp"
)

// handle special case for this kata: no leading zerors
var leading_zero = regexp.MustCompile(`\W0\d`)

func Is_valid_ip(ip string) bool {
	return net.ParseIP(ip) != nil && !leading_zero.MatchString(ip)
}
