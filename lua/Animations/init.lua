-- ================================================
--                ᯓᡣ𐭩Djxs4n.ᐟ⊹
--              DJXS4N DOTFILES
--          HYPRLAND 0.56 - CONF LUA
--        Animaciones / Curvas y animaciones
-- ================================================

hl.config({
  animations = {
    enabled = true,
  },
})

-- ==========================================================
--  CURVAS — "bezier = nombre, x1, y1, x2, y2"
--  ->  hl.curve(nombre, { type = "bezier", points = {...} })
-- ==========================================================


hl.curve("linear",        { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("md3_standard",  { type = "bezier", points = { {0.2, 0},     {0, 1}       } })
hl.curve("md3_decel",     { type = "bezier", points = { {0.05, 0.7},  {0.1, 1}     } })
hl.curve("md3_accel",     { type = "bezier", points = { {0.3, 0},     {0.8, 0.15}  } })
hl.curve("overshot",      { type = "bezier", points = { {0.05, 0.9},  {0.1, 1.1}   } })
hl.curve("crazyshot",     { type = "bezier", points = { {0.1, 1.5},   {0.76, 0.92} } })
hl.curve("hyprnostretch", { type = "bezier", points = { {0.05, 0.9},  {0.1, 1.0}   } })
hl.curve("fluent_decel",  { type = "bezier", points = { {0.1, 1},     {0, 1}       } })
hl.curve("easeInOutCirc", { type = "bezier", points = { {0.85, 0},    {0.15, 1}    } })
hl.curve("easeOutCirc",   { type = "bezier", points = { {0, 0.55},    {0.45, 1}    } })
hl.curve("easeOutExpo",   { type = "bezier", points = { {0.16, 1},    {0.3, 1}     } })

-- ==========================================================
--  ANIMACIONES — "animation = leaf, enabled, speed, curva, estilo"
--  ->  hl.animation({ leaf=..., enabled=..., speed=..., bezier=..., style=... })
-- ==========================================================

hl.animation({ leaf = "windows",         enabled = true, speed = 3,   bezier = "md3_decel",   style = "popin 60%" })
hl.animation({ leaf = "border",         enabled = true, speed = 10,  bezier = "default" })
hl.animation({ leaf = "fade",           enabled = true, speed = 2.5, bezier = "md3_decel" })
hl.animation({ leaf = "workspaces",     enabled = true, speed = 3.5, bezier = "easeOutExpo", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "md3_decel",   style = "slidevert" })
