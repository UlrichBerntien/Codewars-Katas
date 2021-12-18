declare -A months=([JAN]=01 [FEB]=02 [MRZ]=03 [APR]=04 [MAY]=05 [JUN]=06 [JUL]=07 [AUG]=08 [SEP]=09 [OCT]=10 [NOV]=11 [DEC]=12)
name=${1^^}
echo ${months[${name::3}]}