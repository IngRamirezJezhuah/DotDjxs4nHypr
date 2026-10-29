#!/usr/bin/env bash
player=$(playerctl -l 2>/dev/null | head -1)

# reproductor de audio
[ -z "$player" ] && exit 0
status=$(playerctl status 2>/dev/null)
icon="󰐊"; [ "$status" = "Playing" ] && icon="󰏤"
title=$(playerctl metadata title 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)
printf '<b>%s</b>\n<i>%s</i>\n%s' "$title" "$artist" "$icon"
