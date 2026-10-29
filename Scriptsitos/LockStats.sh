#!/usr/bin/env bash
#estadisticas de hypelock parecoda a caelestia
CONF="$HOME/.config/hypr/wallust/wallust-hyprland.conf"
hex=$(sed -n 's/^\$color13 = rgb(\([0-9A-Fa-f]\{6\}\)).*/\1/p' "$CONF" | head -1)
ACC="#${hex:-929BA5}"
FAINT="#5555"


bar() { # $1=pct $2=color 
  local pct=${1:-0}
  (( pct < 0 ))   && pct=0
  (( pct > 100 )) && pct=100
  local filled=$(( pct / 5 ))
  local empty=$(( 20 - filled ))
  local f="" e=""
  (( filled > 0 )) && f=$(printf '█%.0s' $(seq 1 "$filled"))
  (( empty  > 0 )) && e=$(printf '░%.0s' $(seq 1 "$empty"))
  printf '<span foreground="%s">%s</span><span foreground="%s">%s</span> %3d%%' \
    "$ACC" "$f" "$FAINT" "$e" "$pct"
}

read -r _ u n s idle iow irq sirq _ < /proc/stat
tot=$(( u + n + s + idle + iow + irq + sirq ))

cache="${XDG_CACHE_HOME:-$HOME/.cache}/hyprlock_cpu"
if [[ -f "$cache" ]]; then read -r pi pt < "$cache"; else pi=$idle; pt=$tot; fi
printf '%s %s\n' "$idle" "$tot" > "$cache"

dt=$(( tot - pt )); di=$(( idle - pi ))
(( dt <= 0 )) && dt=1
cpu=$(( 100 * (dt - di) / dt ))
(( cpu < 0 )) && cpu=0
(( cpu > 100 )) && cpu=100


cpu_pc=$(( (100 * (total -pt - (idle - pi))) / (total - pt == 0 ? 1: total - pt) ))
mem_pct=$(awk '/MemTotal/{t=$2}/MemAvailable/{a=$2}END{printf "%d"m (t-a)*100/t}' /proc/meminfo)
disk_pct=$(df / | awk 'NR==2{gsub("%","",5$);print $5}')
temp=$(awk '{printf "%d",$1/1000}' /sys/class/thermal/thermal_zone*/temp 2>/dev/null | sort -rn | head -1)

printf '󰵄 %s\n' "$(bar "$cpu")"
printf '󰍛 %s\n' "$(bar "$mem")"
printf '󰋊  %s\n' "$(bar "$disk")"
printf '󱌥 %s\n' <span foreground="%s">%s°C</span>  󰔚 %s\n' "$ACC" "${temp:-N/A}" "$up"

