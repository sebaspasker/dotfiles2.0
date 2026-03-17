#!/usr/bin/env bash
set -euo pipefail

action="${1:-goto}" # goto | move | movefollow
slot="${2:-1}"      # 1..10

focused_monitor="$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name')"

case "$focused_monitor" in
"eDP-1") base=0 ;;
"HDMI-A-1") base=10 ;;
"DVI-I-1") base=20 ;;
*) exit 1 ;;
esac

target=$((base + slot))

case "$action" in
goto)
  hyprctl dispatch workspace "$target"
  ;;
move)
  hyprctl dispatch movetoworkspace "$target"
  ;;
movefollow)
  hyprctl dispatch movetoworkspace "$target"
  hyprctl dispatch workspace "$target"
  ;;
*)
  exit 1
  ;;
esac
