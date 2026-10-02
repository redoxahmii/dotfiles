#!/bin/bash

# Check if Rofi is running
if pgrep -x "rofi" >/dev/null; then
  # Kill Rofi if it's running
  pkill -x rofi
else
  # Launch the battery applet
  "$HOME/.config/rofi/scripts/battery.sh"
fi
