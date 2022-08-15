#!/usr/bin/sh
used_mem="$(free -h | awk '/Mem/ {print $3}')"
free_mem="$(free -h | awk '/Mem/ {print $7}')"
echo $used_mem " / " $free_mem
