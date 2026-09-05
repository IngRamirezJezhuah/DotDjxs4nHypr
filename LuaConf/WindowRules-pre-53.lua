-- ====================================================
--                DJXS4N DOTILES
--          MIGRACION DE ARCHIVOS A LUA
--              WINDWORULES-PRE-53
-- ====================================================

-- REGLAS DE Opacidad General
-- navegadores web
hl.window_rule ({
  rule = "tag + browser",
  match = { class = "^([Ff]irefox|org.mozilla.firefoc|[Ff]irefox-esr|[Ff]irefox-bin)$"}
})

hl.window_rule ({
  rule = "tag +browser",
  match = {  class = "^([Gg]oogle-chrome(-beta|dev|-unstable)?)$" },
})

hl.window_rule ({
  rule = "tag +browser",
  match = {  class = "^(Cc)hromium$"},
})

hl.window_rule ({
  rule = "tag +browser",
  match = {  class = "^(Mm)icrosoft-edge(-stavle|-beta|-dev|-unstable)$" },
})

hl.window_rule ({
  rule = "tag +browser",
  match = {  class = "^(BraveBrowser(-beta|-dev|-unstable))$" },
})

hl.window_rule ({
  rule = "tag +browser",
  match = {  class = "^([Tt]horium-browser|[Cc]achy-browser)$" },
})

hl.window_rule ({
  rule = "tag +browser",
  match = {  class = "^(Zen.alpha|zen)$" },
})

--NOTICICACIONES

hl.window_rule ({
    rule = "tag +KooLSetting",
  match = {  class = "^(swaync-control-center|swaync-notificacion-window|swaync-client|class)$" },
})

hl.window_rule ({
  rule = "tag +browser",
  match = {  class = "^(Kool Hyprland Setings)$" },
})

hl.window_rule ({
  rule = "tag +browser",
  match = {  class = "^(nwg-displays|ngws-look)$" },
})


-- Clientes de correo
hl.window_rule ({
  rule = "tag +email",
  match = {  class = "^(Alacrity|kitty|kitty-dropterm)$" },
})

-- Terminal
hl.window_rule ({
  rule = "tag +terminal",
  match = {  class = "^(Alacritty|kitty|kitty-dropterm)$" },
})

hl.window_rule ({
  rule = "tag +email",
  match = {  class = "^([Tt]hunderbid|ord.mozilla.Thunderbird)$" },
})

hl.window_rule({
  rule = "tag +email",
  match = { class = "^(eu.betterbird.Betterbird)$" },
})
hl.window_rule({
  rule = "tag +email",
  match = { class = "^(org.gnome.Evolution)$" },
})

-- IDEs y Proyectos
hl.window_rule({
  rule = "tag +projects",
  match = { class = "^(codium|codium-url-handler|VSCodium)$" },
})
hl.window_rule({
  rule = "tag +projects",
  match = { class = "^(VSCode|code|code-url-handler)$" },
})
hl.window_rule({
  rule = "tag +projects",
  match = { class = "^(jetbrains-.+)$" },
})
hl.window_rule({
  rule = "tag +projects",
  match = { class = "^(dev.zed.Zed|antigravity)$" },
})

-- Transmisión de Pantalla
hl.window_rule({
  rule = "tag +screenshare",
  match = { class = "^(com.obsproject.Studio)$" },
})

-- Mensajería Instantánea (IM)
hl.window_rule({
  rule = "tag +im",
  match = { class = "^([Dd]iscord|[Ww]ebCord|[Vv]esktop)$" },
})
hl.window_rule({
  rule = "tag +im",
  match = { class = "^([Ff]erdium)$" },
})
hl.window_rule({
  rule = "tag +im",
  match = { class = "^([Ww]hatsapp-for-linux)$" },
})
hl.window_rule({
  rule = "tag +im",
  match = { class = "^(ZapZap|com.rtosta.zapzap)$" },
})
hl.window_rule({
  rule = "tag +im",
  match = { class = "^(org.telegram.desktop|io.github.tdesktop_x64.TDesktop)$" },
})
hl.window_rule({
  rule = "tag +im",
  match = { class = "^(teams-for-linux)$" },
})
hl.window_rule({
  rule = "tag +im",
  match = { class = "^(im.riot.Riot|Element)$" },
})

