-- =============================================
--                ᯓᡣ𐭩Djxs4n.ᐟ⊹
--              DJXS4N DOTFILES
--          HYPRLAND 0.56 - CONF LUA
--            Keybinds / Atajos
--   Fuente: configs/Keybinds.conf (1:1)
-- ================================================

-- =============== 
--    Variables
-- ===============
local mainMod = "SUPER"
local home = os.getenv("HOME")
local scriptsDir = home .. "/.config/hypr/scripts"
local UserScripts = home .. "/.config/hypr/UserScripts"
local term = "kitty"
files = "thunar"

-- ==============
--    ESTANDAR
-- ==============

hl.bind( mainMod .. " + D",
  hl.dsp.exec_cmd('pkill rofi || true && rofi -show drun,filebrowser,run,window'),
  { description = "lanzador de apps"})

hl.bind( mainMod .. " + B",
  hl.dsp.exec_cmd('xdg-open "https://"'),
  { description = "abre el navegador por defecto" })

hl.bind( mainMod .. " + A",
  hl.dsp.exec_cmd(scriptsDir .. "/OverviewToggle.sh"),
  { description = "Vista al escritorio" })
  
hl.bind( mainMod .. " + Return",
  hl.dsp.exec_cmd(term),
  { description = "Abre la Terminal" })
  
hl.bind( mainMod .. " + E",
  hl.dsp.exec_cmd(files),
  { description = "administrador de archivos" })

  -- =========================
  --    FEATURES EXTRAS
  -- =========================

  
hl.bind( mainMod .. " + T",
  hl.dsp.exec_cmd(scriptsDir .. "/ThemeChanger.sh"),
  { description = "Selector de colñor global ed wallust" })

hl.bind( mainMod .. " + H",
  hl.dsp.exec_cmd(scriptsDir .. "/KeyHints.sh"),
  { description = "ayuda / hoja de comandos" })
  
hl.bind( mainMod .. " + ALT + R",
  hl.dsp.exec_cmd(scriptsDir .. "/Refresh.sh"),
  { description = "Refresca la barra y menus" })
    
hl.bind( mainMod .. " + ALT + E",
  hl.dsp.exec_cmd(scriptsDir .. "/RofiEmoji.sh"),
  { description = "Menu de kaomojis" })
    
hl.bind( mainMod .. " + S",
  hl.dsp.exec_cmd('steam && notify-send -e -h string:x-canonical-private-synchronous:seam "Steam Ejecutandose..."'),
  { description = "Steam" })
    
hl.bind( mainMod .. " + V",
  hl.dsp.exec_cmd("code"),
  { description = "Abre visual Studio Code" })
    
hl.bind( mainMod .. " + CTRL + S",
  hl.dsp.exec_cmd('rofi -show window'),
  { description = "cambia ventana" })
    
hl.bind( mainMod .. " + ALT + O",
  hl.dsp.exec_cmd(scriptsDir .. "/ChangeBlur.sh"),
  { description = "toggle blur" })
    
hl.bind( mainMod .. " + SHIFT + G",
  hl.dsp.exec_cmd(scriptsDir .. "/GameMode.sh"),
  { description = "Pone el Modo Juegos" })
    
hl.bind( mainMod .. " + ALT + L",
  hl.dsp.exec_cmd(scriptsDir .. "/ChangeLayout.sh"),
  { description = "cambio el tipo de acomodo a dwindle" })
    
hl.bind( mainMod .. " + ALT + V",
  hl.dsp.exec_cmd(scriptsDir .. "/ClipManager.sh"),
  { description = "" })

hl.bind(mainMod .. " + CTRL + R", hl.dsp.exec_cmd(scriptsDir .. "/RofiThemeSelector.sh"), { description = "rofi theme selector" })
hl.bind(mainMod .. " + CTRL + SHIFT + R", hl.dsp.exec_cmd('pkill rofi || true && ' .. scriptsDir .. '/RofiThemeSelector-modified.sh'), { description = "rofi theme selector (modified)" })

hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen(), { description = "fullscreen" })
hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.fullscreen({ mode = "maximized" }), { description = "maximize window" })
hl.bind(mainMod .. " + SPACE", hl.dsp.window.float({ action = "toggle" }), { description = "Float current window" })
hl.bind(mainMod .. " + ALT + SPACE", hl.dsp.exec_cmd("hyprctl dispatch workspaceopt allfloat"), { description = "Float all windows" })

-- DropDown terminal (Scriptsitos: REEMPLAZA al de JaKooLit en la misma tecla)
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd(UserScripts .. "/Dropterminal.sh " .. term), { description = "DropDown terminal" })

-- Desktop zooming or magnifier
hl.bind(mainMod .. " + ALT + mouse_down",
    hl.dsp.exec_cmd([[hyprctl keyword cursor:zoom_factor "$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor * 2.0}')"]]),
    { description = "zoom in" })
hl.bind(mainMod .. " + ALT + mouse_up",
    hl.dsp.exec_cmd([[hyprctl keyword cursor:zoom_factor "$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor / 2.0}')"]]),
    { description = "zoom out" })

-- Waybar / Bar related
hl.bind(mainMod .. " + CTRL + ALT + B", hl.dsp.exec_cmd('pkill -SIGUSR1 waybar'), { description = "toggle waybar on/off" })
hl.bind(mainMod .. " + CTRL + B", hl.dsp.exec_cmd(scriptsDir .. "/WaybarStyles.sh"), { description = "waybar styles menu" })
hl.bind(mainMod .. " + ALT + B", hl.dsp.exec_cmd(scriptsDir .. "/WaybarLayout.sh"), { description = "waybar layout menu" })

-- Night light toggle (Hyprsunset)
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(scriptsDir .. "/Hyprsunset.sh toggle"), { description = "toggle night light" })

-- FEATURES / EXTRAS (UserScripts)
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd(UserScripts .. "/RofiBeats.sh"), { description = "online music" })
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(UserScripts .. "/WallpaperSelect.sh"), { description = "select wallpaper" })
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(UserScripts .. "/WallpaperEffects.sh"), { description = "wallpaper effects" })
hl.bind("CTRL + ALT + W", hl.dsp.exec_cmd(UserScripts .. "/WallpaperRandom.sh"), { description = "random wallpaper" })
hl.bind(mainMod .. " + CTRL + O", hl.dsp.window.set_prop({ prop = "opaque", value = "toggle" }), { description = "toggle active window opacity" })
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.exec_cmd(scriptsDir .. "/KeyBinds.sh"), { description = "search keybinds" })
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd(scriptsDir .. "/Animations.sh"), { description = "animations menu" })
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.exec_cmd(UserScripts .. "/ZshChangeTheme.sh"), { description = "change oh-my-zsh theme" })

-- Combos de layout (bind DIRECTO, no submap — decisión acordada)
hl.bind("ALT_L + SHIFT_L",
    hl.dsp.exec_cmd(scriptsDir .. "/KeyboardLayout.sh switch"),
    { locked = true, non_consuming = true, description = "switch keyboard layout globally" })
hl.bind("SHIFT_L + ALT_L",
    hl.dsp.exec_cmd(scriptsDir .. "/Tak0-Per-Window-Switch.sh"),
    { locked = true, non_consuming = true, description = "switch keyboard layout per-window" })

hl.bind(mainMod .. " + ALT + C", hl.dsp.exec_cmd(UserScripts .. "/RofiCalc.sh"), { description = "calculator" })

-- Move current workspaces to monitors (left right up or down)
hl.bind(mainMod .. " + CTRL + F9",  hl.dsp.workspace.move({ monitor = "l" }), { description = "move workspace to left monitor" })
hl.bind(mainMod .. " + CTRL + F10", hl.dsp.workspace.move({ monitor = "r" }), { description = "move workspace to right monitor" })
hl.bind(mainMod .. " + CTRL + F11", hl.dsp.workspace.move({ monitor = "u" }), { description = "move workspace to up monitor" })
hl.bind(mainMod .. " + CTRL + F12", hl.dsp.workspace.move({ monitor = "d" }), { description = "move workspace to down monitor" })

