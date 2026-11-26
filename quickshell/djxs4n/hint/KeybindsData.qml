/*==============================================
 *              ᯓᡣ𐭩Djxs4n.ᐟ⊹ 
 *            DJXS4N QUICKSHELL
 *         LISTA DE KEYBINDS (A MANO)
 *  ~/.config/quickshell/djxs4n/KeybindData.qml
 ===============================================*/
 pragma Singleton
 import QtQuick

 QtObject {
   readonly property var sections: [
     {  title: "Apps", items: [
       { k: "SUPER + Return", d: "Terminal" },
       { k: "SUPER + SHIFT + Return", d: "Terminal desplegable" },
       { k: "SUPER + D", d: "Lanzador de apps" },
       { k: "SUPER + B", d: "Navegador" },
       { k: "SUPER + E", d: "Archivos" },
       { k: "SUPER + V", d: "VS Code" },
       { k: "SUPER + S", d: "Steam" },
       { k: "SUPER + A", d: "Vista del escritorio" },
     ]},
     { title: "Ventanas", items: [
       { k: "SUPER + Q", d: "Cerrar ventana" },
       { k: "SUPER + SHIFT + Q", d: "Terminar proceso" },
       { k: "SUPER + SHIFT + F", d: "Pantalla completa" },
       { k: "SUPER + CTRL + F", d: "Maximizar" },
       { k: "SUPER + SPACE", d: "Flotante on/off" },
       { k: "SUPER + Flechas", d: "Enfocar" },
       { k: "SUPER + CTRL + Flechas", d: "Mover" },
       { k: "SUPER + ALT + Flechas", d: "Intercambiar" },
       { k: "SUPER + SHIFT + Flechas", d: "Redimensionar" },
       { k: "ALT + TAB", d: "Siguiente ventana" }
     ]},
     { title: "Workspaces", items: [
       { k: "SUPER + 1..0", d: "Ir al Workspace" },
       { k: "SUPER + SHIFT + 1..0", d: "Mover ventana" },
       { k: "SUPER + CTRL + 1..0", d: "Mover en silencio" },
       { k: "SUPER + . / ,", d: "Siguiente / Anterior" },
       { k: "SUPER + rueda", d: "Siguiente / Anterior" },
       { k: "SUPER + SHIFT + U", d: "Workspace especial" }
     ]},
     { title: "Sistema", items: [
       { k: "SUPER + H", d: "Esta Hoja" },
       { k: "SUPER + SHIFT + L", d: "Bloquear Pantalla" },
       { k: "CTRL + ALT + P", d: "Menu de energia" },
       { k: "SUPER + SHIFT + N", d: "Centro Notificaciones" },
       { k: "SUPER + N", d: "Luz Nocturna" },
       { k: "SUPER + W", d: "Selector de Wallpaper" },
       { k: "SUPER + T", d: "Tema Global" },
       { k: "SUPER + Print", d: "Captura por tiempo" },
       { k: "SUPER + SHIFT + S", d: "Captura (swappy)" },
       { k: "SUPER + ALT + R", d: "Refrescar la barra" },
       { k: "CTRL + ALT + Delete ", d: "Salir de Hyprland" },
       { k: "SUPER + CTRL + P", d: "Waylougt" },
     ]}
   ]
 }
