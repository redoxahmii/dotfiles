#!/usr/bin/env bash
set -euo pipefail

theme=${1:-}
case "$theme" in
  solarized)
    wallpaper="$HOME/Pictures/wallpapers/normal/japan.jpg"
    lock_wallpaper="$HOME/Pictures/wallpapers/normal/japan-blurred.jpg"
    kitty_theme=solarized.conf
    ;;
  tokyonight)
    wallpaper="$HOME/Pictures/wallpapers/normal/purple.jpg"
    lock_wallpaper="$HOME/Pictures/wallpapers/normal/purple-blur.jpg"
    kitty_theme=../folke-night.conf
    ;;
  *)
    printf 'Usage: %s solarized|tokyonight\n' "$0" >&2
    exit 2
    ;;
esac

root=$(realpath "$(dirname "${BASH_SOURCE[0]}")/../..")
for file in "$wallpaper" "$lock_wallpaper" "$root/rofi/themes/$theme/apps.rasi" "$root/waybar/themes/$theme.css" "$root/hypr/themes/$theme-lock.conf"; do
  if [[ ! -f $file ]]; then
    printf 'Missing theme asset: %s\n' "$file" >&2
    exit 1
  fi
done

ln -sfn "$theme" "$root/rofi/themes/current"
ln -sfn "$theme.css" "$root/waybar/themes/current.css"
ln -sfn "$kitty_theme" "$root/kitty/themes/current.conf"
ln -sfn "../themes/$theme.conf" "$root/dunst/dunstrc.d/current.conf"
ln -sfn "$wallpaper" "$root/hypr/current-wallpaper.jpg"
ln -sfn "$lock_wallpaper" "$root/hypr/current-lock-wallpaper.jpg"
ln -sfn "$theme-lock.conf" "$root/hypr/themes/current-lock.conf"

if pgrep -x waybar >/dev/null; then
  pkill -USR2 -x waybar || printf 'Could not reload Waybar\n' >&2
fi
if pgrep -x dunst >/dev/null; then
  dunstctl reload || printf 'Could not reload Dunst\n' >&2
fi
for pid in $(pgrep -x kitty || true); do
  socket="/tmp/kitty-$pid"
  if [[ -S $socket ]]; then
    kitty @ --to "unix:$socket" set-colors --all --configured "$root/kitty/themes/current.conf" || printf 'Could not update Kitty on %s\n' "$socket" >&2
  fi
done

instance=$(hyprctl instances | sed -n '/^instance / {s/^instance \(.*\):$/\1/p;q;}')
if [[ -n $instance ]]; then
  if pgrep -x hyprpaper >/dev/null; then
    HYPRLAND_INSTANCE_SIGNATURE="$instance" hyprctl hyprpaper wallpaper "eDP-1, $wallpaper, cover" || printf 'Could not update hyprpaper\n' >&2
  fi
  if pgrep -x hypridle >/dev/null; then
    pkill -x hypridle
    HYPRLAND_INSTANCE_SIGNATURE="$instance" hypridle >/dev/null 2>&1 &
  fi
fi

printf 'Theme: %s\n' "$theme"
