#!/bin/sh

VOL=$(amixer get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "MM" } else { print $2 }}' | head -n 1)
mouseOn=`synclient -l | grep TouchpadOff | grep 0`
mouseColor="#689d6a"
if [ -z "$mouseOn" ]; then
    mouseColor="#d65d0e"
fi
echo "<fc=$mouseColor><icon=.icons/mouse_01.xbm/></fc> | <icon=.icons/phones.xbm/>: <fc=#d65d0e>$VOL%</fc>"
