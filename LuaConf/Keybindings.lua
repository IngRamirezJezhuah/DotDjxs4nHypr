-- =====================================
--            DJXS4N DOTS
--  ATAJOS DE TECLADOS PARA HYPRLAND
--            VERSION LUA
-- =====================================

local mainMod = "SUPER"
local scriptsDir = os.getenv("HOME") .. "/.config/hypr/scripts"
local UserScripts = os.getenv("HOME") .. "/.config/hypr/UserScripts"

-- Nota : las variables de aplicacinoes por defecto ($term, $file)
-- se toma las varibales de etorno del sistema
local term = os.getenv("TERM") or "kitty"
local files = os.getenv("FILES") or "thunar"

-- ====================================
--            ESTANDAR
--    LANAZDORES Y APPS COMUNES 
-- ====================================

hl.bind(mainMod .. "+ D", hl.dsp.exec_cmd("pkill rofi || true && rofi -show drun -,di drun, filebrowser, run, wnidow"), { description = "Lanzador de aplicaciones" })
hl.bind(mainMod .. "+ B", hl.dsp.exec_cmd("xdg-open 'https://'"), { description = "abre navegador por defecto" })
hl.bind(mainMod .. "+ A", hl.dsp.exec_cmd(scripsDir .. "OverviewToggle.sh"), { description = "vista al escritotio" })
hl.bind(mainMod .. "+ Return", hl.dsp.exec_cmd(termn), { description = "Abre la terminal" })
hl.bind(mainMod .. "+ E", hl.dsp.exec_cmd(files), { description = "Administrador de archivos" })

-- ===================================
--    EXTRAS / CARACTERISTICAS
-- ===================================
hl.bind(mainMod .. "+ T", hl.dsp.exec_cmd(scripDir .. "/ThemeChanger.sh"), {  description = "Administrador de temas globales Wallust" } )
hl.bind(mainMod .. "+ H", hl.dsp.exec_cmd(scripDir .. "/KeyHints.sh"), { description = "ayuda / hoja de ayuda" } )
hl.bind(mainMod .. "+ ALT + R", hl.dsp.exec_cmd(scripDir .. "/Refresh.sh"), { description = "refrescar barra y menus" } )
hl.bind(mainMod .. "+ ALT + E", hl.dsp.exec_cmd(scripDir .. "RofiEmoji.sh"), { description = "emoji menu" })


hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("steam && notify-send -e -h string:x-canonical-private-synchronous:seam 'Steam' 'ejecutandose...'"), { description = "steam search" })

hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("code"), { description = "abre vs" })
hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd("rofi -show window"), { description = "window switcher" })
hl.bind(mainMod .. " + ALT + O", hl.dsp.exec_cmd(scriptsDir .. "/ChangeBlur.sh"), { description = "toggle blur" })
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd(scriptsDir .. "/GameMode.sh"), { description = "toggle game mode" })
hl.bind(mainMod .. " + ALT + L", hl.dsp.exec_cmd(scriptsDir .. "/ChangeLayout.sh"), { description = "toggle master/dwindle layout" })
hl.bind(mainMod .. " + ALT + V", hl.dsp.exec_cmd(scriptsDir .. "/ClipManager.sh"), { description = "clipboard manager" })
hl.bind(mainMod .. " + CTRL + R", hl.dsp.exec_cmd(scriptsDir .. "/RofiThemeSelector.sh"), { description = "rofi theme selector" })
hl.bind(mainMod .. " + CTRL + SHIFT + R", hl.dsp.exec_cmd("pkill rofi || true && " .. scriptsDir .. "/RofiThemeSelector-modified.sh"), { description = "rofi theme selector (modified)" })

-- Gestiones de Ventana Directas
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.fullscreen(), { description = "fullscreen" })
hl.bind(mainMod .. " + CTRL + F", hl.dsp.fullscreen(1), { description = "maximize window" })
hl.bind(mainMod .. " + SPACE", hl.dsp.togglefloating(), { description = "Float current window" })
hl.bind(mainMod .. " + ALT + SPACE", hl.dsp.exec_cmd("hyprctl dispatch workspaceopt allfloat"), { description = "Float all windows" })
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd(scriptsDir .. "/Dropterminal.sh " .. term), { description = "DropDown terminal" })

-- Magnificador de Pantalla / Zoom
hl.bind(mainMod .. " + ALT + mouse_down", hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor \"$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor * 2.0}')\""), { description = "zoom in" })
hl.bind(mainMod .. " + ALT + mouse_up", hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor \"$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor / 2.0}')\""), { description = "zoom out" })

