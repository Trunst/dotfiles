#!/bin/sh

iwconfig wlan0 2>&1 | grep -q no\ wireless\ extensions\. && {
  echo wired
  exit 0
}

essid=`iwconfig wlp3s0 | awk -F '"' '/ESSID/ {print $2}'`
stngth=`iwconfig wlp3s0 | awk -F '=' '/Quality/ {print $2}' | cut -d '/' -f 1`

echo "<fc=#d65d0e><icon=.icons/wifi_01.xbm/></fc> $essid <fc=#d65d0e>$stngth% $http_proxy</fc>"
exit 0

