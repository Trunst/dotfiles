#!/bin/sh

VOL=$(amixer get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "MM" } else { print $2 }}' | head -n 1)
echo "<icon=.icons/phones.xbm/>: <fc=#d65d0e>$VOL%</fc>"
