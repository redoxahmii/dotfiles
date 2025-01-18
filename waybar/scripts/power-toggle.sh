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
  if [ $? -eq 0 ]; then
    dunstify -u low -h string:x-dunst-stack-tag:powerprofile -i battery-full-charged \
      "Power Profile" "Switched to <b>Performance</b>"
  else
    dunstify -u critical -i dialog-error "Power Profile" "Failed to switch to performance"
  fi
elif [ "$current_state" == "performance" ]; then
  powerprofilesctl set balanced
  if [ $? -eq 0 ]; then
    dunstify -u low -h string:x-dunst-stack-tag:powerprofile -i battery-good \
      "Power Profile" "Switched to <b>Balanced</b>"
  else
    dunstify -u critical -i dialog-error "Power Profile" "Failed to switch to balanced"
  fi
elif [ "$current_state" == "power-saver" ]; then
  powerprofilesctl set balanced
  if [ $? -eq 0 ]; then
    dunstify -u low -h string:x-dunst-stack-tag:powerprofile -i battery-good \
      "Power Profile" "Switched to <b>Balanced</b>"
  else
    dunstify -u critical -i dialog-error "Power Profile" "Failed to switch to balanced"
  fi
else
  dunstify -u normal -i dialog-warning "Power Profile" "Unknown state: <b>$current_state</b>"
fi
