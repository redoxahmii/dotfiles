#!/bin/sh

state=$(powerprofilesctl get)

if [ "$state" = "balanced" ]; then
  echo "Chill 󰒴"
elif [ "$state" = "performance" ]; then
  echo "Juiced "
  exit 0
elif [ "$state" = "power-saver" ]; then
  echo "Snail 󱙷"
else
  echo "???"
fi
