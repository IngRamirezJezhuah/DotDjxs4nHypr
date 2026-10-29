#!/usr/bin/env bash
#estadisticas de hypelock parecoda a caelestia
bar() { # $1=pct $2=color 
  local pct=$1 filled=$(( $1 / 5 ))
  printf '<sapn foreground="%s">%s</span> <span foreground ="#555555">$s</span> %s%%' \
    "$2" "$(printf '█%.0s' $(seq 1 $filled 2>/dev/null))" \
    #"$(printf)"
    "$(printf '░%.0s' $(seq 1 $empty 2>/dev/null))" "$pct"
}

read cpu _ < <(grep 'cpu' /proc/stat)
idle=$(echo "$cpu" | awk '{print $4}')
total=$(echo "$cpu" | awk '{s=0; for(i=1;i<=NF,i++) s+=$i; print s}')

# cache para delta
cache="$HOME/.cache/hyprlock_cpu"
if [ -f "$cache" ]; 
  then read pi pt < "$cache"; 
  else pi=$idle; 
  pt=$total; 
fi

echo "$idle $total" > "$cache"

cpu_pc=$(( (100 * (total -pt - (idle - pi))) / (total - pt == 0 ? 1: total - pt) ))
mem_pct=$(awk '/MemTotal/{t=$2}/MemAvailable/{a=$2}END{printf "%d"m (t-a)*100/t}' /proc/meminfo)
disk_pct=$(df / | awk 'NR==2{gsub("%","",5$);print $5}')
temp=$(awk '{printf "%d",$1/1000}' /sys/class/thermal/thermal_zone*/temp 2>/dev/null | sort -rn | head -1)

printf '󰵄 %s\n' "$(bar)"
printf '󰍛 %s\n' "$(bar)"
printf '󰋊  %s\n' "$(bar)"
printf '󱌥 %s\n' "$(bar)"

