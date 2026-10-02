#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Launcher (Modi Drun, Run, File Browser, Window)
#
theme="$HOME/.config/rofi/themes/current/calculator.rasi"

rofi -show calc -modi calc -no-show-match -no-sort -terse -theme "$theme" -calc-command "echo -n '{result}' | wl-copy"
