#!/usr/bin/env bash

# Obtener el perfil actual usando powerprofilesctl o asusctl (ajusta según lo que uses en tu distro)
CURRENT_PROFILE=$(powerprofilesctl get)

if [ "$CURRENT_PROFILE" = "power-saver" ]; then
    powerprofilesctl set balanced
    notify-send "󰾆 Perfil de Energía" "Cambiado a Modo Equilibrado" -u low
elif [ "$CURRENT_PROFILE" = "balanced" ]; then
    powerprofilesctl set performance
    notify-send "󰓅 Perfil de Energía" "¡Modo Alto Rendimiento Activo!" -u normal
else
    powerprofilesctl set power-saver
    notify-send "󱈑 󰌪 Perfil de Energía" "Cambiado a Ahorro de Batería" -u low
fi

