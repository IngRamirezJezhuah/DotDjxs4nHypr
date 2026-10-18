-- ================================================
--                ᯓᡣ𐭩Djxs4n.ᐟ⊹
--              DJXS4N DOTFILES
--          HYPRLAND 0.56 - CONF LUA
--              Settings / Sistema 
--            input y decoraciones
-- ================================================


local palette = require("Env.palette")

local home    = os.getenv("HOME")
local scripts = home .. "/.config/hypr/scripts"

-- ==========================================================
--  BLOQUE 1 — BASE VENDOR  (configs/SystemSettings.conf)
--  Se llama PRIMERO: el bloque 2 lo sobrescribe (orden
--  idéntico al "source" del hyprland.conf legacy).
-- ==========================================================

hl.config({
  -- pseudotile y smart_split venían comentados en el vendor
  dwindle = {
    preserve_split       = true,
    special_scale_factor = 0.8,
  },

  master = {
    new_status = "master",
    new_on_top = 1,
    mfact = 0.5,
  },

  general = {
    layout             = "dwindle",
    resize_on_border   = true,
  },

  input = {
    kb_layout                 = "latam",
    -- kb_variant/model/options/rules venían vacíos = sin definir
    repeat_rate               = 50,
    repeat_delay              = 300,
    sensitivity               = 0,
    numlock_by_default        = true,
    left_handed               = false,
    follow_mouse              = 1,
    float_switch_override_focus = false,

    touchpad = {
      disable_while_typing      = true,
      natural_scroll            = true,
      clickfinger_behavior      = false,
      middle_button_emulation   = false,
      tap_to_click              = true,   -- en el .conf era "tap-to-click"
      drag_lock                 = false,
    },

    touchdevice = {
      enabled = true,
    },

    tablet = {
      transform = 0,
      left_handed = 0,
    },
  },

  -- Los workspace_swipe_* SÍ son opciones de config (van aquí).
  -- Las declaraciones "gesture = ..." NO: van como hl.gesture() más abajo.
  gestures = {
    workspace_swipe_distance = 500,
    workspace_swipe_invert            = true,
    workspace_swipe_min_speed_to_force = 30,
    workspace_swipe_cancel_ratio      = 0.5,
    workspace_swipe_create_new        = true,
    workspace_swipe_forever           = true,
    -- workspace_swipe_use_r venía comentada en el vendor
  },

  misc = {
    disable_hyprland_logo        = true,
    disable_splash_rendering     = true,
    -- vfr venía comentado
    vrr = 2,
    mouse_move_enables_dpms      = true,
    enable_swallow               = false,  -- .conf: off (equivalente a 0)
    swallow_regex                = "^(kitty)$",
    focus_on_activate            = false,
    initial_workspace_tracking   = 0,
    middle_click_paste           = false,
    enable_anr_dialog            = true,
    anr_missed_pings             = 15,
    allow_session_lock_restore   = true,
    on_focus_under_fullscreen    = 1,
  },

  binds = {
    workspace_back_and_forth = true,
    allow_workspace_cycles   = true,
    pass_mouse_when_bound    = false,
  },

  xwayland = {
    enabled            = true,
    force_zero_scaling = true,
  },

  render = {
    direct_scanout = 0,
  },

  cursor = {
    sync_gsettings_theme    = true,
    no_hardware_cursors     = 1,
    enable_hyprcursor       = true,
    warp_on_change_workspace = 2,
    no_warps                = true,
  },
})

-- ==========================================================
--  GESTOS — API nueva: hl.gesture({ fingers, direction, action })
--  action acepta string ("workspace") o function.
-- ==========================================================

-- 3 dedos horizontal -> cambiar de workspace
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- 4 dedos arriba/abajo -> zoom del cursor (comando verbatim del vendor)
local zoomUp = [[hyprctl keyword cursor:zoom_factor "$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor * 1.5}')"]]
local zoomDown = [[hyprctl keyword cursor:zoom_factor "$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor / 1.5}')"]]

hl.gesture({
  fingers = 4,
  direction = "up",
  action    = function() hl.exec_cmd(zoomUp) end,
})

hl.gesture({
  fingers   = 4,
  direction = "down",
  action    = function() hl.exec_cmd(zoomDown) end,
})

-- 3 dedos arriba -> overview de DJ-Shell (script externo, no se migra)
hl.gesture({
  fingers   = 3,
  direction = "up",
  action    = function() hl.exec_cmd(scripts .. "/OverviewToggle.sh") end,
})

-- ==========================================================
--  BLOQUE 2 — DECORACIONES DEL USUARIO
--  (UserConfigs/UserDecorations.conf, sobrescribe el bloque 1)
-- ==========================================================

hl.config({
  general = {
    border_size = 2,
    gaps_in     = 2,
    gaps_out    = 4,
    col = {
      active_border   = palette.color[12],
      inactive_border = palette.color[10],
    },
  },

  decoration = {
    rounding           = 10,
    active_opacity     = 1.0,
    inactive_opacity   = 0.9,
    fullscreen_opacity = 1.0,

    dim_inactive = true,
    dim_strength = 0.1,
    dim_special = 0.8,

    shadow = {
      enabled        = true,
      range          = 3,
      render_power   = 1,
      color          = palette.color[12],
      color_inactive = palette.color[10],
    },

    blur = {
      enabled          = true,
      size = 6,
      passes           = 3,
      new_optimizations = true,
      xray             = true,
      ignore_opacity   = true,
      special          = true,
      popups           = true,
    },
  },

  group = {
    col = {
      border_active = palette.color[15],
    },
    groupbar = {
      col = {
        active = palette.color[0],
      },
    },
  },
})

-- ==========================================================
--  TOUCHPAD — de configs/Laptops.conf
--  $Touchpad_Device = asue1209:00-04f3:319f-touchpad
--  $TOUCHPAD_ENABLED = true
-- ==========================================================

hl.device({
  name = "asue1209:00-04f3:319f-touchpad",
  enabled = true,
})
