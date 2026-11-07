
# Cosas por hacer 

1. Pulido visual + layout robusto (bajo riesgo): padding/altura/alineación, tipografía consistente, 
estados hover/activo de workspaces, radio/borde desde Theme, separadores, evitar que el texto se corte. 
Sin tocar Hyprland dispatch.

2. Workspaces mejorados (riesgo bajo-medio, solo lectura primero): 
mostrar Hyprland.focusedWorkspace/monitor correcto si es que hace falta, filtrar workspaces 
especiales/IDs raros, indicador de “ocupado” (toplevels) — primero solo visual

3. Ventana activa (título/app) (medio): módulo que lea el toplevel/ventana activa de Hyprland vía 
Quickshell.Hyprland (solo lectura). Útil y acotado.

4. Módulos de estado (medio, por servicio): audio (PipeWire/WP), red, batería, bandeja 
conviene uno por uno (dependen de módulos Quickshell disponibles: Services.*/Io/DBus ).

5. Interacción/popups (medio-alto): botones que abran PanelWindow/PopupWindow/menus; 
aquí sí hay que cuidar layer-shell/foco/WlrLayershell.

6. Estructura y migración (cuando sea estable): qmldir completo, carpetas bar/widgets/theme/services, 
luego mover/duplicar a ~/.config/quickshell/djxs4n y, al final, integrar autostart/sesión dedicada 
