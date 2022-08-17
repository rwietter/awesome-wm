#!/bin/bash

TODAY=$(expr `date +'%d'` + 0)

(
    echo "^fg(#FFFFFF)^fn(PragmataPro for Powerline:pixelsize=16)"; echo
    \
    cal | sed -re "s/^(.*[A-Za-z][A-Za-z]*.*)$/^fg(#bb9af7)^bg(#101012)\1/;s/(^|[ ])($TODAY)($|[ ])/\1^bg(#FFFFFF)^fg(#7aa2f7)\2^fg(#FFFFFF)^bg(#7aa2f7)\3/"
    sleep 20
) | dzen2 -fg '#FFFFFF' -bg '#101012' -fn 'PragmataPro for Powerline:pixelsize=15' -x 55 -y 8 -w 200 -l 10 -h 20 -sa c -e 'onstart=uncollapse;button1=exit'
