-- ====================================
--            DJXS4N DOTFILES
--  CONFIGURACION DE APLICACIONES 
--              DE INICIO
-- ====================================

local scriptsDir = os.getenv("HOME") .. "/.config/hypr/scripts"

hl.on("hyprland.start", function()
  -- Demonio de Wallpapers
  hl.dsp.exec_cmd("swww-daemon --format xrgb")

  -- Configuración del Entorno de Sesión (D-Bus / Systemd)
  hl.dsp.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.dsp.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

  -- Aplicaciones y Helpers del Sistema
  hl.dsp.exec_cmd(scriptsDir .. "/Dropterminal.sh kitty &")
  hl.dsp.exec_cmd(scriptsDir .. "/Polkit.sh")
  hl.dsp.exec_cmd("nm-applet --indicator")
  hl.dsp.exec_cmd("nm-tray")
  hl.dsp.exec_cmd("swaync")
  hl.dsp.exec_cmd("waybar")
  hl.dsp.exec_cmd("qs -c overview")
  hl.dsp.exec_cmd("hypridle")
  hl.dsp.exec_cmd(scriptsDir .. "/Hyprsunset.sh init")

  -- Gestor de Portapapeles (Cliphist)
  hl.dsp.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.dsp.exec_cmd("wl-paste --type image --watch cliphist store")

  -- Extras Habilitados
  hl.dsp.exec_cmd("blueman-applet")
  hl.dsp.exec_cmd("ags")
  hl.dsp.exec_cmd(scriptsDir .. "/KeybindsLayoutInit.sh")
end)


