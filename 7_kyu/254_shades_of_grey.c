#include <stdio.h>

void shades_of_grey (int n, char *const shades[n])
{
  if( n > 254 )
    n = 254;
	for( int i = 1; i <= n; ++i )
    sprintf(shades[i-1],"#%02x%02x%02x",i,i,i);    
}