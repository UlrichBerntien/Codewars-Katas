if [[ $1 -gt 0 ]]; then
  echo $(( 8 + 12*($1-1) + 6*($1-1)*($1-1) ))
else
  echo 1
fi