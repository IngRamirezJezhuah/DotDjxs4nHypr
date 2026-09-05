-- ===============================
--          DJXS4N DOTS
--    CONFIGURACION DEL SISTEMA
-- ===============================

local scriptDir = os.getenv("HOME") .. "/.config/hypr/scripts"

hl.config({
  -- layout Dwine
  dwine = {
    preserve_split = true,
    special_scale_factor = 0.8,
  },
  -- Layout Master
  master = {
    new_status = "master",
    new_on_top = 1,
    mfact = 0.5,
  },
  -- Opciones Generales
  general = {
    resize_on_border = true,
    layout = "dwindle",
  },
  
  -- Opciones de enrtada (raton,teclado,touchpad,tablet y esas weas)
  input ={
    kb_layout = "latam",
    kb_variant = "",
    kb_model = "",
    kb_rules = "",
    repeat_rate = 50,
    repeat_delay = 300,
    sensitivity = 0,
    numlock_by_default = true,
    left_handed = false,
    follow_mouse = 1,
    float_switch_override_focus = false,

    touchpad = {
      disable_while_typing = true,
      natural_scroll = true,
      clickfinger_behavoir = false,
      middle_button_emulation = false,
      tap_to_click = true,
      drag_lock = false,
    },

    touchdevice = {
      enabled = true,
    },

    tablet = {
      transform = 0,
      left_handed = 0,
    },
  },

  -- Gestos en pantalla / Touchpad
  gestures ={
    workspace_swipe_distance = 500,
    workspace_swipe_invert = true,
    workspace_swipe_min_speed_to_force = 30,
    workspace_swipe_cancel_ratio = 0.5,
    workspace_swipe_forever = true,
  },
  
  -- Ajustes de rendimiento y compatibilidad
  misc = {
    disble_hyprland_logo = true,
    disble_splash_rendering = true,
    vrr = 2,
    mouse_move_enables_dpms = true,
    enable_swallow = false,
    swallow_regex = "^(kitty)$",
    focus_on_activate = false,
    initial_workspace_tracking = 0,
    middle_click_paste = false,
    enable_anr_dialog = true,
    anr_missed_pings = 15,
    allow_session_lock_restore = true,
    on_focus_under_fullscreen = 1,

  },

  -- binds Opciones
  binds = {
    workspace_back_and_forth = true,
    allow_workspace_cycles = true,
    pass_mouse_when_bound = false,

  },

  -- Servidor XWayland
  xwayland = {
    enabled = true,
    force_zero_scaling = true,

  },

  -- Opciones de renderizado
  render = {
    direct_scanout = 0,

  },

  -- Configuraciones del cursor
  cursor = {
    sync_gsettings_theme = true,
    no_hardware_cursors = 1,
    enabled_hyprcursor = true,
    wrap_on_change_workspace = 2,
    no_warps = true,
  },

})

-- ================================
--      GESTOR PERSONALIZADO
--            BINDINGS
-- ================================

hl.bind("3, horizontal", hl.dsp.workspace("e+1"), {flags = { "g" }, description = "gessture horizontal workspace" })

hl.bind("4, up", hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor)\"$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor * 1.5}')\""), { flags = { "g" } })
hl.bind("4, down", hl.dsp.exec_cmd("hyprctl keyword cursor:zoom_factor \"$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor / 1.5}')\""), { flags = { "g" } })
hl.bind("3, up", hl.dsp.exec_cmd(scriptsDir .. "/OverviewToggle.sh"), { flags = { "g" } })