-- Barra de Estado (Waybar)
hl.bind(mainMod .. " + CTRL + ALT + B", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"), { description = "toggle waybar on/off" })
hl.bind(mainMod .. " + CTRL + B", hl.dsp.exec_cmd(scriptsDir .. "/WaybarStyles.sh"), { description = "waybar styles menu" })
hl.bind(mainMod .. " + ALT + B", hl.dsp.exec_cmd(scriptsDir .. "/WaybarLayout.sh"), { description = "waybar layout menu" })

-- Luz Nocturna (Hyprsunset)
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(scriptsDir .. "/Hyprsunset.sh toggle"), { description = "toggle night light" })

-- UserScripts & Extras
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd(UserScripts .. "/RofiBeats.sh"), { description = "online music" })
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(UserScripts .. "/WallpaperSelect.sh"), { description = "select wallpaper" })
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(UserScripts .. "/WallpaperEffects.sh"), { description = "wallpaper effects" })
hl.bind("CTRL + ALT + W", hl.dsp.exec_cmd(UserScripts .. "/WallpaperRandom.sh"), { description = "random wallpaper" })
hl.bind(mainMod .. " + CTRL + O", hl.dsp.exec_cmd("hyprctl dispatch setprop active opaque toggle"), { description = "toggle active window opacity" })
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.exec_cmd(scriptsDir .. "/KeyBinds.sh"), { description = "search keybinds" })
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd(scriptsDir .. "/Animations.sh"), { description = "animations menu" })
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.exec_cmd(UserScripts .. "/ZshChangeTheme.sh"), { description = "change oh-my-zsh theme" })

-- Binds con flags especials (locked / non-consuming)
hl.bind("ALT_L + SHIFT_L", hl.dsp.exec_cmd(scriptsDir .. "/KeyboardLayout.sh switch"), { flags = { "l", "n" }, description = "switch keyboard layout globally" })
hl.bind("SHIFT_L + ALT_L", hl.dsp.exec_cmd(scriptsDir .. "/Tak0-Per-Window-Switch.sh"), { flags = { "l", "n" }, description = "switch keyboard layout per-window" })
hl.bind(mainMod .. " + ALT + C", hl.dsp.exec_cmd(UserScripts .. "/RofiCalc.sh"), { description = "calculator" })

-- Mover workspaces entre monitores
hl.bind(mainMod .. " + CTRL + F9", hl.dsp.movecurrentworkspacetomonitor("l"), { description = "move workspace to left monitor" })
hl.bind(mainMod .. " + CTRL + F10", hl.dsp.movecurrentworkspacetomonitor("r"), { description = "move workspace to right monitor" })
hl.bind(mainMod .. " + CTRL + F11", hl.dsp.movecurrentworkspacetomonitor("u"), { description = "move workspace to up monitor" })
hl.bind(mainMod .. " + CTRL + F12", hl.dsp.movecurrentworkspacetomonitor("d"), { description = "move workspace to down monitor" })

-- ====================
--       SISTEMA
-- ====================
hl.bind("CTRL + ALT + Delete", hl.dsp.exec_cmd("hyprctl dispatch exit 0"), { description = "exit Hyprland" })
hl.bind(mainMod .. " + Q", hl.dsp.killactive(), { description = "close active window" })
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd(scriptsDir .. "/KillActiveProcess.sh"), { description = "Terminate active process" })
hl.bind("CTRL + ALT + L", hl.dsp.exec_cmd(scriptsDir .. "/LockScreen.sh"), { description = "lock screen" })
hl.bind("CTRL + ALT + P", hl.dsp.exec_cmd(scriptsDir .. "/Wlogout.sh"), { description = "powermenu" })
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("swaync-client -t -sw"), { description = "notification panel" })
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(scriptsDir .. "/Kool_Quick_Settings.sh"), { description = "Quick settings menu" })

-- Master & Dwindle Layouts
hl.bind(mainMod .. " + CTRL + D", hl.dsp.layout("removemaster"), { description = "remove master" })
hl.bind(mainMod .. " + I", hl.dsp.layout("addmaster"), { description = "add master" })
hl.bind(mainMod .. " + CTRL + Return", hl.dsp.layout("swapwithmaster"), { description = "swap with master" })
hl.bind(mainMod .. " + P", hl.dsp.pseudo(), { description = "toggle pseudo (dwindle)" })
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("hyprctl dispatch splitratio 0.3"), { description = "set split ratio 0.3" })

