# Guia de plan para seguir para hacer el mpv para la migracion de lua
📋 Plan de ejecución — Fases A–F
Fase A — Arreglos inmediatos
1. Renombrar lua/Setting/ → lua/Settings/ (desbloquea require("Settings")).

2. Limpiar lua/PENDIENTES.md (solo encabezado + tabla de 2 binds pendientes).
Puedo hacerla yo al salir del modo plan (es solo mv + poda), o te paso los comandos.

Fase B — Sesión 7: lua/Keybinds/init.lua (lo escribís vos, te lo doy en 3 bloques)

- Variables: mainMod, scriptsDir, UserScripts, term="kitty", files="thunar" (de 01-UserDefaults.conf).

- ~130 binds organizados por secciones: Estándar/Extras → Sistema → Layout → Ratón → Workspaces (loops for i=1,10 con code:10..19) → Media/Fn → Screenshots → Resize/Move/Swap → Grupos → Focus → Laptops → sww → Scriptsitos.

- Mapeos clave (todos verificados contra wiki/stubs esta sesión):

- Combos ALT_L↔SHIFT_L → bind directo "ALT_L + SHIFT_L" con {locked, non_consuming} (decisión confirmada).

- splitratio 0.3 → hl.dsp.layout("splitratio 0.3") (arregla lo que está roto desde 0.54).

- workspaceopt allfloat → exec_cmd("hyprctl dispatch workspaceopt allfloat") (runtime-check).

- ALT+TAB → función única con hl.dispatch(window.cycle_next()) + hl.dispatch(window.bring_to_top()) (patrón de la wiki).

- bindd/bindeld/bindld/bindmd → flags description/repeating/locked/mouse según corresponda; nombres de teclas verbatim del conf actual (probados hoy).

- Asignaciones confirmadas: SUPER+SHIFT+Return → Scriptsitos/Dropterminal.sh (reemplaza al de JaKooLit), SUPER+D → launcher rofi (se mantiene), rofi-help → SUPER+SHIFT+H (propuesto, te lo marco al escribir por si quieres otra), SUPER+SHIFT+X → toggle-performance.

- Los 2 binds sin equivalente siguen documentados en PENDIENTES (no se implementan).

Fase C — Sesión 8: lua/Autostart/init.lua (lo escribís vos, 1 bloque)
- Un solo hl.on("hyprland.start", …) con todo en orden: initial-boot.sh → swww-daemon → dbus/systemctl → Dropterminal vendor → Polkit → nm-applet/nm-tray → swaync → waybar → qs overview → hypridle → Hyprsunset init → cliphist ×2 → blueman → ags → KeybindsLayoutInit.sh → ChangeLayout.sh init → cursor ×3 (duplicados, una sola vez).
- Nota: el vendor arranca scripts/Dropterminal.sh al boot (línea 19) — se mantiene 1:1, te lo marco por si lo quieres quitar.

Fase D — Plantilla wallust (decisión: ahora)
1. Regenerar lua/Env/palette.lua con los colores actuales (background rgb(2B2B2C), color12 rgb(918375), etc.).
2. Crear ~/.config/wallust/templates/palette.lua (Jinja2, mismo formato que colors-hyprland.conf).
3. Añadir a wallust.toml: hyprlua.template = 'palette.lua' → hyprlua.target = '~/.config/hypr/lua/Env/palette.lua'.
4. Limitación conocida: al cambiar wallpaper la paleta se regenera, pero Hyprland no recarga Lua en caliente → colores nuevos efectivos en el próximo login (mejora opcional futura: comandos hyprctl keyword post-wallust).

Fase E — Validación final
- luac -p de los 9 archivos + carga con hl simulado en orden (detecta errores de ejecución/nil).
- Ya está hecho el cruce de campos de Settings/Monitors/Animations/Rules/Env contra el meta oficial.

Fase F — Despliegue (solo con tu "va")
1. Copiar Scriptsitos/* → ~/.config/hypr/UserScripts/.
2. hyprland.conf → .bak; copiar hyprland.lua + lua/ a ~/.config/hypr/.
3. Relogin (hyprctl reload no aplica a Lua) y checklist de verificación: binds ALT+TAB, combos de layout, gestos, monitores, bordes/wallust, scripts Fn.
4. Rollback desde TTY si algo falla.

⚠️ Verificaciones post-login (riesgos vigilados)
move/size en tabla (Rules) · combos directos (fallback submap documentado) · workspaceopt · colores al cambiar wallpaper · bitdepth,100.
