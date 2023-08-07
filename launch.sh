#!/usr/bin/env bash

# Terminate any currently running instances
killall -q polybar

# Pause while killall completes
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

if type "xrandr" > /dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload top -c ~/.config/polybar/config &
  done
else
  polybar --reload top -c ~/.config/polybar/config &
fi

# Launch bar(s)
 polybar dummy -q &
 polybar top -q &
 polybar bottom -q &

 #my_laptop_external_monitor=$(xrandr --query | grep 'DP-1-1')
#if [[ $my_laptop_external_monitor = *connected* ]]; then
 #   polybar top_ex &
#fi

echo "polybars launched..."