-- ═══════════════ SYSTEM ═══════════════
hl.bind("CTRL + ALT + Delete", hl.dsp.exit(), { description = "exit Hyprland" })
hl.bind(mainMod .. " + Q", hl.dsp.window.kill(), { description = "close active window" })
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd(scriptsDir .. "/KillActiveProcess.sh"), { description = "Terminate active process" })
hl.bind("CTRL + ALT + L", hl.dsp.exec_cmd(scriptsDir .. "/LockScreen.sh"), { description = "lock screen" })
hl.bind("CTRL + ALT + P", hl.dsp.exec_cmd(scriptsDir .. "/Wlogout.sh"), { description = "powermenu" })
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd('swaync-client -t -sw'), { description = "notification panel" })
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(scriptsDir .. "/Kool_Quick_Settings.sh"), { description = "Quick settings menu" })

-- =================================
--    Bloque 2 Master Layout
-- =================================
-- ═══════════════ Master Layout ═══════════════
hl.bind(mainMod .. " + CTRL + D", hl.dsp.layout("removemaster"), { description = "remove master" })
hl.bind(mainMod .. " + I", hl.dsp.layout("addmaster"), { description = "add master" })
-- NOTA: SUPER+J / SUPER+K los asigna dinámicamente scripts/KeybindsLayoutInit.sh
-- y scripts/ChangeLayout.sh — NO se atan aquí (igual que en el conf original)
hl.bind(mainMod .. " + CTRL + Return", hl.dsp.layout("swapwithmaster"), { description = "swap with master" })

-- ═══════════════ Dwindle Layout ═══════════════
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo(), { description = "toggle pseudo (dwindle)" })

-- Works on either layout (Master or Dwindle)
-- (splitratio: en el conf viejo era `exec hyprctl dispatch splitratio 0.3`;
--  roto desde Hyprland 0.54 — ahora va como layoutmsg real)
hl.bind(mainMod .. " + M", hl.dsp.layout("splitratio 0.3"), { description = "set split ratio 0.3" })
-- (la línea exec-once = ChangeLayout.sh init del conf migra a Autostart — Fase C)

-- ═══════════════ Cycle windows ═══════════════
-- Une los 2 binds originales de ALT+TAB (cycle next + bringactivetotop) en una sola función
hl.bind("ALT + tab", function()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.bring_to_top())
end, { description = "cycle next window" })

