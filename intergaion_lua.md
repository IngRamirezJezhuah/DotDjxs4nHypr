# Documentacion y sinyaxis guia para esto

para uwe se pueda replicar la logica de el comportamiento y crear los modulos de la carpera lua/, se usa la sintaxis oficial de la api de lua de hypland

 
```lua
package.path = package.path .. ";" .. os.getenv("HOME") .. "/config/hypr/lua/?.lua"
```

esto se usa asi para que permita que  lua sepa donde se buscara los archivos que escrbio , cuando se usa el require, para que sepa doned esta
en este caso se aplica asi para todos los archivos que acaben en .lua

## Variables de entorno (hl.env)
en .oconf se escribira como env = VAR, valor, en la nueva sintaxis se usa
la funcion de `hl.env()` :
```lua
hl.env("XCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATAFORM", "wayland")
```

## Eventos de inicio (hl.on) i Dispatcehrs (hl.dsp)

En los `.conf` se usaba el exec-once = comando, en lua se agrupa dentro de una fucnion de eventp usando `hl.on("hyprlamd.start", ...)`: 

```lua
hl.on("hyprland.start", function()
    hl.dsp.exec_cmd("waybar")
    hl.dsp.exec_cmd("hypridle")
end)
```

hl.dsp significa Hyprland Dispatcehr contiene las fucniones ejecutoras del compositor como exec_cmd, killactive, togglefloatting, etc.

## Tablas de Configuracion (hl.config)

Las secciones como general { ... } oh input { ... }
 en .conf ahora son tablas de lua estructuradas y pasadas a hl.comfig():

``` lua
hl.config({
    general = {
    gaps_in = 5,
    gaps_out = 7,
    border_size = 2,
    },
    input = {
    kb_layout = "us,es",
    repeat_rate = 25,
    }
})
```

# Atajos de teclado (hl.bind)

en la version de .conf se excribia como :

```conf
bind = SUPER, Q, exec, kitty
```

en lua

```lua
local mainMod = "SUPER"
-- lanzar aplicacion
hl.bind(mainMod .. " + Q", jl.dsp.exec_cmd("kitty"))

-- acciones de sistema
hl.bind(mainMod .. " + C", hl.dsp.killactive())

```

