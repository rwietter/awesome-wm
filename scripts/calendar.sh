#!/bin/bash

TODAY=$(expr `date +'%d'` + 0)

(
echo "^fg(#ccd0d9)^fn(fantasque sans mono:pixelsize=16)"; echo
\
cal | sed -re "s/^(.*[A-Za-z][A-Za-z]*.*)$/^fg(#F92D72)^bg(#101012)\1/;s/(^|[ ])($TODAY)($|[ ])/\1^bg(#ccd0d9)^fg(#F92D72)\2^fg(#ccd0d9)^bg(#F92D72)\3/"
sleep 20
) | dzen2 -fg '#ccd0d9' -bg '#101012' -fn 'fantasque sans mono:pixelsize=15' -x 55 -y 8 -w 200 -l 10 -h 20 -sa c -e 'onstart=uncollapse;button1=exit'
