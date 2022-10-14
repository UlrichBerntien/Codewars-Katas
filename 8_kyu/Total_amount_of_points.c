#include <string.h>

const int NUMBER_GAMES = 10;

// Sum the points reached in the NUMBER_GAMES games.
// Each game has format "x:y".
int points(const char* const games[NUMBER_GAMES]) {
  // NULL pointer error.
  if( games == NULL )
    return 0;
  int sum = 0;
  for( int i = 0; i < NUMBER_GAMES; ++i ) {
    // Format error.
    if( games[i] == NULL || strlen(games[i]) != 3 || games[i][1] != ':' )
      return 0;
    // Add points for the game i.
    const char x = games[i][0];
    const char y = games[i][2];
    if( x > y )
      sum += 3;
    else if( x == y )
      sum += 1;
  }
  return sum;
}