-- Juegos y Tiendas
hl.window_rule({
  rule = "tag +games",
  match = { class = "^(gamescope)$" },
})
hl.window_rule({
  rule = "tag +games",
  match = { class = "^(steam_app_\\d+)$" },
})
hl.window_rule({
  rule = "tag +gamestore",
  match = { class = "^([Ss]team)$" },
})
hl.window_rule({
  rule = "tag +gamestore",
  match = { title = "^([Ll]utris)$" },
})
hl.window_rule({
  rule = "tag +gamestore",
  match = { class = "^(com.heroicgameslauncher.hgl)$" },
})

-- Gestores de Archivos
hl.window_rule({
  rule = "tag +file-manager",
  match = { class = "^([Tt]hunar|org.gnome.Nautilus|[Pp]cmanfm-qt)$" },
})
hl.window_rule({
  rule = "tag +file-manager",
  match = { class = "^(app.drey.Warp)$" },
})

-- Fondos de Pantalla y Multimedia
hl.window_rule({
  rule = "tag +wallpaper",
  match = { class = "^([Ww]aytrogen)$" },
})
hl.window_rule({
  rule = "tag +multimedia",
  match = { class = "^([Aa]udacious)$" },
})
hl.window_rule({
  rule = "tag +multimedia_video",
  match = { class = "^([Mm]pv|vlc)$" },
})

-- Ajustes y Configuración del Sistema
hl.window_rule({
  rule = "tag +settings",
  match = { title = "^(ROG Control)$" },
})
hl.window_rule({
  rule = "tag +settings",
  match = { class = "^(wihotspot(-gui)?)$" },
})
hl.window_rule({
  rule = "tag +settings",
  match = { class = "^([Bb]aobab|org.gnome.[Bb]aobab)$" },
})
hl.window_rule({
  rule = "tag +settings",
  match = { class = "^(gnome-disks)$" },
})
hl.window_rule({
  rule = "tag +settings",
  match = { title = "(Kvantum Manager)" },
})
hl.window_rule({
  rule = "tag +settings",
  match = { class = "^(file-roller|org.gnome.FileRoller)$" },
})
hl.window_rule({
  rule = "tag +settings",
  match = { class = "^(nm-applet|nm-connection-editor|blueman-manager)$" },
})
hl.window_rule({
  rule = "tag +settings",
  match = { class = "^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$" },
})
hl.window_rule({
  rule = "tag +settings",
  match = { class = "^(qt5ct|qt6ct|[Yy]ad)$" },
})
hl.window_rule({
  rule = "tag +settings",
  match = { class = "(xdg-desktop-portal-gtk)" },
})
hl.window_rule({
  rule = "tag +settings",
  match = { class = "^(org.kde.polkit-kde-authentication-agent-1)$" },
})
hl.window_rule({
  rule = "tag +settings",
  match = { class = "^([Rr]ofi)$" },
})
hl.window_rule({
  rule = "tag +settings",
  match = { class = "^(btrfs-assistant)$" },
})
hl.window_rule({
  rule = "tag +settings",
  match = { class = "^(timeshift-gtk)$" },
})

-- Visualizadores y Monitores
hl.window_rule({
  rule = "tag +viewer",
  match = { class = "^(gnome-system-monitor|org.gnome.SystemMonitor|io.missioncenter.MissionCenter)$" },
})
hl.window_rule({
  rule = "tag +viewer",
  match = { class = "^(evince)$" },
})
hl.window_rule({
  rule = "tag +viewer",
  match = { class = "^(eog|org.gnome.Loupe)$" },
})


-- -------------------------------------------------------------------------
-- 2. EXCEPCIONES Y OVERRIDES
-- -------------------------------------------------------------------------
hl.window_rule({
  rule = { no_blur = true, opacity = { 1.0, 1.0 } },
  match = { tag = "multimedia_video" },
})
hl.window_rule({
  rule = { no_blur = true, opacity = { 1.0, 1.0 } },
  match = { tag = "multimedia" },
})
hl.window_rule({
  rule = { no_blur = true, fullscreen = 0 },
  match = { tag = "games" },
})


