-- ================================================
--                ᯓᡣ𐭩Djxs4n.ᐟ⊹
--              DJXS4N DOTFILES
--          HYPRLAND 0.56 - CONF LUA
--            Autostart / Inicio
--  Fuente: hyprland.conf + Keybinds.conf +
--  Startup_Apps (vendor + user) + ENVariables
-- ================================================

local home = os.getenv("HOME")
local scriptsDir = home .. "/.config/hypr/scripts"

-- Equivalente a exec-once: se ejecuta una vez al inicio de Hyprland pa que jale
hl.on("hyprland.start", function()

    --  inicialización (solo la primera vez)
    hl.exec_cmd(home .. "/.config/hypr/initial-boot.sh")

    -- Keybinds.conf: layout dinámico inicial
    hl.exec_cmd(scriptsDir .. "/ChangeLayout.sh init")

    -- configs/Startup_Apps.conf (vendor, en orden original)
    hl.exec_cmd("swww-daemon --format xrgb")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd(home .. "/.config/hypr/scripts/Dropterminal.sh kitty &")
    hl.exec_cmd(scriptsDir .. "/Polkit.sh")
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("nm-tray")
    hl.exec_cmd("swaync")
    hl.exec_cmd("waybar")
    hl.exec_cmd("qs -c overview")
    hl.exec_cmd("hypridle")
    hl.exec_cmd(scriptsDir .. "/Hyprsunset.sh init")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("ags")
    hl.exec_cmd(scriptsDir .. "/KeybindsLayoutInit.sh")

    -- UserConfigs/Startup_Apps.conf: cursor (DEDUPLICADO —
    -- el mismo trío se repite en ENVariables.conf, se ejecuta una sola vez) tenlo en cuenta yo del futuro
    hl.exec_cmd("hyprctl setcursor MikuCat 24")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'MikuCat'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 24")

end)
