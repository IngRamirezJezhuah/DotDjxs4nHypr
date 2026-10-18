Plan de migración .conf → .lua (Hyprland 0.56.2 · JaKooLit v25 · Zorin OS)
Reglas de oro
- Nada se toca en ~/.config/hypr hasta la Fase 3. Todo se escribe en la carpeta aislada.
- Solo se migra la config de Hyprland. hyprlock.conf, hypridle.conf, wallust/, scripts/, UserScripts/, waybar/, etc. permanecen igual (son de otros programas).
- Se conserva el backup hyprland.conf para rollback inmediato.
Estructura destino (según arquitectura_nueva.md)
~/.config/hypr/                  ← SE COPIA AL FINAL
├── hyprland.lua                 ← entrada (reemplaza hyprland.conf)
├── lua/
│   ├── palette.lua              ← NUEVO (colores de wallust, ver P4)
│   ├── env.lua                  ← configs/ENVariables.conf + User ENVariables
│   ├── settings.lua             ← SystemSettings + UserDecorations + UserSettings
│   ├── monitors.lua             ← monitors.conf + LaptopDisplay + Perfil-pantalla (NUEVO)
│   ├── animations.lua           ← UserAnimations.conf (+ Animations/perfil activo)
│   ├── rules.lua                ← WindowRules.conf + User WindowRules + reglas/dj-shell.conf (NUEVO)
│   ├── keybinds.lua             ← Keybinds.conf + UserKeybinds + transiciones-sww.txt (NUEVO)
│   └── autostart.lua            ← Startup_Apps.conf + User Startup_Apps
│   └── user.lua                 ← hueco de anulaciones (UserSettings/UserKeybinds hoy vacíos)

