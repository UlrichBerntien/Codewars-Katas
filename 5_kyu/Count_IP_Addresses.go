package kata

import (
	"encoding/binary"
	"net"
)

func IpsBetween(start, end string) int {
	start_ip := net.ParseIP(start)
	end_ip := net.ParseIP(end)
	delta := 0
	if start_ip != nil && end_ip != nil {
		// supports only IP4
		start_num := binary.BigEndian.Uint64(start_ip[len(start_ip)-8:])
		end_num := binary.BigEndian.Uint64(end_ip[len(end_ip)-8:])
		delta = int(end_num - start_num)
	}
	return delta
}