-- -------------------------------------------------------------------------
-- 3. INHIBICIÓN DE INACTIVIDAD Y ENFOQUE
-- -------------------------------------------------------------------------
hl.window_rule({
  rule = "idleinhibit fullscreen",
  match = { fullscreen = true },
})
hl.window_rule({
  rule = "noinitialfocus",
  match = { class = "^(jetbrains-.*)" },
})
hl.window_rule({
  rule = "noinitialfocus",
  match = { title = "^(wind.*)$" },
})


-- -------------------------------------------------------------------------
-- 4. VENTANAS FLOTANTES, TAMAÑOS Y POSICIONAMIENTO
-- -------------------------------------------------------------------------
-- Ventanas Flotantes Generales
hl.window_rule({
  rule = "float",
  match = { tag = "KooL_Cheat" },
})
hl.window_rule({
  rule = "float",
  match = { tag = "wallpaper" },
})
hl.window_rule({
  rule = "float",
  match = { tag = "settings" },
})
hl.window_rule({
  rule = "float",
  match = { tag = "viewer" },
})
hl.window_rule({
  rule = "float",
  match = { tag = "KooL-Settings" },
})

hl.window_rule({
  rule = "float",
  match = { class = "([Zz]oom|onedriver|onedriver-launcher)" },
})
hl.window_rule({
  rule = "float",
  match = { class = "^(mpv|com.github.rafostar.Clapper)$" },
})
hl.window_rule({
  rule = "float",
  match = { class = "^([Qq]alculate-gtk)$" },
})
hl.window_rule({
  rule = "float",
  match = { class = "^([Ff]erdium)$" },
})

-- Centrado de Ventanas
hl.window_rule({
  rule = "center",
  match = { tag = "KooL_Cheat" },
})
hl.window_rule({
  rule = "center",
  match = { tag = "KooL-Settings" },
})
hl.window_rule({
  rule = "center",
  match = { title = "^(ROG Control)$" },
})
hl.window_rule({
  rule = "center",
  match = { title = "^(Keybindings)$" },
})
hl.window_rule({
  rule = "center",
  match = { class = "^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$" },
})
hl.window_rule({
  rule = "center",
  match = { class = "^([Ff]erdium)$" },
})
hl.window_rule({
  rule = "center",
  match = { class = "^([Ww]hatsapp-for-linux|ZapZap|com.rtosta.zapzap)$" },
})

-- Diálogos y Popups Específicos
hl.window_rule({
  rule = { float = true, center = true },
  match = { title = "^(Authentication Required)$" },
})
hl.window_rule({
  rule = "float",
  match = { class = "(codium|codium-url-handler|VSCodium)", title = "negative:(.*codium.*|.*VSCodium.*)" },
})
hl.window_rule({
  rule = "float",
  match = { class = "^(com.heroicgameslauncher.hgl)$", title = "negative:(Heroic Games Launcher)" },
})
hl.window_rule({
  rule = "float",
  match = { class = "^([Ss]team)$", title = "negative:^([Ss]team)$" },
})
hl.window_rule({
  rule = "float",
  match = { class = "([Tt]hunar)", title = "negative:(.*[Tt]hunar.*)" },
})

-- Dimensiones Dinámicas y Posición
hl.window_rule({
  rule = { float = true, center = true, size = { "70%", "60%" } },
  match = { title = "^(Add Folder to Workspace)$" },
})
hl.window_rule({
  rule = { float = true, center = true, size = { "70%", "60%" } },
  match = { title = "^(Save As)$" },
})
hl.window_rule({
  rule = { float = true, size = { "70%", "60%" } },
  match = { initial_title = "(Open Files)" },
})
hl.window_rule({
  rule = { float = true, center = true, size = { "16%", "12%" } },
  match = { title = "^(SDDM Background)$" },
})
hl.window_rule({
  rule = { float = true, center = true, size = { "20%", "20%" } },
  match = { class = "^(yad)$", title = "^(YAD)$" },
})
hl.window_rule({
  rule = { float = true, center = true },
  match = { class = "^(hyprland-donate-screen)$" },
})