-- ═══════════════ Special Keys / Hot Keys ═══════════════
hl.bind("xf86audioraisevolume", hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --inc"), { repeating = true, locked = true, description = "volume up" })
hl.bind("xf86audiolowervolume", hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --dec"), { repeating = true, locked = true, description = "volume down" })
hl.bind("ALT + xf86audioraisevolume", hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --inc-precise"), { repeating = true, locked = true, description = "volume up precise" })
hl.bind("ALT + xf86audiolowervolume", hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --dec-precise"), { repeating = true, locked = true, description = "volume down precise" })
hl.bind("xf86AudioMicMute", hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --toggle-mic"), { locked = true, description = "toggle mic mute" })
hl.bind("xf86audiomute", hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --toggle"), { locked = true, description = "toggle mute" })
hl.bind("xf86Sleep", hl.dsp.exec_cmd("systemctl suspend"), { locked = true, description = "sleep" })
hl.bind("xf86Rfkill", hl.dsp.exec_cmd(scriptsDir .. "/AirplaneMode.sh"), { locked = true, description = "airplane mode" })

-- media controls using keyboards
hl.bind("xf86AudioPlayPause", hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --pause"), { locked = true, description = "play/pause" })
hl.bind("xf86AudioPause", hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --pause"), { locked = true, description = "pause" })
hl.bind("xf86AudioPlay", hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --pause"), { locked = true, description = "play" })
hl.bind("xf86AudioNext", hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --nxt"), { locked = true, description = "next track" })
hl.bind("xf86AudioPrev", hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --prv"), { locked = true, description = "previous track" })
hl.bind("xf86audiostop", hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --stop"), { locked = true, description = "stop" })

-- ═══════════════ Screenshot ═══════════════
-- NOTE: You may need to press Fn key as well
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --now"), { description = "screenshot now" })
hl.bind(mainMod .. " + SHIFT + Print", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --area"), { description = "screenshot (area)" })
hl.bind(mainMod .. " + CTRL + Print", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --in5"), { description = "screenshot in 5s" })
hl.bind(mainMod .. " + CTRL + SHIFT + Print", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --in10"), { description = "screenshot in 10s" })
hl.bind("ALT + Print", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --active"), { description = "screenshot active window" })

-- screenshot with swappy (another screenshot tool)
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --swappy"), { description = "screenshot (swappy)" })

-- ═══════════════ Resize windows ═══════════════
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true, description = "resize left (-50)" })
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true, description = "resize right (+50)" })
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true, description = "resize up (-50)" })
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true, description = "resize down (+50)" })

-- ═══════════════ Move windows ═══════════════
hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.move({ direction = "l" }), { description = "move window left" })
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.move({ direction = "r" }), { description = "move window right" })
hl.bind(mainMod .. " + CTRL + up",    hl.dsp.window.move({ direction = "u" }), { description = "move window up" })
hl.bind(mainMod .. " + CTRL + down",  hl.dsp.window.move({ direction = "d" }), { description = "move window down" })

-- ═══════════════ Swap windows ═══════════════
hl.bind(mainMod .. " + ALT + left",  hl.dsp.window.swap({ direction = "l" }), { description = "swap window left" })
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.swap({ direction = "r" }), { description = "swap window right" })
hl.bind(mainMod .. " + ALT + up",    hl.dsp.window.swap({ direction = "u" }), { description = "swap window up" })
hl.bind(mainMod .. " + ALT + down",  hl.dsp.window.swap({ direction = "d" }), { description = "swap window down" })

-- ═══════════════ group ═══════════════
hl.bind(mainMod .. " + G", hl.dsp.group.toggle(), { description = "toggle group" })

-- Navigate within a group
hl.bind(mainMod .. " + Tab", hl.dsp.group.next(), { description = "Change Group Forward" })
-- (SUPER+CTRL+tab: `changegroupactive` SIN argumento — queda en PENDIENTES, sin equivalente directo)
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.group.prev(), { description = "Change Group Back" })

-- Move window into/out of group
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.move({ into_group = "l" }), { description = "Move left into group" })
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.move({ into_group = "r" }), { description = "Move Right into group" })
hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.move({ out_of_group = true }), { description = "Move active out of group" })

-- ═══════════════ Move focus ═══════════════
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "l" }), { description = "focus left" })
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }), { description = "focus right" })
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "u" }), { description = "focus up" })
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "d" }), { description = "focus down" })

-- ===================================
--      Bloque 3 de keybinds 
-- ===================================

-- ═══════════════ Workspaces related ═══════════════

hl.bind(mainMod .. " + tab",       hl.dsp.focus({ workspace = "m+1" }), { description = "next workspace" })
hl.bind(mainMod .. " + SHIFT + tab", hl.dsp.focus({ workspace = "m-1" }), { description = "previous workspace" })

-- Special workspace
hl.bind(mainMod .. " + SHIFT + U", hl.dsp.window.move({ workspace = "special" }), { description = "move to special workspace" })

for i = 1, 10 do
    local code = "code:" .. (i + 9)

    -- Switch workspaces with mainMod + [0-9]
    hl.bind(mainMod .. " + " .. code,
        hl.dsp.focus({ workspace = i }),
        { description = "workspace " .. i })

    -- Move active window and follow: mainMod + SHIFT + [0-9]
    hl.bind(mainMod .. " + SHIFT + " .. code,
        hl.dsp.window.move({ workspace = i }),
        { description = "move to workspace " .. i })

    -- Move active window silently: mainMod + CTRL + [0-9]
    hl.bind(mainMod .. " + CTRL + " .. code,
        hl.dsp.window.move({ workspace = i, follow = false }),
        { description = "move silently to workspace " .. i })
end

