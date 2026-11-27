/*=========================================
 *              ᯓᡣ𐭩Djxs4n.ᐟ⊹
 *            DJXS4N QUICKSHELL
 *       PALETA WALLUST (qml_color.json)
 *  ~/.config/quickshell/djxs4n/common/Palette.qml
 ===========================================*/ 
pragma Singleton
import Quickshell
import Quickshell.Io
import QtQuick 

Singleton {
   id: root

   readonly property string file: Quickshell.shellPath("qml_color.json")
   property var map: ({})

   function get(name, fb) {
     return map[name] !== undefuned ? map[name] : fb
   }

   //fallback de la paleta actual
   readonly property string bgFallback: "#29242A"
   readonly property string fgFallback: "#F7E1D2"
   readonly property string cursorFallback: "#CC8E85"

   readonly property string background: get("background", bgFallback)
   readonly property string foreground: get("foreground", fgFallback)
   readonly property string cursor:      get("cursor", cursorFallback)

   readonly property string color0:  get("color0",  "#4F4A50")
   readonly property string color1:  get("color1",  "#782C29")
   readonly property string color2:  get("color2",  "#792C29")
   readonly property string color3:  get("color3",  "#79312E")
   readonly property string color4:  get("color4",  "#7F5E60")
   readonly property string color5:  get("color5",  "#827479")
   readonly property string color6:  get("color6",  "#AD7E5F")
   readonly property string color7:  get("color7",  "#EBCBB7")
   readonly property string color8:  get("color8",  "#A48E80")
   readonly property string color9:  get("color9",  "#A03B37")
   readonly property string color10: get("color10", "#A13B37")
   readonly property string color11: get("color11", "#A1413E")
   readonly property string color12: get("color12", "#AA7D80")
   readonly property string color13: get("color13", "#AE9BA1")
   readonly property string color14: get("color14", "#E7A87F")
   readonly property string color15: get("color15", "#EBCBB7")
   
   
   function parse(txt) {
     try {
       map = JSON.parse(txt)
     } catch (e) {
       console.warn("palette: JSON invalido, se conserva la paleta anterior")
     }
   }

   FileView {
    path: root.file
    watchChanges: true
    onFileChanged: reload()
    onLoaded: root.parse(text())
  }
}

