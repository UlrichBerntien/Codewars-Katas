a=$1
b=$2
c=$3
max=$(( a+b+c ))
x=$(( a+b*c ))
if [[ $x -gt $max ]]; then max=$x; fi
x=$(( (a+b)*c ))
if [[ $x -gt $max ]]; then max=$x; fi
x=$(( a*b+c ))
if [[ $x -gt $max ]]; then max=$x; fi
x=$(( a*(b+c) ))
if [[ $x -gt $max ]]; then max=$x; fi
x=$(( a*b*c ))
if [[ $x -gt $max ]]; then max=$x; fi
echo $max