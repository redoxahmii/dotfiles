#!/bin/bash

POMODORO_SCRIPT="$HOME/.local/bin/waybar-module-pomodoro"
LOCKFILE="/tmp/pomodoro.lock"
SCRIPT_NAME=$(basename "$0")

# Function to check if a process is our pomodoro process
is_our_process() {
  local pid=$1
  # Check if the process exists and its command line matches our script or pomodoro binary
  if ps -p "$pid" >/dev/null 2>&1; then
    if grep -q -e "$POMODORO_SCRIPT" -e "$SCRIPT_NAME" /proc/"$pid"/cmdline 2>/dev/null; then
      return 0
    fi
  fi
  return 1
}

# Check for existing instances
if [[ -f "$LOCKFILE" ]]; then
  old_pid=$(cat "$LOCKFILE")
  if is_our_process "$old_pid"; then
    echo "Another instance is already running (PID: $old_pid). Exiting..."
    exit 1
  else
    # Clean up stale lockfile
    rm -f "$LOCKFILE"
  fi
fi

# Create new lockfile
echo $$ >"$LOCKFILE"

# Clean up function
cleanup() {
  # Kill the pomodoro process if it's still running
  pkill -f "$POMODORO_SCRIPT --no-icons -w 40 -s 13 -l 25" || true
  rm -f "$LOCKFILE"
}

# Set trap to clean up on exit
trap cleanup EXIT

CURRENT_STATE="work"

# Start the pomodoro process
$POMODORO_SCRIPT --no-icons -w 40 -s 13 -l 25 | while read -r line; do
  text=$(echo "$line" | jq -r '.text')

  if [[ $text == *""* && $CURRENT_STATE == "work" ]]; then
    CURRENT_STATE="break"

    break_time=$(echo "$text" | grep -oP '\d+:\d+' | awk -F: '{print $1 * 60 + $2}')

    yad --text="\n\n<span font='24'><b>Shaheen take a chill pill 😊</b></span>" \
      --title="Pomodoro Timer" \
      --center \
      --undecorated \
      --width=1900 \
      --height=1000 \
      --text-align=center \
      --buttons-layout=spread \
      --image="$HOME/Pictures/allama-iqbal.png" \
      --button="Start Break!gtk-ok:0" \
      --button="Close!gtk-close:1" \
      --no-cancel

    if [[ $? -eq 0 ]]; then
      $POMODORO_SCRIPT toggle
      (
        for ((i = break_time; i >= 0; i--)); do
          percentage=$((100 - (i * 100 / break_time)))
          echo "$percentage" || break
          sleep 1
        done
        pkill -f "yad --progress"
      ) | yad --progress \
        --text="\n\n<span font='24'><b>Break Time!</b></span>" \
        --title="Pomodoro Timer" \
        --center \
        --width=1900 \
        --height=1000 \
        --undecorated \
        --text-align=center \
        --buttons-layout=spread \
        --image=dialog-warning \
        --no-buttons \
        --no-cancel &
      disown
      (
        sleep "$break_time"
        yad --text="\n\n<span font='24'><b>Break Over! Ready to work?</b></span>" \
          --title="Pomodoro Timer" \
          --center \
          --width=1900 \
          --height=1000 \
          --undecorated \
          --text-align=center \
          --buttons-layout=spread \
          --image=dialog-information \
          --button="Start Work!gtk-ok:sh -c '$POMODORO_SCRIPT toggle; pkill -f yad'" \
          --button="Close!gtk-close:0" \
          --no-cancel &
      ) &
      disown
    fi
  elif [[ $text == *"󰔟"* && $CURRENT_STATE == "break" ]]; then
    CURRENT_STATE="work"
  fi

  echo "$line" || break
done
