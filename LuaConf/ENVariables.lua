-- ========================================
--            DJXS4N DOTFILES
--          VARIABLES DE ENTORNO
--  ~/.config/hypr/LuaConf/ENVariables.lua
-- ========================================

hl.env("DOTS_VERSION", "2.3.20")

-- VARIABLES DE BACKEND
hl.env("GDK_BACKEND", "wayland,x11")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("CLUTTER_BACKEND", "wayland")

-- ESPECIFICACIONES DE XDG
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")

-- VARIABLES DE QT
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATAFORMTHEME", "qt5ct")
hl.env("QT_QPA_PLATAFORMTHEME", "qt6ct")

-- SOPORTE QT EN HYPRLAND
hl.env("QT_QUICK_CONTROL_STYLE", "org.hyprkand.style")

-- ESCALADO DE APLICACOINES EN WAYLAND
hl.env("GDK_SCALE", "1")
hl.env("QT_SCALE_FACTOR", "1")

-- TEMA DEL CURSOR
hl.env("HYPRCURSOR_THEME", "MikuCat")
hl.env("HYPRCURSOR_SIZE", "24")

-- NAVEGADOR WEB
hl.env("MOZ_ENABLE_WAYLAND", "1")

-- ELECTRON 
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- NVIDIA DRIVERS
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
hl.env("GSK_RENDERER", "ngl")

-- Opciones NVIDIA opcionales desactivadas por defecto
-- hl.env("GBM_BACKEND", "nvidia-drm")
-- hl.env("__GL_GSYNC_ALLOWED", "1")
-- hl.env("__NV_PRIME_RENDER_OFFLOAD", "1")
-- hl.env("__VK_LAYER_NV_optimus", "NVIDIA_only")
-- hl.env("WLR_DRM_NO_ATOMIC", "1")
-- hl.env("MOZ_DISABLE_RDD_SANDBOX", "1")
-- hl.env("EGL_PLATFORM", "wayland")
