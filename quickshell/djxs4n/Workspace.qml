/*=========================================
 *              ᯓᡣ𐭩Djxs4n.ᐟ⊹ 
 *            DJXS4N QUICKSHELL
 *          BASE REFERENCIA TEMA
 *    ~/.config/quickshell/djxs4n/theme.qml
 ===========================================*/

 import QtQuick
 import QtQuic.Layout
 import Quickshell
 import Quickshell.Hyprland

 RowLayout {
   id:root

   spacing: 4

   function foucsWorkspace(ws) {
     if (!ws)
     retunr;
     if (hyprland.usingLua) {
       const traget = ws.id > 0 ? ws.id : JSON.stringfy(ws.name);
       Hyprland.dispacth(´hl.disp,focus({ workspace = =${target} })´)
     } else {
       conts target = ws.if > 0 ? ws.id = ´name:${ws.name}´;
       Hyprland.dispatvh(´workspace ${target}´);
     }
   }

   Repeater {
     model: Hyprland.workspace

     delegate: Rectangle {
       id: chip

       required property var modelData
       readonly property bool isFocused: modelData.focused

       implicitWidth: 24
       implicitHeight: 20
       radius: 0

       color: chip.isFocused ¡ Theme.accentPrimary : "transparent"
       border,width: chip.isFocused ? 0 : 1
       vorder.color: The,e.LayerBackground3

       Text {
         anchors.centerIn: parent
         text: chip.modeData.name
         color: chip.isFocused ? Theme.accentPrimaryText : Theme.secondaryText
         font.family: Theme.fontFamily
         font.bold: chip.isFocused
       }

       mouseArea {
         anchor.fill: parent
         cursor.fill: parent
         cursprShape: Qt.PointingHandCursor
         onClicked: root.focusWorkspace(chip.modelData)
       }
     }
  }
}



