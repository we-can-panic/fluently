import ../fluently/walrus

from unittest import check

check (a:=10) == a


block:
  var gotFlg = false
  if (x:=10) in 0..100:
    check x==10
    gotFlg = true
  check gotFlg
