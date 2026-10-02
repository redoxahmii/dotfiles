#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Launcher (Modi Drun, Run, File Browser, Window)
#
theme="$HOME/.config/rofi/themes/clipboard.rasi"

cliphist list | rofi -theme "$theme" -dmenu | cliphist decode | wl-copy