-- Inicialización de Layout
hl.on("hyprland.start", function()
  hl.dsp.exec_cmd(scriptsDir .. "/ChangeLayout.sh init")
end)

-- Ciclado de Ventanas
hl.bind("ALT + Tab", hl.dsp.cyclenext(), { description = "cycle next window" })
hl.bind("ALT + Tab", hl.dsp.exec_cmd("hyprctl dispatch bringactivetotop"), { description = "bring active to top" })

-- ====================
--  TECLAS MULTIMEDIA / SPECIAL KEYS
-- ====================
hl.bind(" + xf86audioraisevolume", hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --inc"), { flags = { "e", "l" }, description = "volume up" })
hl.bind(" + xf86audiolowervolume", hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --dec"), { flags = { "e", "l" }, description = "volume down" })
hl.bind("ALT + xf86audioraisevolume", hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --inc-precise"), { flags = { "e", "l" }, description = "volume up precise" })
hl.bind("ALT + xf86audiolowervolume", hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --dec-precise"), { flags = { "e", "l" }, description = "volume down precise" })

hl.bind(" + xf86AudioMicMute", hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --toggle-mic"), { flags = { "l" }, description = "toggle mic mute" })
hl.bind(" + xf86audiomute", hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --toggle"), { flags = { "l" }, description = "toggle mute" })
hl.bind(" + xf86Sleep", hl.dsp.exec_cmd("systemctl suspend"), { flags = { "l" }, description = "sleep" })
hl.bind(" + xf86Rfkill", hl.dsp.exec_cmd(scriptsDir .. "/AirplaneMode.sh"), { flags = { "l" }, description = "airplane mode" })

-- Controles Multimedia
hl.bind(" + xf86AudioPlayPause", hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --pause"), { flags = { "l" }, description = "play/pause" })
hl.bind(" + xf86AudioPause", hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --pause"), { flags = { "l" }, description = "pause" })
hl.bind(" + xf86AudioPlay", hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --pause"), { flags = { "l" }, description = "play" })
hl.bind(" + xf86AudioNext", hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --nxt"), { flags = { "l" }, description = "next track" })
hl.bind(" + xf86AudioPrev", hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --prv"), { flags = { "l" }, description = "previous track" })
hl.bind(" + xf86audiostop", hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --stop"), { flags = { "l" }, description = "stop" })

-- Capturas de Pantalla
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --now"), { description = "screenshot now" })
hl.bind(mainMod .. " + SHIFT + Print", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --area"), { description = "screenshot (area)" })
hl.bind(mainMod .. " + CTRL + Print", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --in5"), { description = "screenshot in 5s" })
hl.bind(mainMod .. " + CTRL + SHIFT + Print", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --in10"), { description = "screenshot in 10s" })
hl.bind("ALT + Print", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --active"), { description = "screenshot active window" })
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --swappy"), { description = "screenshot (swappy)" })

-- Redimensionar Ventanas (Flag 'e' para repetir al presionar prolongadamente)
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.exec_cmd("hyprctl dispatch resizeactive -50 0"), { flags = { "e" }, description = "resize left (-50)" })
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 50 0"), { flags = { "e" }, description = "resize right (+50)" })
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -50"), { flags = { "e" }, description = "resize up (-50)" })
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 50"), { flags = { "e" }, description = "resize down (+50)" })

-- Mover y Intercambiar Ventanas
hl.bind(mainMod .. " + CTRL + left", hl.dsp.movewindow("l"), { description = "move window left" })
hl.bind(mainMod .. " + CTRL + right", hl.dsp.movewindow("r"), { description = "move window right" })
hl.bind(mainMod .. " + CTRL + up", hl.dsp.movewindow("u"), { description = "move window up" })
hl.bind(mainMod .. " + CTRL + down", hl.dsp.movewindow("d"), { description = "move window down" })

hl.bind(mainMod .. " + ALT + left", hl.dsp.exec_cmd("hyprctl dispatch swapwindow l"), { description = "swap window left" })
hl.bind(mainMod .. " + ALT + right", hl.dsp.exec_cmd("hyprctl dispatch swapwindow r"), { description = "swap window right" })
hl.bind(mainMod .. " + ALT + up", hl.dsp.exec_cmd("hyprctl dispatch swapwindow u"), { description = "swap window up" })
hl.bind(mainMod .. " + ALT + down", hl.dsp.exec_cmd("hyprctl dispatch swapwindow d"), { description = "swap window down" })

-- GRUPOS (Group Management)
hl.bind(mainMod .. " + G", hl.dsp.togglegroup(), { description = "toggle group" })
hl.bind(mainMod .. " + Tab", hl.dsp.exec_cmd("hyprctl dispatch changegroupactive f"), { description = "Change Group Forward" })
hl.bind(mainMod .. " + CTRL + Tab", hl.dsp.exec_cmd("hyprctl dispatch changegroupactive"), { description = "change active in group" })
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.exec_cmd("hyprctl dispatch changegroupactive b"), { description = "Change Group Back" })

hl.bind(mainMod .. " + CTRL + K", hl.dsp.exec_cmd("hyprctl dispatch moveintogroup l"), { description = "Move left into group" })
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd("hyprctl dispatch moveintogroup r"), { description = "Move Right into group" })
hl.bind(mainMod .. " + CTRL + H", hl.dsp.exec_cmd("hyprctl dispatch moveoutofgroup"), { description = "Move active out of group" })

-- Enfoque con Teclas de Dirección
hl.bind(mainMod .. " + left", hl.dsp.movefocus("l"), { description = "focus left" })
hl.bind(mainMod .. " + right", hl.dsp.movefocus("r"), { description = "focus right" })
hl.bind(mainMod .. " + up", hl.dsp.movefocus("u"), { description = "focus up" })
hl.bind(mainMod .. " + down", hl.dsp.movefocus("d"), { description = "focus down" })

-- Navegación de Workspaces
hl.bind(mainMod .. " + tab", hl.dsp.workspace("m+1"), { description = "next workspace" })
hl.bind(mainMod .. " + SHIFT + tab", hl.dsp.workspace("m-1"), { description = "previous workspace" })

-- Special Workspace
hl.bind(mainMod .. " + SHIFT + U", hl.dsp.movetoworkspace("special"), { description = "move to special workspace" })
hl.bind(mainMod .. " + U", hl.dsp.togglespecialworkspace(), { description = "toggle special workspace" })

-- ====================
-- WORKSPACES POR TECLAS NÚMERICAS (Keycodes 10 - 19)
-- ====================
local workspace_keys = {
  { key = "code:10", num = "1" },
  { key = "code:11", num = "2" },
  { key = "code:12", num = "3" },
  { key = "code:13", num = "4" },
  { key = "code:14", num = "5" },
  { key = "code:15", num = "6" },
  { key = "code:16", num = "7" },
  { key = "code:17", num = "8" },
  { key = "code:18", num = "9" },
  { key = "code:19", num = "10" },
}

for _, w in ipairs(workspace_keys) do
  -- Ir a workspace
  hl.bind(mainMod .. " + " .. w.key, hl.dsp.workspace(w.num), { description = "workspace " .. w.num })
  -- Mover ventana activa y seguir a workspace
  hl.bind(mainMod .. " + SHIFT + " .. w.key, hl.dsp.movetoworkspace(w.num), { description = "move to workspace " .. w.num })
  -- Mover ventana activa en silencio a workspace
  hl.bind(mainMod .. " + CTRL + " .. w.key, hl.dsp.movetoworkspacesilent(w.num), { description = "move silently to workspace " .. w.num })
end

-- Desplazamiento con corchetes [ y ]
hl.bind(mainMod .. " + SHIFT + bracketleft", hl.dsp.movetoworkspace("-1"), { description = "move to previous workspace" })
hl.bind(mainMod .. " + SHIFT + bracketright", hl.dsp.movetoworkspace("+1"), { description = "move to next workspace" })
hl.bind(mainMod .. " + CTRL + bracketleft", hl.dsp.movetoworkspacesilent("-1"), { description = "move silently to previous workspace" })
hl.bind(mainMod .. " + CTRL + bracketright", hl.dsp.movetoworkspacesilent("+1"), { description = "move silently to next workspace" })

-- Navegación con Mouse y Teclas Relativas
hl.bind(mainMod .. " + mouse_down", hl.dsp.workspace("e+1"), { description = "next workspace" })
hl.bind(mainMod .. " + mouse_up", hl.dsp.workspace("e-1"), { description = "previous workspace" })
hl.bind(mainMod .. " + period", hl.dsp.workspace("e+1"), { description = "next workspace" })
hl.bind(mainMod .. " + comma", hl.dsp.workspace("e-1"), { description = "previous workspace" })

-- Acciones de Arrastre con el Ratón (Move/Resize)
hl.bind(mainMod, "mouse:272", hl.dsp.movewindow(), { flags = { "m" }, description = "move window" })
hl.bind(mainMod, "mouse:273", hl.dsp.resizewindow(), { flags = { "m" }, description = "resize window" })
