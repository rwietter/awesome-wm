#!/bin/bash

hddtemp="$(sudo hddtemp /dev/sda | awk '{ print $4}')"
echo $hddtemp
