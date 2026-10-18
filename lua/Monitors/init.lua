-- ================================================
--                ᯓᡣ𐭩Djxs4n.ᐟ⊹
--              DJXS4N DOTFILES
--          HYPRLAND 0.56 - CONF LUA
--            Monitors / Perfil de pantalla
-- ================================================

--   TODO en UNA sola llamada: dos hl.monitor() sobre el mismo output
--   pueden no fusionar igual que en hyprlang.

--hl.monitor({
--  output   = "eDP-1",
--  mode     = "1920x1080@144",
--  position = "0x0",
--  scale    = 1,
--  reserved = 30,
--})

-- Monitor externo por HDMI (independiente, sin mirror)
-- hl.monitor({
--  output   = "HDMI-A-1",
--  mode     = "preferred",
--  position = "auto",
--  scale    = 1,
-- })

-- Pantalla nativa de la lap
hl.monitor({
  output   = "eDP-1",
  mode     = "1920x1080@100.0",
  position = "1920x0",
  scale    = 1.0,
  bitdepth = 100,
})

-- Monitor externo por HDMI
hl.monitor({
  output   = "HDMI-A-1",
  mode     = "preferred",
  position = "auto",
  scale    = 1,
  mirror   = "eDP-1",
})
