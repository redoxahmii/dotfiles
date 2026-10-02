#!/usr/bin/env bash
set -euo pipefail

root=$(realpath "$(dirname "${BASH_SOURCE[0]}")/../..")
current=$(readlink "$root/rofi/themes/current" 2>/dev/null || true)
case "$current" in
  solarized) current_name='Solarized Osaka' ;;
  tokyonight) current_name='Tokyo Night' ;;
  *) current_name='Not selected' ;;
esac

choice=$(printf 'Solarized Osaka\0icon\x1f%s\nTokyo Night\0icon\x1f%s\n' \
  "$root/rofi/images/solarized-preview.jpg" "$root/rofi/images/tokyonight-preview.jpg" | \
  rofi -dmenu -show-icons -no-custom -format i \
  -p 'THEME' -mesg "Current: $current_name" \
  -theme "$root/rofi/themes/theme-picker.rasi") || exit 0

case "$choice" in
  0) theme=solarized ;;
  1) theme=tokyonight ;;
  *) exit 0 ;;
esac

[[ $current == "$theme" ]] || "$root/hypr/scripts/switch-theme.sh" "$theme"
