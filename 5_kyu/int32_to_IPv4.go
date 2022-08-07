package kata

import (
	"encoding/binary"
	"net"
)

// Convert int to dotted IPv4 address.
func Int32ToIp(n uint32) string {
	ip := make(net.IP, 4)
	binary.BigEndian.PutUint32(ip, n)
	return ip.String()
}
