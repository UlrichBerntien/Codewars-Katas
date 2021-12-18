n=$1
start=$(( 1 + n*(n-1) ))
echo $(( n*(n-1) + start*n ))