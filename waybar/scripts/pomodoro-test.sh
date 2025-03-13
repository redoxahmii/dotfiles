#!/bin/bash

LOCKFILE="/tmp/pomodoro.lock"
POMODORO_SERVICE="waybar-pomodoro.service"

# Ensure only one instance runs
if [[ -f "$LOCKFILE" ]]; then
  old_pid=$(cat "$LOCKFILE")
  if ps -p "$old_pid" >/dev/null 2>&1; then
    echo "Another instance is running (PID: $old_pid). Exiting..."
    exit 1
  fi
fi
echo $$ >"$LOCKFILE"

CURRENT_STATE="work"

# Read output from the systemd service journal
journalctl --user -u $POMODORO_SERVICE -f -o cat | while read -r line; do
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
      systemctl --user restart $POMODORO_SERVICE
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
          --button="Start Work!gtk-ok:sh -c 'systemctl --user restart $POMODORO_SERVICE; pkill -f yad'" \
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

# Cleanup on exit
rm -f "$LOCKFILE"