-- Talles por Defecto para Etiquetas
hl.window_rule({
  rule = { size = { "65%", "90%" } },
  match = { tag = "KooL_Cheat" },
})
hl.window_rule({
  rule = { size = { "70%", "70%" } },
  match = { tag = "wallpaper" },
})
hl.window_rule({
  rule = { size = { "70%", "70%" } },
  match = { tag = "settings" },
})
hl.window_rule({
  rule = { size = { "60%", "70%" } },
  match = { class = "^([Ff]erdium)$" },
})
hl.window_rule({
  rule = { float = true, center = true, size = { "25%", "30%" } },
  match = { class = "(org.gnome.Calculator|qalculate-gtk)" },
})


-- -------------------------------------------------------------------------
-- 5. OPACIDADES POR CATERGORÍA
-- -------------------------------------------------------------------------
hl.window_rule({
  rule = { opacity = { 0.99, 0.80 } },
  match = { tag = "browser" },
})
hl.window_rule({
  rule = { opacity = { 0.90, 0.80 } },
  match = { tag = "projects" },
})
hl.window_rule({
  rule = { opacity = { 0.94, 0.86 } },
  match = { tag = "im" },
})
hl.window_rule({
  rule = { opacity = { 0.94, 0.86 } },
  match = { tag = "multimedia" },
})
hl.window_rule({
  rule = { opacity = { 0.90, 0.80 } },
  match = { tag = "file-manager" },
})
hl.window_rule({
  rule = { opacity = { 0.90, 0.70 } },
  match = { tag = "terminal" },
})
hl.window_rule({
  rule = { opacity = { 0.80, 0.70 } },
  match = { tag = "settings" },
})
hl.window_rule({
  rule = { opacity = { 0.82, 0.75 } },
  match = { tag = "viewer" },
})
hl.window_rule({
  rule = { opacity = { 0.90, 0.70 } },
  match = { tag = "wallpaper" },
})

-- Opacidades por Aplicación
hl.window_rule({
  rule = { opacity = { 0.80, 0.70 } },
  match = { class = "^(gedit|org.gnome.TextEditor|mousepad)$" },
})
hl.window_rule({
  rule = { opacity = { 0.90, 0.80 } },
  match = { class = "^(deluge)$" },
})
hl.window_rule({
  rule = { opacity = { 0.90, 0.80 } },
  match = { class = "^(seahorse)$" },
})


-- -------------------------------------------------------------------------
-- 6. REGLAS NOMBRADAS Y CASOS ESPECIALES
-- -------------------------------------------------------------------------
-- WhatsApp y ZapZap
hl.window_rule({
  name = "Whatsapp-zapzap",
  rule = {
    size = { "60%", "70%" },
    center = true,
  },
  match = { class = "^([Ww]hatsapp-for-linux|ZapZap|com.rtosta.zapzap)$" },
})

-- Picture in Picture (PiP)
hl.window_rule({
  name = "Picture-in-Picture",
  rule = {
    float = true,
    move = { "72%", "7%" },
    opacity = { 0.95, 0.75 },
    pin = true,
    keep_aspect_ratio = true,
    size = { "30%", "30%" },
  },
  match = { title = "^(Picture-in-Picture)$" },
})

-- Diálogo de Progreso de Copia en Thunar
hl.window_rule({
  name = "Thunar-Progress-bar",
  rule = {
    float = true,
    center = true,
    size = { "26%", "18%" },
  },
  match = {
    class = "^(thunar)$",
    title = "^(File Operation Progress)$",
  },
})


-- -------------------------------------------------------------------------
-- 7. LAYER RULES (EFECTOS EN CAPAS COMO ROFI, NOTIFICACIONES Y OVERVIEW)
-- -------------------------------------------------------------------------
hl.layerrule({
  rule = { blur = true, ignorezero = true },
  match = { namespace = "rofi" },
})

hl.layerrule({
  rule = { blur = true, ignorezero = true },
  match = { namespace = "notifications" },
})

hl.layerrule({
  rule = { blur = true, ignorezero = true, ignore_alpha = 0.5 },
  match = { namespace = "quickshell:overview" },
})
