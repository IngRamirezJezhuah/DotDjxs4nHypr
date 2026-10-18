-- ================================================
--                ᯓᡣ𐭩Djxs4n.ᐟ⊹
--              DJXS4N DOTFILES
--          HYPRLAND 0.56 - CONF LUA
--            Env / Variables de entorno
--    Fuente: configs/ENVariables.conf + user
-- ================================================

hl.env("DOTS_VERSION", "2.3.20")

-- =======================
--  HERRAMIENTAS BACKEND
-- =======================

hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("CLUTTER_BACKEND", "wayland")

-- ================
--      XDG
-- ================

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")

-- ================
--     QT Y QML
-- ================

hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_QUICK_CONTROLS_STYLE", "org.hyprland.style")

-- ==========================
-- ESCALA/SCALE FIX XWAYLAND 
-- ==========================

hl.env("GDK_SCALE", "1")
hl.env("QT_SCALE_FACTOR", "1")

-- =================
--     CURSORES
-- =================

hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "MikuCat")
hl.env("XCURSOR_SIZE", "24")

-- ======================
--    APPS CON WAYLAND
-- ======================

hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- =====================
--   NVIDIA DRIVES ETC
-- =====================

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
hl.env("GSK_RENDERER", "ngl")



