-- ========================================
--            DJXS4N DOTFILES
--               LAPTOPS/PC
--  ~/.config/hypr/LuaConf/Laptops.lua
-- ========================================

-- tux = 
local tux = "SUPER"
local scriptsDir = os.getenv("HOME") .. "/.config/hypr/scripts"
local Touchpad_Device = "asue1209:00-04f3:319f-touchpad"

-- TECLAS MULTIMEDIA
hl.bind(" + xf86MonBrightnessDown", hl.dsp.exec_cmd(scriptsDir .. "/Brightness.sh --dec"), { flags = { "e" } })
hl.bind(" + xf86MonBrightnessUp", hl.dsp.exec_cmd(scriptsDir .. "/Brightness.sh --inc"), { flags = { "e" } })
hl.bind(" + xf86TouchpadToggle", hl.dsp.exec_cmd(scriptsDir .. "/TouchPad.sh"))

-- CONFIGURACION POR DISPOSITIVOS
hl.config({
  device = {
    name = Touchpad_Device,
    enabled = true,
  }
} 