-- brackets [ / ]
hl.bind(mainMod .. " + SHIFT + bracketleft",  hl.dsp.window.move({ workspace = "-1" }), { description = "move to previous workspace" })
hl.bind(mainMod .. " + SHIFT + bracketright", hl.dsp.window.move({ workspace = "+1" }), { description = "move to next workspace" })
hl.bind(mainMod .. " + CTRL + bracketleft",  hl.dsp.window.move({ workspace = "-1", follow = false }), { description = "move silently to previous workspace" })
hl.bind(mainMod .. " + CTRL + bracketright", hl.dsp.window.move({ workspace = "+1", follow = false }), { description = "move silently to next workspace" })

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "next workspace" })
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }), { description = "previous workspace" })
hl.bind(mainMod .. " + period",     hl.dsp.focus({ workspace = "e+1" }), { description = "next workspace" })
hl.bind(mainMod .. " + comma",      hl.dsp.focus({ workspace = "e-1" }), { description = "previous workspace" })

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true, description = "move window" })   -- mouse:272 = left click
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "resize window" }) -- mouse:273 = right click

-- ═══════════════ Laptops (configs/Laptops.conf) ═══════════════
-- (el device touchpad ya está en Settings/init.lua)
hl.bind("xf86KbdBrightnessDown", hl.dsp.exec_cmd(scriptsDir .. "/BrightnessKbd.sh --dec"), { repeating = true })
hl.bind("xf86KbdBrightnessUp",   hl.dsp.exec_cmd(scriptsDir .. "/BrightnessKbd.sh --inc"), { repeating = true })
hl.bind("xf86Launch1", hl.dsp.exec_cmd("rog-control-center"))  -- ASUS Armory crate button
hl.bind("xf86Launch3", hl.dsp.exec_cmd("asusctl led-mode -n")) -- FN+F4 keyboard RGB profile
hl.bind("xf86Launch4", hl.dsp.exec_cmd("asusctl profile -n"))  -- FN+F5 fan profiles
hl.bind("xf86MonBrightnessDown", hl.dsp.exec_cmd(scriptsDir .. "/Brightness.sh --dec"), { repeating = true })
hl.bind("xf86MonBrightnessUp",   hl.dsp.exec_cmd(scriptsDir .. "/Brightness.sh --inc"), { repeating = true })
hl.bind("xf86TouchpadToggle", hl.dsp.exec_cmd(scriptsDir .. "/TouchPad.sh"))

-- Screenshot keybindings using F6 (no PrinSrc button)
hl.bind(mainMod .. " + F6",         hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --now"))
hl.bind(mainMod .. " + SHIFT + F6", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --area"))
hl.bind(mainMod .. " + CTRL + F6",  hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --in5"))
hl.bind(mainMod .. " + ALT + F6",   hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --in10"))
hl.bind("ALT + F6",                 hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --active"))

-- ═══════════════ Transiciones de wallpaper (transiciones-sww.txt) ═══════════════
hl.bind(mainMod .. " + ALT + 1", hl.dsp.exec_cmd("swww img /home/djxs4n/Imágenes/wallpapers/Anime-Girl-Rain.png --transition-type outer --transition-fps 60 --transition-step 45"))
hl.bind(mainMod .. " + ALT + 2", hl.dsp.exec_cmd("swww img /home/djxs4n/Imágenes/wallpapers/Anime-Girl-Rain.png --transition-type wave --transition-fps 60 --transition-step 60 --transition-angle 45"))
hl.bind(mainMod .. " + ALT + 3", hl.dsp.exec_cmd("swww img /home/djxs4n/Imágenes/wallpapers/Anime-Girl-Rain.png --transition-type grow --transition-fps 60 --transition-step 50 --transition-pos top-right"))
hl.bind(mainMod .. " + ALT + 4", hl.dsp.exec_cmd("swww img /home/djxs4n/Imágenes/wallpapers/Anime-Girl-Rain.png --transition-type random --transition-fps 60 --transition-step 50"))

-- ═══════════════ Scriptsitos (nuevos binds acordados) ═══════════════
-- rofi-help: SUPER+SHIFT+H (SUPER+D se queda como app launcher;
--  el Dropterminal ya está en el Bloque 1, SUPER+SHIFT+Return)
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.exec_cmd(UserScripts .. "/rofi-help-sh"), { description = "hardware shortcuts" })
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.exec_cmd(UserScripts .. "/toogle-performance.sh"), { description = "toggle performance profile" })




