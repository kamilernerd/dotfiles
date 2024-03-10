#! /bin/bash
killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar --list-monitors | while IFS=$'\n' read line; do
  monitor=$(echo $line | cut -d':' -f1)
  primary=$(echo $line | cut -d' ' -f3)
	echo $monitor
	echo $primary
  MONITOR=$monitor polybar --reload "topbar${primary:+"-primary"}" &
done
