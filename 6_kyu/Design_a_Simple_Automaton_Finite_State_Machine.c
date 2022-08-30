#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>


// The states of the automate.
typedef enum { q1, q2, q3 } state;

// The events the automate can handle.
typedef enum { e0, e1 } event;

// One entry in the transtion table.
typedef struct
{
  state start;      // if automate in start state
  event incoming;   // received incoming event
  state result;     // this is the result state
} transition;

// The transition table of the automate.
// The state transitions are defined in the Kata.
static const transition transitions [] =
{
  { q1, e0, q1 }, 
  { q1, e1, q2 }, 
  { q2, e0, q3 }, 
  { q2, e1, q2 }, 
  { q3, e0, q2 }, 
  { q3, e1, q2 }
};

// Length of transition table
static const int len_transitions = sizeof transitions / sizeof (transition);

// Returns the next state of the automate.
// The automate is in the 'current' state and receives the 'signal'.
static state get_next_state (const state current, const event signal )
{
  // Simple linear search in the table. The table is short, so it is fast enough.
  // Hashing 'current+signal -> next' could acceleratee the implementation.
  for( int index = 0; index < len_transitions; ++index )
  {
    const transition *const tr = transitions + index;
    if( tr->start == current && tr->incoming == signal )
      return tr->result;
  }
  // Fatal error the transition is not in the table!
  fputs("missing transition table entry\n", stderr );
  abort();
}

// Translates character into event.
static event get_event (const char c)
{
  switch (c) {
      case '0' :
        return e0;
      case '1' :
        return e1;
      default :
        fprintf( stderr, "invalid event character '%c'\n", c);
        abort();
  }  
}

// Interpret the events from the commands.
// Returned true if the defined automate stops in the q2 state.
bool read_commands(const char commands [])
{
  // Automate starts in q1
  state current = q1;
  for( const char* in = commands; *in != '\0'; ++in )
    current = get_next_state( current, get_event(*in) );
  // Correct exit state is q2
  return current == q2;
}
