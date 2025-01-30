#!/bin/bash

# Get current power profile state
current_state=$(powerprofilesctl get 2>/dev/null)
if [ $? -ne 0 ]; then
  dunstify -u critical "Power Profile" "Failed to get power profile" -i dialog-error
  exit 1
fi

# Check the state and toggle
if [ "$current_state" == "balanced" ]; then
  powerprofilesctl set performance
elif [ "$current_state" == "performance" ]; then
  powerprofilesctl set balanced
elif [ "$current_state" == "power-saver" ]; then
  powerprofilesctl set balanced
else
  return
fi
