#!/bin/bash

REC=$(slop -c 0.447058,0.439156,0.439156,1 -t 0 -k -b 3 -f "%x %y %w %h") || exit 1
read -r X Y W H <<< $REC

let W=$((($W-40)/9))
let H=$((($H-40)/18))

urxvt --background '[85]#1C2023' -name float -g $W"x"$H"+"$X"+"$Y &
