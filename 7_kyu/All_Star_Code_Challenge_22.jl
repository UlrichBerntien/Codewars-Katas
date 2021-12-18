function totime(seconds)
  h,m = divrem(seconds ÷ 60, 60)
  "$h hour(s) and $m minute(s)"
end