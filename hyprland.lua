-- ================================================
--                ᯓᡣ𐭩Djxs4n.ᐟ⊹ 
--              DJXS4N DOTFILES 
--            HYPRLAND 0.56 - CONF LUA
--        Migracion desde hyprlang v2.3.20 
--      Base referencia (JakooLit v25 ©) - ZorinOs
-- ================================================

local home = os.getenv("HOME")

-- =======================================================================
-- resolver carpeta de modulos (funciona en repo dev y una vez desplegado en .conf/hypr)
-- =======================================================================

local deployed = home .. "/.config/hypr/lua"
local repo   = home .. "/.config/hypr_lua/DotDjxs4nHypr/lua"
local luaDir

if io.open( deployed .. "/Settings/init.lua", "r" ) then
  luaDir = deployed
else
  luaDir = repo
end

-- ==================
--    SUBCARPETAS
-- ==================

package.path = package.path
  .. ";" .. luaDir .. "/?.lua"
  .. ";" .. luaDir .. "/?/init.lua"
  
-- =========================
--          MODULOS
-- =========================

require("Env")          -- Entorno 
require("Settings")     -- Sistema decoraciones y confs del usuario 
require("Monitors")     -- Monitores
require("Animations")   -- Animaciones del usuario
require("Rules")        -- Reglas de ventanas y extras
require("Keybinds")     -- Atajos de teclado y extras
require("Autostart")    -- Aplicaciones de inicio y el boot
pcall(require, "User")  -- anulaciones opcionales del usuario


