#!/usr/bin/env bash

#reproductor de audio para hyprlock

player=$(playerctl -l 2>/dev/null | head -1)
[ -z "$player" ] && exit 0

status=$(playerctl status 2>/dev/null)
icon="󰐊"; [ "$status" = "Playing" ] && icon="󰏤"

esc() { printf '%s' "$1" | sed 's/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g'; }
title=$(playerctl metadata title 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)
[ -z "$title" ] && exit 0

printf '<b>%s</b>\n<i>%s</i>\n%s' "$title" "$icon" "${artist:-Desconocido}" 