Fase 0 — Preparación (aislado, nada de sistema)
1. Limpiar el repo /home/djxs4n/.config/hypr_lua/DotDjxs4nHypr: borrar borradores (LuaConf/, Lua_Monitors/, Animations/, Config/), renombrar hypland.lua → hyprland.lua y crear lua/.
2. Corregir el bug de sintaxis del borrador (bloquea incluso el parseo): hl.on("hyprland.start". function( → hl.on("hyprland.start", function(. De hecho lua/autostart se encarga.
3. Referencias autoritativas (solo lectura, tienes instaladas): /usr/share/hypr/hyprland.lua y /usr/share/hypr/stubs/hl.meta.lua.
Fase 1 — Módulos (blueprint archivo por archivo)
hyprland.lua (entrada)
- package.path añade ~/.config/hypr/lua/?.lua.
- hl.on("hyprland.start", ...) para initial-boot.sh (una sola vez, respeta .initial_startup_done).
- require en orden: env, settings, monitors, animations, rules, keybinds, autostart; pcall(require, "user").
lua/palette.lua — NUEVO
- Tabla con background, foreground, color[0..15] tomados de wallust/wallust-hyprland.conf (ej. color12 = "rgb(784337)"). La consumen settings.lua y rules.lua.
- Nota: en un cambio de wallpaper con wallust habría que regenerar esta tabla; opcionalmente luego montas una plantilla de wallust que la genere sola (lo dejo como mejora post-migración).
lua/env.lua ← configs/ENVariables.conf
- Cada env = K,V → hl.env("K", "V"). Mantener todos: GDK/QT/XDG/NVIDIA/HYPRCURSOR, DOTS_VERSION,2.3.20.
- Aplica encima el override de UserConfigs/ENVariables.conf (verificar contenido en build).
lua/settings.lua ← SystemSettings.conf + UserDecorations + UserSettings
- Todo en un hl.config({...}) (un solo objeto): general, group, decoration (borders/gaps/opacity/blur/shadow), input (kb_layout latam, repeat, touchpad/touchdevice/tablet), gestures, misc, binds, xwayland, render, cursor, dwindle, master.
- Colores $color10/$color12/... → palette.color[12]… (teteados en hl.config).
- Verifica campo input.touchpad (tap-to-click) y gestures.gesture (lista de tablas { fingers=3, action="horizontal", dispatcher="workspace", ... }) contra el ejemplo oficial.
lua/monitors.lua ← monitors.conf (nwg) + LaptopDisplay + Perfil-pantalla
- hl.monitor({ output="eDP-1", mode="1920x1080@100", position="1920x0", scale=1 }) y el espejo HDMI-A-1.
- Aplicar tu deseo del Perfil-pantalla: eDP-1 1920x1080@144 + addreserved { top = 30 } para la barra DJ-Shell (confirmar nombre exacto del campo reserved en el ejemplo oficial, línea ~18) y HDMI-A-1 preferred, auto, 1.
lua/animations.lua ← UserAnimations.conf
- Beziers → hl.curve(name, { type="bezier", points={{x1,y1},{x2,y2}} }) (linear, md3_standard/decel/accel, overshot, crazyshot, hyprnostretch, fluent_decel, easeInOutCirc, easeOutCirc, easeOutExpo).
- Animaciones → hl.animation({ leaf="windows", enabled=true, speed=3, bezier="md3_decel", style="popin 60%" }), etc.
lua/rules.lua ← WindowRules.conf + User WindowRules + reglas/dj-shell.conf
- windowrule = match:class ^(x)$, tag +browser → hl.window_rule({ match={ class="^(x)$" }, tag="+browser" }). Propiedades al nivel superior (NO dentro de un rule).
- layerrule = ... → hl.layer_rule({ match={ namespace="..." }, blur=true }) (confirmar nombre exacto en meta).
- Regla nueva DJ-Shell: hl.window_rule({ match={ class="^(Dj-Shell)$" }, float=true, move={0,0}, size={"100%","30"}, pin=true, no_initial_focus=true, no_focus=true, no_shadow=true, animation=false }).
- Ojo: size"100% 30" y move "72% 7%" tienen formatos tabla/string; validar con el ejemplo.
lua/keybinds.lua ← Keybinds.conf + UserKeybinds + transiciones-sww.txt
Variables: mainMod="SUPER", scriptsDir, term="kitty", files="thunar". Luego hl.bind(key, dispatcher, { description=..., locked, repeating, mouse }).
Mapeo dispatchers (viejo → nuevo) — la tabla que usarás:
.conf viejo	API Lua
exec, <cmd>	hl.dsp.exec_cmd("<cmd>")
killactive	hl.dsp.window.kill()
fullscreen	hl.dsp.window.fullscreen()
fullscreen, 1	hl.dsp.window.fullscreen({ mode="maximized" })
togglefloating	hl.dsp.window.float()
pseudo	hl.dsp.window.pseudo()
cyclenext	hl.dsp.window.cycle_next()
cyclenext/cycleprev (layoutmsg)	hl.dsp.layout("cyclenext") / ("cycleprev")
addmaster/removemaster/swapwithmaster/togglesplit	hl.dsp.layout("<msg>")
bringactivetotop	hl.dsp.window.alter_zorder({ mode="top" })
movefocus l/r/u/d	hl.dsp.focus({ direction="l" }) (…r/u/d)
movewindow l/r/u/d	hl.dsp.window.move({ direction="l" })
swapwindow l/r/u/d	hl.dsp.window.swap({ direction="l" })
resizeactive <x> <y>	hl.dsp.window.resize({ x=.., y=.. })
movewindow / resizewindow (ratón)	hl.dsp.window.drag() / hl.dsp.window.resize() con { mouse=true }
togglegroup	hl.dsp.group.toggle()
changegroupactive f/b	hl.dsp.group.next() / hl.dsp.group.prev()
moveintogroup l/r	hl.dsp.window.move({ into_group="l" })
moveoutofgroup	hl.dsp.window.move({ out_of_group=true })
workspace m+1/m-1/e+1/e-1	`hl.dsp.focus({ workspace="m+1"
workspace 1..10 / ±1	hl.dsp.focus({ workspace=n })
movetoworkspace <sel>	hl.dsp.window.move({ workspace=<sel>, follow=true })
movetoworkspacesilent <sel>	hl.dsp.window.move({ workspace=<sel>, follow=false })
movetoworkspace special	hl.dsp.window.move({ workspace="special" })
togglespecialworkspace	hl.dsp.workspace.toggle_special("") (P3)
movecurrentworkspacetomonitor l/r/u/d	hl.dsp.workspace.move({ monitor="l" })
setprop active opaque toggle	hl.dsp.window.set_prop({ prop="activeopaque", value="toggle" })
hyprctl dispatch exit 0	hl.dsp.exit()
Flags de bind (sufijos bindXYZ): d=descripción (description="..."), e={ repeating=true }, l={ locked=true }, m={ mouse=true }. Ratón en código de tecla: mainMod .. " + mouse:272".
Nuevos (de tus archivos):
- transiciones-sww.txt → 4 binds SUPER+ALT+[1..4] con hl.dsp.exec_cmd("swww img /home/djxs4n/Imágenes/wallpapers/Anime-Girl-Rain.png --transition-type outer …") (+ wave/grow/random).
- Scriptsitos/ → integrar (Dropterminal, rofi-help, toggle-performance) como binds nuevos opcionales.
- Preservar tus personalizaciones ya insertadas en configs/Keybinds.conf (Steam con notificación "ejecutandose...", code para VS, etc.).
lua/autostart.lua ← Startup_Apps.conf + override de usuario
- hl.on("hyprland.start", function() ... end) ejecutando cada exec-once con hl.dsp.exec_cmd (swww-daemon, dbus/systemctl env, Dropterminal kitty, Polkit.sh, nm-applet/tray, swaync, waybar, qs -c overview, hypridle, Hyprsunset init, cliphist ×2, blueman-applet, ags, KeybindsLayoutInit.sh).
- Aplicar encima el override de UserConfigs/Startup_Apps.conf (revisar en build).
Fase 2 — Validación (antes de tocar el sistema)
1. Sintaxis: luac -p <archivo> o lua -e 'dofile("...")' con el Lua que embebe Hyprland (revisar cuál binario hay en Zorin: lua5.4/luajit).
2. Checklist de cobertura: hoja donde cada bindd del .conf viejo tiene su hl.bind nuevo equivalente (sin olvidar las 3 líneas de combos ALT_L→SHIFT_L del switch de teclado, P3).
3. Commit por módulo en el repo para que puedas seguir tu progreso.
Fase 3 — Despliegue seguro (solo cuando tú digas "ya")
1. mv ~/.config/hypr/hyprland.conf ~/.config/hypr/hyprland.conf.bak (rollback inmediato).
2. Copiar hyprland.lua y lua/ → ~/.config/hypr/ (Hyprland 0.56 da prioridad a hyprland.lua sobre .conf).
3. Salir a pantalla de login (Zorin con .display-manager) y volver a entrar. hyprctl reload NO aplica a Lua; el cambio se carga al arrancar la sesión.
4. Rollback: desde TTY (Ctrl+Alt+F2/F3), borrar hyprland.lua/lua/ y restaurar hyprland.conf.bak; relogin.
Riesgos a vigilar en build (los marco para no ignorarlos)
- Scripts bash que llaman hyprctl dispatch <dispatcher_antiguo> por dentro (p. ej. ChangeLayout.sh, OverviewToggle.sh, KeybindsLayoutInit.sh). JaKooLit v25 ya se compiló para 0.55/0.56, pero conviene revisarlos.
- changegroupactive sin argumento, togglespecialworkspace sin nombre y los combos ALT_L, SHIFT_L no tienen equivalente 1:1 en la API nueva (7. y 13. en pregunta abajo).
- Formato exacto de hl.monitor con addreserved, size/move con porcentajes y set_prop (se confirman contra el ejemplo oficial al escribir, no al volver a leer nada).

## finalmente quedando como 

Decisión final integrada
1. Carpeta: limpiar el repo /home/djxs4n/.config/hypr_lua/DotDjxs4nHypr → hyprland.lua como entrada + módulos en lua/ (git conserva historial).
2. Combos de layout (ALT_L→SHIFT_L, SHIFT_L→ALT_L): se replican con hl.define_submap + hl.bind → hl.dsp.submap(...) simulando la secuencia de dos teclas, ejecutando KeyboardLayout.sh switch / Tak0-Per-Window-Switch.sh.
3. Binds sin equivalente: NO se implementan ahora (changegroupactive sin arg + togglespecialworkspace sin nombre), pero se deja lua/PENDIENTES.md documentándolos con su línea original del .conf y su uso en v2.3.20, por si quieres implementarlos a futuro.
4. Paleta: plantilla de wallust que genere lua/palette.lua automáticamente en cada cambio de wallpaper (además de la copia estática inicial para que el primer arranque funcione).
Orden de ejecución (Fases 0–3)
- Fase 0: limpiar repo + rename hypland.lua→hyprland.lua + crear lua/ + corregir el bug de sintaxis del borrador.
- Fase 1 (en este orden, para que puedas escribir cada uno): palette.lua → env.lua → settings.lua → monitors.lua → animations.lua → rules.lua → keybinds.lua (con la tabla de mapeo y los submaps) → autostart.lua → user.lua → PENDIENTES.md.
- Fase 2: validación de sintaxis (luac -p / lua -e dofile), checklist de cobertura bind por bind contra Keybinds.conf, commit por módulo.
- Fase 3 (solo con tu OK): backup hyprland.conf→.bak, copiar hyprland.lua+lua/ a ~/.config/hypr, relogin, y rollback desde TTY si algo falla.

