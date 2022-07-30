package kata

// Type: Events
// Internal fast and compact: integer codes
// External: strings
type tcpEvent int8

// Possible TCP events.
const (
	APP_PASSIVE_OPEN tcpEvent = iota
	APP_ACTIVE_OPEN
	APP_SEND
	APP_CLOSE
	APP_TIMEOUT
	RCV_SYN
	RCV_ACK
	RCV_SYN_ACK
	RCV_FIN
	RCV_FIN_ACK
)

// Names of all possible TCP events.
// Order of the names must match order of the constants!
// (stringer tool is not available here.)
var tcpEvent2Name = [...]string{
	"APP_PASSIVE_OPEN",
	"APP_ACTIVE_OPEN",
	"APP_SEND",
	"APP_CLOSE",
	"APP_TIMEOUT",
	"RCV_SYN",
	"RCV_ACK",
	"RCV_SYN_ACK",
	"RCV_FIN",
	"RCV_FIN_ACK"}

// Man names to TCP event codes.
var name2TcpEvent map[string]tcpEvent = genName2TcpEvent()

// Generate map for TCP event codes
func genName2TcpEvent() map[string]tcpEvent {
	accu := make(map[string]tcpEvent, len(tcpEvent2Name))
	for id, name := range tcpEvent2Name {
		accu[name] = tcpEvent(id)
	}
	return accu
}

// Type: States
// Internal fast and compact: integer codes
// External: strings
type tcpState int8

// Possible TCP states.
const (
	ERROR tcpState = iota
	CLOSED
	LISTEN
	SYN_SENT
	SYN_RCVD
	ESTABLISHED
	CLOSE_WAIT
	LAST_ACK
	FIN_WAIT_1
	FIN_WAIT_2
	CLOSING
	TIME_WAIT
)

// Names of all possible TCP states.
// Order of the names must match order of the constants!
var tcpState2Name = [...]string{
	"ERROR",
	"CLOSED",
	"LISTEN",
	"SYN_SENT",
	"SYN_RCVD",
	"ESTABLISHED",
	"CLOSE_WAIT",
	"LAST_ACK",
	"FIN_WAIT_1",
	"FIN_WAIT_2",
	"CLOSING",
	"TIME_WAIT"}

// Man names to TCP state codes.
var name2TcpState map[string]tcpState = genName2TcpState()

// Generate map for TCP event codes
func genName2TcpState() map[string]tcpState {
	accu := make(map[string]tcpState, len(tcpState2Name))
	for id, name := range tcpState2Name {
		accu[name] = tcpState(id)
	}
	return accu
}

// Type: index in the strate transition table.
// The next state depends on current state and event.
// This type combins the two bytes state.event.
type tcpStateXevent int16

// Build transition table index of state code and event code.
func newTcpStateXevent(state tcpState, event tcpEvent) tcpStateXevent {
	return tcpStateXevent(state)<<8 | tcpStateXevent(event)
}

// Map of all allowed state transitions.
var stateTransitions map[tcpStateXevent]tcpState = genStateTransitions()

// Generates the state transtion table for the TCP state machine.
func genStateTransitions() map[tcpStateXevent]tcpState {
	accu := make(map[tcpStateXevent]tcpState)
	accu[newTcpStateXevent(CLOSED, APP_PASSIVE_OPEN)] = LISTEN
	accu[newTcpStateXevent(CLOSED, APP_ACTIVE_OPEN)] = SYN_SENT
	accu[newTcpStateXevent(LISTEN, RCV_SYN)] = SYN_RCVD
	accu[newTcpStateXevent(LISTEN, APP_SEND)] = SYN_SENT
	accu[newTcpStateXevent(LISTEN, APP_CLOSE)] = CLOSED
	accu[newTcpStateXevent(SYN_RCVD, APP_CLOSE)] = FIN_WAIT_1
	accu[newTcpStateXevent(SYN_RCVD, RCV_ACK)] = ESTABLISHED
	accu[newTcpStateXevent(SYN_SENT, RCV_SYN)] = SYN_RCVD
	accu[newTcpStateXevent(SYN_SENT, RCV_SYN_ACK)] = ESTABLISHED
	accu[newTcpStateXevent(SYN_SENT, APP_CLOSE)] = CLOSED
	accu[newTcpStateXevent(ESTABLISHED, APP_CLOSE)] = FIN_WAIT_1
	accu[newTcpStateXevent(ESTABLISHED, RCV_FIN)] = CLOSE_WAIT
	accu[newTcpStateXevent(FIN_WAIT_1, RCV_FIN)] = CLOSING
	accu[newTcpStateXevent(FIN_WAIT_1, RCV_FIN_ACK)] = TIME_WAIT
	accu[newTcpStateXevent(FIN_WAIT_1, RCV_ACK)] = FIN_WAIT_2
	accu[newTcpStateXevent(CLOSING, RCV_ACK)] = TIME_WAIT
	accu[newTcpStateXevent(FIN_WAIT_2, RCV_FIN)] = TIME_WAIT
	accu[newTcpStateXevent(TIME_WAIT, APP_TIMEOUT)] = CLOSED
	accu[newTcpStateXevent(CLOSE_WAIT, APP_CLOSE)] = LAST_ACK
	accu[newTcpStateXevent(LAST_ACK, RCV_ACK)] = CLOSED
	return accu
}

// Returns next status of the TCP state machine.
// Returns ERROR if event is invalid for the current state.
func nextState(currentState tcpState, event tcpEvent) tcpState {
	se := newTcpStateXevent(currentState, event)
	return stateTransitions[se]
}

func TraverseTCPStates(events []string) string {
	state := CLOSED
	for _, eventName := range events {
		event := name2TcpEvent[eventName]
		state = nextState(state, event)
	}
	return tcpState2Name[state]
}
