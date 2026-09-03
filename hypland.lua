-- ========================================
--            DJXS4N  DOTFILES
--        Migracion de .conf a .lua
-- ========================================

-- añadir directorio 'lua/' a la ruta de ejecucion
package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/hypr/lua/?.lua"

hl.on("hyprland.start". function()
  hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/intial-boot.sh")
end)

-- ===================
--       Modulos
-- ====================

require("env")
require("monitors")
require("settings")
require("animations")
require("rules")
require("keybinds")
require("autostart")


pcall(require, "user")

